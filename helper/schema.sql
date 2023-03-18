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

CREATE TABLE follow (
  follow_id SERIAL PRIMARY KEY,
  follower_id INT NOT NULL REFERENCES user_profile(user_id),
  following_id INT NOT NULL REFERENCES user_profile(user_id),
  followed_on DATE NOT NULL DEFAULT CURRENT_DATE,
  UNIQUE (follower_id, following_id)
);

CREATE TABLE topic (
  topic_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL UNIQUE,
  description VARCHAR(255) NOT NULL,
  created_on DATE NOT NULL DEFAULT CURRENT_DATE,
  locale VARCHAR(255) NOT NULL,
  tag_count INTEGER NOT NULL DEFAULT 0
);

CREATE TABLE comment (
  comment_id SERIAL PRIMARY KEY,
  content VARCHAR(255) NOT NULL,
  commented_on DATE NOT NULL DEFAULT CURRENT_DATE,
  user_id INT NOT NULL REFERENCES user_profile(user_id),
  video_id INT NOT NULL REFERENCES video(video_id)
);

CREATE TABLE likes (
  like_id SERIAL PRIMARY KEY,
  liked_on DATE NOT NULL DEFAULT CURRENT_DATE,
  is_dislike BOOLEAN NOT NULL DEFAULT false,
  user_id INT NOT NULL REFERENCES user_profile(user_id),
  video_id INT NOT NULL REFERENCES video(video_id),
  UNIQUE (user_id, video_id)
);

CREATE TABLE tag (
  tag_id SERIAL PRIMARY KEY,
  tagged_on DATE NOT NULL DEFAULT CURRENT_DATE,
  video_id INT NOT NULL REFERENCES video(video_id),
  topic_id INT NOT NULL REFERENCES topic(topic_id),
  UNIQUE (video_id, topic_id)
);


-- Path: helper/queries.sql
select * from auth JOIN user_profile on auth.auth_id = user_profile.auth_id;

select * from video JOIN video_stats ON video.stats_id = video_stats.stats_id;