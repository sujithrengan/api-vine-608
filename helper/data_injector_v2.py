import random
import string
from datetime import datetime, timedelta
import psycopg2
from faker import Faker

'''
SQL Queries:

CREATE TABLE auth (
  auth_id SERIAL PRIMARY KEY,
  email VARCHAR(255) NOT NULL UNIQUE,
  pwd_hash VARCHAR(255) NOT NULL,
  is_email_verified BOOLEAN NOT NULL DEFAULT false,
  is_2fa_enabled BOOLEAN NOT NULL DEFAULT false
);

CREATE TABLE user_profile (
  user_id SERIAL PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  dob DATE NOT NULL,
  country VARCHAR(255) NOT NULL,
  username VARCHAR(255) NOT NULL UNIQUE,
  auth_id INT NOT NULL REFERENCES auth(auth_id)
);

CREATE TABLE video_stats (
    stats_id SERIAL PRIMARY KEY,
    views INTEGER NOT NULL,
    likes INTEGER NOT NULL,
    dislikes INTEGER NOT NULL,
    comments INTEGER NOT NULL,
    updated_at DATE NOT NULL DEFAULT CURRENT_DATE
);

CREATE TABLE video (
  video_id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(255) NOT NULL,
  video_url VARCHAR(255) NOT NULL,
  age_restricted BOOLEAN NOT NULL DEFAULT false,
  is_private BOOLEAN NOT NULL DEFAULT false,
  video_length INTEGER NOT NULL,
  uploaded_on DATE NOT NULL DEFAULT CURRENT_DATE,
  user_id INT NOT NULL REFERENCES user_profile(user_id),
  stats_id INT NOT NULL REFERENCES video_stats(stats_id)
);

CREATE TABLE topic (
  topic_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  description VARCHAR(255) NOT NULL,
  created_on DATE NOT NULL DEFAULT CURRENT_DATE,
  locale VARCHAR(255) NOT NULL,
  tag_count INTEGER NOT NULL DEFAULT 0
);

'''

# Replace with your database credentials and information
db_config = {
    'host': 'your_host',
    'port': 5432,  # Replace with your PostgreSQL port
    'dbname': 'your_database',
    'user': 'your_username',
    'password': 'your_password'
}

# Connect to the database
db_conn = psycopg2.connect(**db_config)

# Define the cursor
db_cursor = db_conn.cursor()

# Define the number of rows to insert into each table
num_rows = 10

# Define a function to generate random usernames
def generate_username():
    return ''.join(random.choices(string.ascii_lowercase, k=8))

# Define a function to generate random dates within a range of years
def generate_random_date(start_date, end_date):
    days = (end_date - start_date).days
    random_days = random.randrange(days)
    return start_date + timedelta(days=random_days)

# Define lists of sample data for the country column
country_list = ['United States', 'Canada', 'Mexico', 'Brazil', 'Argentina', 'Chile', 'United Kingdom', 'Germany', 'France', 'Spain', 'Italy', 'Russia', 'India', 'China', 'Japan', 'Australia', 'New Zealand']

# Create a Faker instance
fake = Faker()

def inject_user(cur):
    username = fake.user_name()
    email = fake.email()
    first_name = fake.first_name()
    last_name = fake.last_name()
    dob = fake.date_of_birth()
    gender = random.choice(['M', 'F'])
    country = fake.country()
    cur.execute("INSERT INTO User (Username, Email, First Name, Last Name, Date of Birth, Gender, Country) VALUES (%s, %s, %s, %s, %s, %s, %s)",
                (username, email, first_name, last_name, dob, gender, country))


# Generate random data for the auth table
auth_data = []
for i in range(num_rows):
    email = fake.email()
    pwd_hash = fake.password(length=16)
    is_email_verified = random.choice([True, False])
    is_2fa_enabled = random.choice([True, False])
    auth_data.append((email, pwd_hash, is_email_verified, is_2fa_enabled))

# Generate random data for the user_profile table
user_profile_data = []
for i in range(num_rows):
    first_name = fake.first_name()
    last_name = fake.last_name()
    dob = generate_random_date(datetime(1950, 1, 1), datetime(2005, 12, 31)).strftime('%Y-%m-%d')
    country = random.choice(country_list)
    username = generate_username()
    auth_id = i+1  # Assumes that the auth table has already been populated with data
    user_profile_data.append((first_name, last_name, dob, country, username, auth_id))

# Insert the data into the auth table
auth_query = "INSERT INTO auth (email, pwd_hash, is_email_verified, is_2fa_enabled) VALUES (%s, %s, %s, %s)"
db_cursor.executemany(auth_query, auth_data)
db_conn.commit()

# Insert the data into the user_profile table
user_profile_query = "INSERT INTO user_profile (first_name, last_name, dob, country, username, auth_id) VALUES (%s, %s, %s, %s, %s, %s)"
db_cursor.executemany(user_profile_query, user_profile_data)
db_conn.commit()

# Close the database connection
db_conn.close()
