import random
import string
from flask import Flask, request, jsonify
from datetime import datetime, timezone
import psycopg2
import os
from flask_cors import CORS, cross_origin

AUTH_READ = """SELECT user_id from auth JOIN user_profile on auth.auth_id = user_profile.auth_id WHERE email = (%s) AND pwd_hash = (%s);"""

USERS_READ = """SELECT * from user_profile;"""
VIDEOS_READ = """SELECT video_id from video;"""

VIDEO_READ = """SELECT title, description, views, likes, comments, username from video JOIN user_profile ON video.user_id = user_profile.user_id
    JOIN video_stats ON video.stats_id = video_stats.stats_id WHERE video_id = (%s);"""

VIDEO_COMMENTS_READ = """SELECT content, username FROM comment JOIN user_profile ON comment.user_id = user_profile.user_id WHERE video_id = (%s) ORDER BY commented_on DESC LIMIT 3;"""

VIDEO_TOPICS_READ = """SELECT name FROM tag JOIN topic ON topic.topic_id = tag.topic_id WHERE tag.video_id = (%s);"""

USER_READ = """SELECT first_name, last_name, username,
  (SELECT COUNT(*) FROM follow WHERE following_id = user_profile.user_id) as num_followers,
  (SELECT COUNT(*) FROM follow WHERE follower_id = user_profile.user_id) as num_following FROM user_profile WHERE user_profile.user_id = (%s);"""

USER_VIDEOS_READ = """SELECT video_id, title, uploaded_on from video JOIN user_profile ON video.user_id = user_profile.user_id WHERE user_profile.user_id = (%s) ORDER BY uploaded_on DESC LIMIT 10;"""

USER_INSERT = """ WITH auth_insert AS (
    INSERT INTO auth(email, pwd_hash, is_email_verified, is_2fa_enabled)
    VALUES(%s, %s, %s, %s) RETURNING auth_id)
    INSERT INTO user_profile (first_name, last_name, dob, country, username, auth_id)
    VALUES(%s, %s, %s, %s, %s, (SELECT auth_id FROM auth_insert)) RETURNING user_id;"""

VIDEO_INSERT = """ WITH stats_insert AS (
    INSERT INTO video_stats (views, likes, dislikes, comments)
    VALUES(%s, %s, %s, %s) RETURNING stats_id)
    INSERT INTO video (title, description, video_url, age_restricted, is_private, video_length, uploaded_on, user_id, stats_id)
    VALUES(%s, %s, %s, %s, %s, %s, %s, %s,(SELECT stats_id from stats_insert)) RETURNING video_id;"""

TREND_VIDEOS_READ = """SELECT video_id, title, views, likes, comments, username from video JOIN user_profile ON video.user_id = user_profile.user_id 
    JOIN video_stats ON video.stats_id = video_stats.stats_id WHERE uploaded_on > current_date - interval '7 days' ORDER BY views DESC LIMIT 10;"""

POPULAR_USERS_READ = """SELECT user_id, username, first_name, last_name, COUNT(*) as num_followers
    FROM user_profile JOIN follow ON user_profile.user_id = follow.following_id JOIN auth ON user_profile.auth_id = auth.auth_id
    WHERE auth.is_email_verified = True GROUP BY user_profile.user_id ORDER BY num_followers DESC LIMIT 10;"""

POPULAR_TOPICS_READ = """SELECT topic.topic_id, name, COUNT(*) as num_videos FROM tag JOIN topic ON tag.topic_id = topic.topic_id GROUP BY topic.topic_id ORDER BY num_videos DESC LIMIT 10;"""

VIDEOS_BY_TOPIC_READ = """SELECT video.video_id, title, views, username from video JOIN tag ON video.video_id = tag.video_id JOIN topic ON tag.topic_id = topic.topic_id 
    JOIN user_profile ON video.user_id = user_profile.user_id JOIN video_stats ON video.stats_id = video_stats.stats_id WHERE
    topic.name = (%s) ORDER BY views DESC LIMIT 10;"""

url = os.environ.get("DATABASE_URL")
try:
    connection = psycopg2.connect(url)
    print("Connected to the database: ", url)
except Exception as e:
    print("Unable to connect to the database", url, e)
app = Flask(__name__)
cors = CORS(app)
# app.config['CORS_HEADERS'] = 'Content-Type'


@app.route("/api/login", methods=["POST"])
def login():
    data = request.get_json()
    email, pwd_hash = data["email"], data["pwd_hash"]
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(AUTH_READ, (email, pwd_hash,))
            row = cursor.fetchone()
    print(row)
    if row is None:
        response = jsonify(status=1, message="Incorrect email/ password")
    else:
        user_id = row[0]
        response = jsonify(
            status=0, user_id=f"{user_id}", message="login successful")

    # response.headers.add('Access-Control-Allow-Origin', '*')
    return response


@app.route("/api/register", methods=["POST"])
def register():
    data = request.get_json()
    first_name, last_name, username, email, pwd_hash, dob, country = data["firstName"], data[
        "lastName"], data["username"], data["email"], data["pwd_hash"], data["dob"], data["country"]
    try:

        with connection:
            with connection.cursor() as cursor:
                cursor.execute(USER_INSERT, (email, pwd_hash, True,
                               False, first_name, last_name, dob, country, username))
                row = cursor.fetchone()
        if row is None:
            response = jsonify(
                status=1, message="Registration failed. Please try again.")
        else:
            user_id = row[0]
            response = jsonify(
                status=0, user_id=f"{user_id}", message="Successfully registered")
    except:
        response = jsonify(
            status=1, message="Registration failed. Please try again.")

    return response


