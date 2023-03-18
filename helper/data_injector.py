import psycopg2, random, string
import names
from random_username.generate import generate_username
import bcrypt
from datetime import datetime, timedelta
from faker import Faker

faker = Faker()

def connect_db():
    try:
        conn = psycopg2.connect("dbname=vine")
        cur = conn.cursor()
    except (Exception, psycopg2.DatabaseError) as error:
        print(error)
    return conn, cur

def generate_bcrypt_hash(password):
    return bcrypt.hashpw(password.encode('utf-8'), b'$2b$12$spvL8Vjm3rIgqj7f5GvIEu')

def reset_sequence(cur, conn, table_name, sequence_name):
    sql = """SELECT setval('%s', (SELECT MAX(%s) FROM %s));"""
    try:
        cur.execute(sql % (table_name+"_"+sequence_name+"_seq", sequence_name, table_name))
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print('reset sequence failed:', error)

def delete_rows_below_id(cur, conn, table_name, id):
    sql = """DELETE FROM %s WHERE %s < %s;"""
    try:
        cur.execute(sql % (table_name, id, id))
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print('delete rows failed:', error)

def generate_random_country():
    countries = ['India', 'USA', 'UK', 'Australia', 'Canada', 'Germany', 'France', 'Italy', 'Spain', 'Russia']
    return countries[random.randint(0, len(countries) - 1)]

def generate_random_age():
    return random.randint(14, 38)

def generate_random_date(start_date, end_date):
    days = (end_date - start_date).days
    random_days = random.randrange(days)
    return (start_date + timedelta(days=random_days)).strftime('%Y-%m-%d')

def generate_random_email(first_name, username):
    email_domains = ['gmail.com', 'yahoo.com', 'hotmail.com', 'outlook.com', 'aol.com']
    return (first_name + username[-random.randint(2,6):]).lower() + '@' + email_domains[random.randint(0, len(email_domains) - 1)]

def generate_random_user():
    first_name = names.get_first_name()
    last_name = names.get_last_name()
    country = generate_random_country()
    dob = generate_random_date(datetime(1986, 1, 1), datetime(2009, 12, 31))
    username = generate_username(1)[0]
    email = generate_random_email(first_name, username)
    pwd_hash = str(generate_bcrypt_hash(email[:5] + '@123!'))
    is_email_verified = random.choice([True, False])
    is_2fa_enabled = random.choice([True, False])
    return (first_name, last_name, country, dob, username, email, pwd_hash, is_email_verified, is_2fa_enabled)

def insert_auth(cur, conn, email, pwd_hash, is_email_verified, is_2fa_enabled):
    sql_auth = """INSERT INTO auth(email, pwd_hash, is_email_verified, is_2fa_enabled)
             VALUES(%s, %s, %s, %s) RETURNING auth_id;"""
    try:
        cur.execute(sql_auth, (email, pwd_hash, is_email_verified, is_2fa_enabled))
        auth_id = cur.fetchone()[0]
        conn.commit()
        return auth_id
    except (Exception, psycopg2.DatabaseError) as error:
        print('auth insert failed:', error)
        return -1

def insert_user(cur, conn, first_name, last_name, country, dob, username, auth_id):
    sql_user = """INSERT INTO user_profile (first_name, last_name, dob, country, username, auth_id)
             VALUES(%s, %s, %s, %s, %s, %s) RETURNING user_id;"""
    # print(first_name, last_name, country, age, username, auth_id)
    try:
        cur.execute(sql_user, (first_name, last_name, dob, country, username, auth_id))
        user_id = cur.fetchone()[0]
        conn.commit()
        return user_id
    except (Exception, psycopg2.DatabaseError) as error:
        print('user insert failed:', error)
        return -1

def insert_video_stats(cur, conn, views, likes, dislikes, comments):
    sql_stats = """INSERT INTO video_stats (views, likes, dislikes, comments)
             VALUES(%s, %s, %s, %s) RETURNING stats_id;"""
    try:
        cur.execute(sql_stats, (views, likes, dislikes, comments))
        stats_id = cur.fetchone()[0]
        conn.commit()
        return stats_id
    except (Exception, psycopg2.DatabaseError) as error:
        print('stats insert failed:', error)
        return -1

def insert_video(cur, conn, title, description, video_url, age_restricted, is_private, video_length, uploaded_on, user_id, stats_id):
    sql_video = """INSERT INTO video (title, description, video_url, age_restricted, is_private, video_length, uploaded_on, user_id, stats_id)
             VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s) RETURNING video_id;"""
    try:
        cur.execute(sql_video, (title, description, video_url, age_restricted, is_private, video_length, uploaded_on, user_id, stats_id))
        video_id = cur.fetchone()[0]
        conn.commit()
        return video_id
    except (Exception, psycopg2.DatabaseError) as error:
        print('video insert failed:', error)
        return -1