@app.route("/api/feelingLucky", methods=["GET"])
def feelingLucky():
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(VIDEOS_READ)
            rows = cursor.fetchall()
    print(rows)
    if rows is None:
        response = jsonify(status=1, message="Are you sure?")
    else:
        video_id = random.choice(rows)[0]
        response = jsonify(status=0, video_id=f"{video_id}",
                           message="Successfully fetched random video")
    return response

@app.route("/api/uploadVideo", methods=["POST"])
def uploadVideo():
    data = request.get_json()
    title, description, user_id, is_private, is_age_restricted = data["title"], data["description"], data["userId"], data["private"], data["ageRestricted"]
    uploaded_on = datetime.now().strftime('%Y-%m-%d')
    video_url = f"https://cdn{random.randint(0,4)}.localhost.net/origin/{random.randint(512, 2048)}/videos/{''.join(random.choices(string.ascii_letters, k=8))}.mp4"
    video_length = random.randint(1, 60)
    views = likes = dislikes = comments = 0
    try:
        with connection:
            with connection.cursor() as cursor:
                cursor.execute(VIDEO_INSERT, (views, likes, dislikes, comments, title, description, video_url, is_age_restricted, is_private, video_length, uploaded_on, user_id))
                row = cursor.fetchone()
        if row is None:
            response = jsonify(
                status=1, message="Video upload failed. Please try again.")
        else:
            video_id = row[0]
            response = jsonify(
                status=0, video_id=f"{video_id}", message="Successfully uploaded video")
    except:
        response = jsonify(
            status=1, message="Video upload failed. Please try again.")

    return response

def getCommentsOfVideo(video_id):
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(VIDEO_COMMENTS_READ, (video_id,))
            rows = cursor.fetchall()
            print(rows)
    return [] if not rows else [{"comment": row[0], "user": row[1]} for row in rows]

def getTopicsOfVideo(video_id):
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(VIDEO_TOPICS_READ, (video_id,))
            rows = cursor.fetchall()
            # print(rows)
    return [] if not rows else [row[0] for row in rows]

@app.route("/api/getVideo", methods=["GET"])
def getVideo():
    id = request.args.get("id")
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(VIDEO_READ, (id,))
            row = cursor.fetchone()
    print(row)
    if row is None:
        response = jsonify(
            status=1, message="Failed to retrieve video.")
    else:
        comments = getCommentsOfVideo(id)
        topics = getTopicsOfVideo(id)
        video = {"title": row[0], "description": row[1], "views": row[2],
                 "likes": row[3], "num_comments": row[4], "username": row[5], "comments": comments, "topics": topics}
        # print(video)
        response = jsonify(status=0, video=video,
                           message="Successfully fetched video")
    return response

def getVideosOfUser(user_id):
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(USER_VIDEOS_READ, (user_id,))
            rows = cursor.fetchall()
            print(rows)
        return {"num_videos": 0, "videos": []} if not rows else {"num_videos": len(rows), "videos": [{"video_id": row[0], "title": row[1], "uploaded_on": row[2]} for row in rows]}

@app.route("/api/getUser", methods=["GET"])
def getUser():
    user_id = request.args.get("id")
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(USER_READ, (user_id,))
            row = cursor.fetchone()
    print(row)
    if row is None:
        response = jsonify(
            status=1, message="Failed to retrieve user.")
    else:
        videos = getVideosOfUser(user_id)
        user = {"first_name": row[0], "last_name": row[1], "username": row[2],
                "num_followers": row[3], "num_following": row[4], "videos": videos["videos"], "num_videos": videos["num_videos"]}
        response = jsonify(status=0, user=user,
                           message="Successfully fetched user")
    return response


@app.route("/api/trendingVideos", methods=["GET"])
def trendingVideos():
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(TREND_VIDEOS_READ)
            rows = cursor.fetchall()
    print(rows)
    if rows is None:
        response = jsonify(status=1, message="No trending videos found")
    else:
        videos = [{"video_id": row[0], "title": row[1], "views": row[2],
                   "likes": row[3], "comments": row[4], "username": row[5]} for row in rows]
        response = jsonify(status=0, videos=videos,
                           message="Successfully fetched trending videos")

    return response

@app.route("/api/getVideosByTopic", methods=["GET"])
def getVideosByTopic():
    topic = request.args.get("topic")
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(VIDEOS_BY_TOPIC_READ, (topic,))
            rows = cursor.fetchall()
    print(topic, rows)
    if rows is None:
        response = jsonify(status=1, message="No videos found")
    else:
        videos = [{"video_id": row[0], "title": row[1], "views": row[2], "username": row[3]} for row in rows]
        response = jsonify(status=0, videos=videos,
                           message="Successfully fetched videos")

    return response


@app.route("/api/celebrities", methods=["GET"])
def celebrities():
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(POPULAR_USERS_READ)
            rows = cursor.fetchall()
    print(rows)
    if rows is None:
        response = jsonify(status=1, message="No celebrities found")
    else:
        profiles = [{"user_id": row[0], "username": row[1], "first_name": row[2],
                     "last_name": row[3], "num_followers": row[4]} for row in rows]
        response = jsonify(status=0, profiles=profiles,
                           message="Successfully fetched celebrities")

    return response


@app.get("/api/users")
def get_users():
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(USERS_READ)
            user_id = cursor.fetchone()[0]
    return {"user_id": user_id, "message": "login successful"}, 200


@app.get("/api/getPopularTopics")
def getPopularTopics():
    with connection:
        with connection.cursor() as cursor:
            cursor.execute(POPULAR_TOPICS_READ)
            rows = cursor.fetchall()
    print(rows)
    if rows is None:
        response = jsonify(status=1, message="No popular topics found")
    else:
        topics = [{"topic_id": row[0], "name":row[1], "num_videos": row[2]} for row in rows]
        response = jsonify(status=0, topics=topics,
                           message="Successfully fetched popular topics")

    return response