def list_tables(cur):
    sql = """SELECT table_name FROM information_schema.tables WHERE table_schema = 'public'"""
    cur.execute(sql)
    tables = cur.fetchall()
    return tables

def inject_users(num_users=100):
    conn, cur = connect_db()
    # reset_sequence(cur, conn, 'auth', 'auth_id')
    # reset_sequence(cur, conn, 'user_profile', 'user_id')
    for _ in range(num_users):
        first_name, last_name, country, dob, username, email, pwd_hash, is_email_verified, is_2fa_enabled = generate_random_user()
        auth_id = insert_auth(cur, conn, email, pwd_hash, is_email_verified, is_2fa_enabled)
        if auth_id != -1:
            user_id = insert_user(cur, conn, first_name, last_name, country, dob, username, auth_id)
            if user_id != -1:
                print("[%s] %s inserted successfully" %(user_id, username))
    cur.close()
    conn.close()

def get_user_id_range():
    conn, cur = connect_db()
    sql = """SELECT MIN(user_id), MAX(user_id) FROM user_profile;"""
    cur.execute(sql)
    user_id_range = cur.fetchone()
    cur.close()
    conn.close()
    return user_id_range

def get_all_user_ids():
    conn, cur = connect_db()
    sql = """SELECT user_id FROM user_profile;"""
    cur.execute(sql)
    user_ids = cur.fetchall()
    cur.close()
    conn.close()
    if user_ids:
        return set(user_id[0] for user_id in user_ids)

def generate_random_video():
    global faker
    title = faker.sentence()[:-1]
    description = faker.text()
    video_url = f"https://cdn{random.randint(0,4)}.localhost.net/origin/{random.randint(512, 2048)}/videos/{''.join(random.choices(string.ascii_letters, k=8))}.mp4"
    age_restricted = faker.boolean(1)   
    is_private = faker.boolean(4)
    video_length = random.randint(1, 60)
    existing_users = get_all_user_ids()
    user_id = random.choice(tuple(existing_users))
    views = random.randint(1, 1000)
    likes = dislikes = comments = 0
    uploaded_on = generate_random_date(datetime(2023, 3, 1), datetime.now())
    return (title, description, video_url, age_restricted, is_private, video_length, uploaded_on, user_id, views, likes, dislikes, comments)

def inject_videos(num_videos=100):
    conn, cur = connect_db()
    # reset_sequence(cur, conn, 'video_stats', 'stats_id')
    # reset_sequence(cur, conn, 'video', 'video_id')
    for _ in range(num_videos):
        title, description, video_url, age_restricted, is_private, video_length, uploaded_on, user_id, views, likes, dislikes, comments = generate_random_video()
        stats_id = insert_video_stats(cur, conn, views, likes, dislikes, comments)
        if stats_id != -1:
            video_id = insert_video(cur, conn, title, description, video_url, age_restricted, is_private, video_length, uploaded_on, user_id, stats_id)
            if video_id != -1:
                print("[%s] %s inserted successfully" %(video_id, title))
    cur.close()
    conn.close()

def insert_follower(cur, conn,follower_id, following_id):
    sql_follower = """INSERT INTO follow (follower_id, following_id)
             VALUES(%s, %s);"""
    try:
        cur.execute(sql_follower, (follower_id, following_id))
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print('follower insert failed:', error)
        conn.rollback()

def inject_followers(num_followers=100):
    conn, cur = connect_db()
    existing_users = get_all_user_ids()
    for _ in range(num_followers):
        follower_id = random.choice(tuple(existing_users))
        following_id = random.choice(tuple(existing_users))
        if following_id != follower_id:
            insert_follower(cur, conn, follower_id, following_id)
    cur.close()
    conn.close()


def get_all_video_ids():
    conn, cur = connect_db()
    sql = """SELECT video_id FROM video;"""
    cur.execute(sql)
    video_ids = cur.fetchall()
    cur.close()
    conn.close()
    if video_ids:
        return set(video_id[0] for video_id in video_ids)

def increment_video_stats(cur, conn, video_id, column):
    sql = """UPDATE video_stats SET %s = %s + 1 WHERE stats_id = (SELECT stats_id FROM video WHERE video_id = %s);""" %(column, column, video_id)
    try:
        cur.execute(sql)
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print('video stats update failed:', error)
        conn.rollback()

def insert_like(cur, conn, user_id, video_id):
    sql_like = """INSERT INTO likes (user_id, video_id)
             VALUES(%s, %s);"""
    try:
        cur.execute(sql_like, (user_id, video_id))
        conn.commit()
        increment_video_stats(cur, conn, video_id, 'likes')
    except (Exception, psycopg2.DatabaseError) as error:
        print('like insert failed:', error)
        conn.rollback()


def inject_likes(num_likes=100):
    conn, cur = connect_db()
    existing_users = get_all_user_ids()
    existing_videos = get_all_video_ids()
    for _ in range(num_likes):
        user_id = random.choice(tuple(existing_users))
        video_id = random.choice(tuple(existing_videos))
        insert_like(cur, conn, user_id, video_id)
    cur.close()
    conn.close()

def insert_comment(cur, conn, user_id, video_id, comment):
    sql_comment = """INSERT INTO comment (user_id, video_id, content)
             VALUES(%s, %s, %s);"""
    try:
        cur.execute(sql_comment, (user_id, video_id, comment))
        conn.commit()
        increment_video_stats(cur, conn, video_id, 'comments')
    except (Exception, psycopg2.DatabaseError) as error:
        print('comment insert failed:', error)
        conn.rollback()

def inject_comments(num_comments=100):
    conn, cur = connect_db()
    existing_users = get_all_user_ids()
    existing_videos = get_all_video_ids()
    for _ in range(num_comments):
        user_id = random.choice(tuple(existing_users))
        video_id = random.choice(tuple(existing_videos))
        comment = faker.text()
        insert_comment(cur, conn, user_id, video_id, comment)
    cur.close()
    conn.close()

def insert_topic(cur, conn, name, description, locale):
    sql_topic = """INSERT INTO topic (name, description, locale)
             VALUES(%s, %s, %s);"""
    try:
        cur.execute(sql_topic, (name,description, locale))
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print('topic insert failed:', error)
        conn.rollback()

def inject_topics(num_topics=100):
    conn, cur = connect_db()
    for _ in range(num_topics):
        name = faker.word()
        description = faker.text()
        locale = faker.language_code()
        insert_topic(cur, conn, name, description, locale)
    cur.close()
    conn.close()


def get_all_topic_ids():
    conn, cur = connect_db()
    sql = """SELECT topic_id FROM topic;"""
    cur.execute(sql)
    topic_ids = cur.fetchall()
    cur.close()
    conn.close()
    if topic_ids:
        return set(topic_id[0] for topic_id in topic_ids)

def update_tag_count(cur, conn, topic_id):
    sql = """UPDATE topic SET tag_count = tag_count + 1 WHERE topic_id = %s;""" %(topic_id)
    try:
        cur.execute(sql)
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print('tag count update failed:', error)
        conn.rollback()

def insert_tag(cur, conn, video_id, topic_id):
    sql_tag = """INSERT INTO tag (video_id, topic_id)
             VALUES(%s, %s);"""
    try:
        cur.execute(sql_tag, (video_id, topic_id))
        conn.commit()
        update_tag_count(cur, conn, topic_id)
    except (Exception, psycopg2.DatabaseError) as error:
        print('tag insert failed:', error)
        conn.rollback()

def inject_tags(num_tags=100):
    conn, cur = connect_db()
    existing_videos = get_all_video_ids()
    existing_topics = get_all_topic_ids()
    for _ in range(num_tags):
        video_id = random.choice(tuple(existing_videos))
        topic_id = random.choice(tuple(existing_topics))
        insert_tag(cur, conn, video_id, topic_id)
    cur.close()
    conn.close()

def update_comment_count(cur, conn, video_id):
    sql = """UPDATE video_stats SET comments = (SELECT count(*) FROM comment WHERE comment.video_id = %s) WHERE stats_id = (SELECT stats_id FROM video WHERE video_id = %s);""" %(video_id, video_id)
    try:
        cur.execute(sql)
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print('comment count update failed:', error)
        conn.rollback()

def update_like_count(cur, conn, video_id):
    sql = """UPDATE video_stats SET likes = (SELECT count(*) FROM likes WHERE likes.video_id = %s) WHERE stats_id = (SELECT stats_id FROM video WHERE video_id = %s);""" %(video_id, video_id)
    try:
        cur.execute(sql)
        conn.commit()
    except (Exception, psycopg2.DatabaseError) as error:
        print('like count update failed:', error)
        conn.rollback()

def sync_video_stats():
    conn, cur = connect_db()
    existing_videos = get_all_video_ids()
    for video_id in existing_videos:
        update_comment_count(cur, conn, video_id)
        update_like_count(cur, conn, video_id)
    cur.close()
    conn.close()

sync_video_stats()

# inject_users(100)
# inject_videos(20)
# inject_followers(100)
# inject_likes(100)
# inject_comments(100)
# inject_tags(100)