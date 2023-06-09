PGDMP                         {           vine    15.2    15.1 T    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16390    vine    DATABASE     �   CREATE DATABASE vine WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = icu LOCALE = 'en_US.UTF-8' ICU_LOCALE = 'en-US';
    DROP DATABASE vine;
                sujith    false            �            1259    16477    auth    TABLE     �   CREATE TABLE public.auth (
    auth_id integer NOT NULL,
    email character varying(255) NOT NULL,
    pwd_hash character varying(255) NOT NULL,
    is_email_verified boolean DEFAULT false NOT NULL,
    is_2fa_enabled boolean DEFAULT false NOT NULL
);
    DROP TABLE public.auth;
       public         heap    postgres    false            �            1259    16476    auth_auth_id_seq    SEQUENCE     �   CREATE SEQUENCE public.auth_auth_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.auth_auth_id_seq;
       public          postgres    false    215            �           0    0    auth_auth_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.auth_auth_id_seq OWNED BY public.auth.auth_id;
          public          postgres    false    214            �            1259    16593    comment    TABLE     �   CREATE TABLE public.comment (
    comment_id integer NOT NULL,
    content character varying(255) NOT NULL,
    commented_on date DEFAULT CURRENT_DATE NOT NULL,
    user_id integer NOT NULL,
    video_id integer NOT NULL
);
    DROP TABLE public.comment;
       public         heap    postgres    false            �            1259    16592    comment_comment_id_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_comment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.comment_comment_id_seq;
       public          postgres    false    227            �           0    0    comment_comment_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.comment_comment_id_seq OWNED BY public.comment.comment_id;
          public          postgres    false    226            �            1259    16560    follow    TABLE     �   CREATE TABLE public.follow (
    follow_id integer NOT NULL,
    follower_id integer NOT NULL,
    following_id integer NOT NULL,
    followed_on date DEFAULT CURRENT_DATE NOT NULL
);
    DROP TABLE public.follow;
       public         heap    postgres    false            �            1259    16559    follow_follow_id_seq    SEQUENCE     �   CREATE SEQUENCE public.follow_follow_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.follow_follow_id_seq;
       public          postgres    false    223            �           0    0    follow_follow_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.follow_follow_id_seq OWNED BY public.follow.follow_id;
          public          postgres    false    222            �            1259    16611    likes    TABLE     �   CREATE TABLE public.likes (
    like_id integer NOT NULL,
    liked_on date DEFAULT CURRENT_DATE NOT NULL,
    is_dislike boolean DEFAULT false NOT NULL,
    user_id integer NOT NULL,
    video_id integer NOT NULL
);
    DROP TABLE public.likes;
       public         heap    postgres    false            �            1259    16610    like_like_id_seq    SEQUENCE     �   CREATE SEQUENCE public.like_like_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.like_like_id_seq;
       public          postgres    false    229            �           0    0    like_like_id_seq    SEQUENCE OWNED BY     F   ALTER SEQUENCE public.like_like_id_seq OWNED BY public.likes.like_id;
          public          postgres    false    228            �            1259    16632    tag    TABLE     �   CREATE TABLE public.tag (
    tag_id integer NOT NULL,
    tagged_on date DEFAULT CURRENT_DATE NOT NULL,
    video_id integer NOT NULL,
    topic_id integer NOT NULL
);
    DROP TABLE public.tag;
       public         heap    postgres    false            �            1259    16631    tag_tag_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tag_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.tag_tag_id_seq;
       public          postgres    false    231            �           0    0    tag_tag_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.tag_tag_id_seq OWNED BY public.tag.tag_id;
          public          postgres    false    230            �            1259    16580    topic    TABLE     !  CREATE TABLE public.topic (
    topic_id integer NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    created_on date DEFAULT CURRENT_DATE NOT NULL,
    locale character varying(255) NOT NULL,
    tag_count integer DEFAULT 0 NOT NULL
);
    DROP TABLE public.topic;
       public         heap    postgres    false            �            1259    16579    topic_topic_id_seq    SEQUENCE     �   CREATE SEQUENCE public.topic_topic_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.topic_topic_id_seq;
       public          postgres    false    225            �           0    0    topic_topic_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.topic_topic_id_seq OWNED BY public.topic.topic_id;
          public          postgres    false    224            �            1259    16490    user_profile    TABLE     2  CREATE TABLE public.user_profile (
    user_id integer NOT NULL,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    dob date NOT NULL,
    country character varying(255) NOT NULL,
    username character varying(255) NOT NULL,
    auth_id integer NOT NULL
);
     DROP TABLE public.user_profile;
       public         heap    postgres    false            �            1259    16489    user_profile_user_id_seq    SEQUENCE     �   CREATE SEQUENCE public.user_profile_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.user_profile_user_id_seq;
       public          postgres    false    217            �           0    0    user_profile_user_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.user_profile_user_id_seq OWNED BY public.user_profile.user_id;
          public          postgres    false    216            �            1259    16515    video    TABLE     �  CREATE TABLE public.video (
    video_id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    video_url character varying(255) NOT NULL,
    age_restricted boolean DEFAULT false NOT NULL,
    is_private boolean DEFAULT false NOT NULL,
    video_length integer NOT NULL,
    uploaded_on date DEFAULT CURRENT_DATE NOT NULL,
    user_id integer NOT NULL,
    stats_id integer NOT NULL
);
    DROP TABLE public.video;
       public         heap    postgres    false            �            1259    16507    video_stats    TABLE     �   CREATE TABLE public.video_stats (
    stats_id integer NOT NULL,
    views integer NOT NULL,
    likes integer NOT NULL,
    dislikes integer NOT NULL,
    comments integer NOT NULL,
    updated_at date DEFAULT CURRENT_DATE NOT NULL
);
    DROP TABLE public.video_stats;
       public         heap    postgres    false            �            1259    16506    video_stats_stats_id_seq    SEQUENCE     �   CREATE SEQUENCE public.video_stats_stats_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.video_stats_stats_id_seq;
       public          postgres    false    219            �           0    0    video_stats_stats_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.video_stats_stats_id_seq OWNED BY public.video_stats.stats_id;
          public          postgres    false    218            �            1259    16514    video_video_id_seq    SEQUENCE     �   CREATE SEQUENCE public.video_video_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.video_video_id_seq;
       public          postgres    false    221            �           0    0    video_video_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.video_video_id_seq OWNED BY public.video.video_id;
          public          postgres    false    220            �           2604    16480    auth auth_id    DEFAULT     l   ALTER TABLE ONLY public.auth ALTER COLUMN auth_id SET DEFAULT nextval('public.auth_auth_id_seq'::regclass);
 ;   ALTER TABLE public.auth ALTER COLUMN auth_id DROP DEFAULT;
       public          postgres    false    214    215    215            �           2604    16596    comment comment_id    DEFAULT     x   ALTER TABLE ONLY public.comment ALTER COLUMN comment_id SET DEFAULT nextval('public.comment_comment_id_seq'::regclass);
 A   ALTER TABLE public.comment ALTER COLUMN comment_id DROP DEFAULT;
       public          postgres    false    227    226    227            �           2604    16563    follow follow_id    DEFAULT     t   ALTER TABLE ONLY public.follow ALTER COLUMN follow_id SET DEFAULT nextval('public.follow_follow_id_seq'::regclass);
 ?   ALTER TABLE public.follow ALTER COLUMN follow_id DROP DEFAULT;
       public          postgres    false    223    222    223            �           2604    16614    likes like_id    DEFAULT     m   ALTER TABLE ONLY public.likes ALTER COLUMN like_id SET DEFAULT nextval('public.like_like_id_seq'::regclass);
 <   ALTER TABLE public.likes ALTER COLUMN like_id DROP DEFAULT;
       public          postgres    false    228    229    229            �           2604    16635 
   tag tag_id    DEFAULT     h   ALTER TABLE ONLY public.tag ALTER COLUMN tag_id SET DEFAULT nextval('public.tag_tag_id_seq'::regclass);
 9   ALTER TABLE public.tag ALTER COLUMN tag_id DROP DEFAULT;
       public          postgres    false    231    230    231            �           2604    16583    topic topic_id    DEFAULT     p   ALTER TABLE ONLY public.topic ALTER COLUMN topic_id SET DEFAULT nextval('public.topic_topic_id_seq'::regclass);
 =   ALTER TABLE public.topic ALTER COLUMN topic_id DROP DEFAULT;
       public          postgres    false    225    224    225            �           2604    16493    user_profile user_id    DEFAULT     |   ALTER TABLE ONLY public.user_profile ALTER COLUMN user_id SET DEFAULT nextval('public.user_profile_user_id_seq'::regclass);
 C   ALTER TABLE public.user_profile ALTER COLUMN user_id DROP DEFAULT;
       public          postgres    false    217    216    217            �           2604    16518    video video_id    DEFAULT     p   ALTER TABLE ONLY public.video ALTER COLUMN video_id SET DEFAULT nextval('public.video_video_id_seq'::regclass);
 =   ALTER TABLE public.video ALTER COLUMN video_id DROP DEFAULT;
       public          postgres    false    221    220    221            �           2604    16510    video_stats stats_id    DEFAULT     |   ALTER TABLE ONLY public.video_stats ALTER COLUMN stats_id SET DEFAULT nextval('public.video_stats_stats_id_seq'::regclass);
 C   ALTER TABLE public.video_stats ALTER COLUMN stats_id DROP DEFAULT;
       public          postgres    false    219    218    219            {          0    16477    auth 
   TABLE DATA           [   COPY public.auth (auth_id, email, pwd_hash, is_email_verified, is_2fa_enabled) FROM stdin;
    public          postgres    false    215   Wd       �          0    16593    comment 
   TABLE DATA           W   COPY public.comment (comment_id, content, commented_on, user_id, video_id) FROM stdin;
    public          postgres    false    227   s       �          0    16560    follow 
   TABLE DATA           S   COPY public.follow (follow_id, follower_id, following_id, followed_on) FROM stdin;
    public          postgres    false    223   i      �          0    16611    likes 
   TABLE DATA           Q   COPY public.likes (like_id, liked_on, is_dislike, user_id, video_id) FROM stdin;
    public          postgres    false    229   �!      �          0    16632    tag 
   TABLE DATA           D   COPY public.tag (tag_id, tagged_on, video_id, topic_id) FROM stdin;
    public          postgres    false    231   �4      �          0    16580    topic 
   TABLE DATA           [   COPY public.topic (topic_id, name, description, created_on, locale, tag_count) FROM stdin;
    public          postgres    false    225   �6      }          0    16490    user_profile 
   TABLE DATA           g   COPY public.user_profile (user_id, first_name, last_name, dob, country, username, auth_id) FROM stdin;
    public          postgres    false    217   �@      �          0    16515    video 
   TABLE DATA           �   COPY public.video (video_id, title, description, video_url, age_restricted, is_private, video_length, uploaded_on, user_id, stats_id) FROM stdin;
    public          postgres    false    221   L                0    16507    video_stats 
   TABLE DATA           ]   COPY public.video_stats (stats_id, views, likes, dislikes, comments, updated_at) FROM stdin;
    public          postgres    false    219   Gp      �           0    0    auth_auth_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.auth_auth_id_seq', 111, true);
          public          postgres    false    214            �           0    0    comment_comment_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.comment_comment_id_seq', 800, true);
          public          postgres    false    226            �           0    0    follow_follow_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.follow_follow_id_seq', 1166, true);
          public          postgres    false    222            �           0    0    like_like_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.like_like_id_seq', 1100, true);
          public          postgres    false    228            �           0    0    tag_tag_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.tag_tag_id_seq', 102, true);
          public          postgres    false    230            �           0    0    topic_topic_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.topic_topic_id_seq', 40, true);
          public          postgres    false    224            �           0    0    user_profile_user_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.user_profile_user_id_seq', 111, true);
          public          postgres    false    216            �           0    0    video_stats_stats_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.video_stats_stats_id_seq', 205, true);
          public          postgres    false    218            �           0    0    video_video_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.video_video_id_seq', 184, true);
          public          postgres    false    220            �           2606    16488    auth auth_email_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.auth
    ADD CONSTRAINT auth_email_key UNIQUE (email);
 =   ALTER TABLE ONLY public.auth DROP CONSTRAINT auth_email_key;
       public            postgres    false    215            �           2606    16486    auth auth_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY public.auth
    ADD CONSTRAINT auth_pkey PRIMARY KEY (auth_id);
 8   ALTER TABLE ONLY public.auth DROP CONSTRAINT auth_pkey;
       public            postgres    false    215            �           2606    16599    comment comment_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (comment_id);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public            postgres    false    227            �           2606    16568 *   follow follow_follower_id_following_id_key 
   CONSTRAINT     z   ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_follower_id_following_id_key UNIQUE (follower_id, following_id);
 T   ALTER TABLE ONLY public.follow DROP CONSTRAINT follow_follower_id_following_id_key;
       public            postgres    false    223    223            �           2606    16566    follow follow_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_pkey PRIMARY KEY (follow_id);
 <   ALTER TABLE ONLY public.follow DROP CONSTRAINT follow_pkey;
       public            postgres    false    223            �           2606    16618    likes like_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT like_pkey PRIMARY KEY (like_id);
 9   ALTER TABLE ONLY public.likes DROP CONSTRAINT like_pkey;
       public            postgres    false    229            �           2606    16620    likes like_user_id_video_id_key 
   CONSTRAINT     g   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT like_user_id_video_id_key UNIQUE (user_id, video_id);
 I   ALTER TABLE ONLY public.likes DROP CONSTRAINT like_user_id_video_id_key;
       public            postgres    false    229    229            �           2606    16638    tag tag_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (tag_id);
 6   ALTER TABLE ONLY public.tag DROP CONSTRAINT tag_pkey;
       public            postgres    false    231            �           2606    16640    tag tag_video_id_topic_id_key 
   CONSTRAINT     f   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_video_id_topic_id_key UNIQUE (video_id, topic_id);
 G   ALTER TABLE ONLY public.tag DROP CONSTRAINT tag_video_id_topic_id_key;
       public            postgres    false    231    231            �           2606    16591    topic topic_name_key 
   CONSTRAINT     O   ALTER TABLE ONLY public.topic
    ADD CONSTRAINT topic_name_key UNIQUE (name);
 >   ALTER TABLE ONLY public.topic DROP CONSTRAINT topic_name_key;
       public            postgres    false    225            �           2606    16589    topic topic_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.topic
    ADD CONSTRAINT topic_pkey PRIMARY KEY (topic_id);
 :   ALTER TABLE ONLY public.topic DROP CONSTRAINT topic_pkey;
       public            postgres    false    225            �           2606    16497    user_profile user_profile_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_pkey PRIMARY KEY (user_id);
 H   ALTER TABLE ONLY public.user_profile DROP CONSTRAINT user_profile_pkey;
       public            postgres    false    217            �           2606    16499 &   user_profile user_profile_username_key 
   CONSTRAINT     e   ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_username_key UNIQUE (username);
 P   ALTER TABLE ONLY public.user_profile DROP CONSTRAINT user_profile_username_key;
       public            postgres    false    217            �           2606    16525    video video_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (video_id);
 :   ALTER TABLE ONLY public.video DROP CONSTRAINT video_pkey;
       public            postgres    false    221            �           2606    16513    video_stats video_stats_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.video_stats
    ADD CONSTRAINT video_stats_pkey PRIMARY KEY (stats_id);
 F   ALTER TABLE ONLY public.video_stats DROP CONSTRAINT video_stats_pkey;
       public            postgres    false    219            �           2606    16600    comment comment_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_profile(user_id);
 F   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_user_id_fkey;
       public          postgres    false    227    217    3528            �           2606    16605    comment comment_video_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_video_id_fkey FOREIGN KEY (video_id) REFERENCES public.video(video_id);
 G   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_video_id_fkey;
       public          postgres    false    227    221    3534            �           2606    16569    follow follow_follower_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_follower_id_fkey FOREIGN KEY (follower_id) REFERENCES public.user_profile(user_id);
 H   ALTER TABLE ONLY public.follow DROP CONSTRAINT follow_follower_id_fkey;
       public          postgres    false    3528    217    223            �           2606    16574    follow follow_following_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.follow
    ADD CONSTRAINT follow_following_id_fkey FOREIGN KEY (following_id) REFERENCES public.user_profile(user_id);
 I   ALTER TABLE ONLY public.follow DROP CONSTRAINT follow_following_id_fkey;
       public          postgres    false    223    217    3528            �           2606    16621    likes like_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT like_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_profile(user_id);
 A   ALTER TABLE ONLY public.likes DROP CONSTRAINT like_user_id_fkey;
       public          postgres    false    217    229    3528            �           2606    16626    likes like_video_id_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.likes
    ADD CONSTRAINT like_video_id_fkey FOREIGN KEY (video_id) REFERENCES public.video(video_id);
 B   ALTER TABLE ONLY public.likes DROP CONSTRAINT like_video_id_fkey;
       public          postgres    false    3534    229    221            �           2606    16646    tag tag_topic_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_topic_id_fkey FOREIGN KEY (topic_id) REFERENCES public.topic(topic_id);
 ?   ALTER TABLE ONLY public.tag DROP CONSTRAINT tag_topic_id_fkey;
       public          postgres    false    3542    231    225            �           2606    16641    tag tag_video_id_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.tag
    ADD CONSTRAINT tag_video_id_fkey FOREIGN KEY (video_id) REFERENCES public.video(video_id);
 ?   ALTER TABLE ONLY public.tag DROP CONSTRAINT tag_video_id_fkey;
       public          postgres    false    3534    221    231            �           2606    16500 &   user_profile user_profile_auth_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.user_profile
    ADD CONSTRAINT user_profile_auth_id_fkey FOREIGN KEY (auth_id) REFERENCES public.auth(auth_id);
 P   ALTER TABLE ONLY public.user_profile DROP CONSTRAINT user_profile_auth_id_fkey;
       public          postgres    false    215    3526    217            �           2606    16531    video video_stats_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_stats_id_fkey FOREIGN KEY (stats_id) REFERENCES public.video_stats(stats_id);
 C   ALTER TABLE ONLY public.video DROP CONSTRAINT video_stats_id_fkey;
       public          postgres    false    219    221    3532            �           2606    16526    video video_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_profile(user_id);
 B   ALTER TABLE ONLY public.video DROP CONSTRAINT video_user_id_fkey;
       public          postgres    false    3528    221    217            {   �  x��Zٲ�L��f?���!�p�)"���j�������?�^�s�I�y��WVfUV��Y6���DE���^���ø����4e��nI��FX%b�k��v�v�n7�3�
�l�l#n�QzU���h���H�1�A�P�� *�o���=��������c��.���D@$")��H��f�0Ly��6UxW�+�,�d�EZb�����2рDq��]��"��{YO�}����W�^#�Ȏ+-,�����1���W3�;�쌶u<�ڙh�U�)(9d#���i5l[ ��o��ɵ�w��b��	�z���Ui��P�?d���6!�4���ui���O�I-�@_��5�����s�ι9D �n��ڡ�C]��7�}3ч�U��9�C���a���i�傱�5a�Q
��Wv�&��w��'�}H�?�M��a�w-;�/��#���Ls�����Hdg������H`<��@�0ǰ9��/i�Hׂ�v訋+��l��xO!w)SM�"���}��B�_A��Aۨ�����\����6�zu���d�h�Z$�)P��ˇ���k�����[�&,�No|^y?�2�\&<P�!,r�ۗ'�kd��s|hm�.��c��1`����������s��W7F,^��PyP�HF�R/�D��{�3?�04P������e����=ʂW\͉T(!Э+�9?�d�B
��I�e	�CܾQ�D3:
�SƖ�{�PRj��*,�d�n���h��?�c$��sxno�����r�.����	?�N<(�ؖ�qVK�?��.-p�R��˳�:\tY&���Ќ'>"��!aNͳʚцq�oJ(m#.�(�Rt�����" �`\ï�h7L���3��5���X�i�qJ�HN���0C^��R�:��"c#�8o��濧�Rx�j76�� [W�*z�f/3r_�Ԑ�\����9}u�7���QJ�^�D���yu׼?1َ
��?���9��Z�Oa?��)�e��@[�H�m�b����]���(���ds�%B�`��;G}��0�cs�]�ZDJ�u�{������L�pl�~'�#�4򸄉���/��v�z�6�O*���1d�� �e�o5��y��g�Y�iw�>�ѵ�[�\�n�ƞ��@�ѷ��wҝ�o�ˌ���;w_������L�?���YS^�e��=��Z[76Io+�h�@G.W6�?��?���va�d��vN�JW���#d=߱o�?��WKU�$C�H`�DxFΈR�U�b%�Q���hMv���v�C��������m1������V
�k�4���N�:��kV?ts4�C���
o_?y�t�R�l��}[�b�읅s4���1�����B���&�\S&s��ʙ��h�h�D��7�LU�X��8�]9�s/�޿�r9#}�zC�tuiWJ��	�#@�c[�Oz��JpJDkԖޕ>�N�����C^��i�p<&;�k�,pdl������)n�=�,W��[r��.nW�ɀs�>�
{�2s�����L�]/�����!ʣ0a�6|�� �W4�/7h�����t��ڦ�G�)�I��:�p�kZf3[�[+���D��M����a�{i��I��g���T������$�����+Z>5wu3�.?LM��P�QW��������c��rc�cH2T�&O[�(�n:�5�&B�\�`�53���>pU]J�v�y ,�nX�W��觝�x�x�(���e�}
�����DS'5�;���eC֧3�M��*��*�7�]��ގ˽�^���^��q�9g�q}>N���<�����"��,��z}i|lE����_��ȴ綘v�'��F��`�|�~��d?��B���U�1+'TI}�U�K�@xآ1|�A;�>���n��؋����@���ַ�[��<����ct�ܷcb垽�O�2v��{��V��K	�i ��-�b�_/��!��P[?1���A��|Kg�I!��X����Gg��^+�抋�ㄍ,��y<u�zU|����SL��m����(#X���i��K�sX�(;ɪ:x�����8>��0�;�(A�@=�g��jcOkt�C���uYQ�j���}W�&
8�M�a�a>à��������N�jq��A�J:�"^�:��Y��k�8σ�=��e\��W����yz5Gx5�C �:j���=��}g�^�2o��,1��~W/���f����9������R�sύ��J���=����9�7:��B BX��R�k�\Y��?��-�g'�u'i{ֿ���"�8)#<�}��YS�ߥ������-Դ�ɯ�7�G�NK��l�}.J��m��V��?�|����2y	U{���čL��md����ӧ�-�7�Ӳ�DE��q.�@�1���M�C���h�Ab+mD[�����L�:��~˓�2�-{q��"�D���Q3˞�н����M���s������2]�D����G\XF�77�M[�u�ٯ3���0�a���s�ܦ�(���}�Z�k�����J�#��E=u:k��no+����4B���N��Kj�S��֊�'my@�V-�p9x~Mtg���xs) �ݥ�]1�i-�O��f�&��U��fJ���+d�'7.tO��:!�?Ǽ1�#�t���)JD�� � ^��ܬ/P	�T� ��� �����@jQ�SP���>�1;�t�H�����`k�� Z�����Da/�>^�ð�7*ִ�x��Gtd���>���Ƀ�tL�h\�u3g!�ՖHN���+UW��*�z�O*G8ENГG��������6�KK�<n������Xks���8:�}�A��W�i�L�8�*2� ��߫r����<��W^�[:����l���{?I��~k��4"��I��9��92y9�p�U/����lm�n@9���?�/t؀�rFly?����5*����]ǈ��}�z��fj �'��<Tw��}1A9�+e�G�4�?w0���L�����n��H2�B���h��O7��J�=%�q�b'=iJ����hU�5�d�oj���׭v����uSr�VIWB�J���<�.x\��K,�q�\.�YG�kw"�e*-�ݲ5r�Bv/��e�\m���aaV�Y�Gt��A\T�W��@�ys�/* t��T���	�(n>��f�_�Ws����g��=�=��ij���o������z֔��MP8�x;�rsX��Z�6��l�ʛ���-�q��|\�Z�˅�P�O^d�a�/�e���.��/�|��'ۿ'�i�_o���"�D����bUʒ�>��A�c
R��t �O���O1N�>�I�Q|�����{Y�Cf��t?G��bo8��r\��J�	���4x1��9�<-����`
v��ޑy���'j���|�m�������9)(.����{w^��e�O����a↦h�>g���Y����my��ax��:t0l�p���/>�Q;tqvA͌!���*�3�W��=d�6�dpʕʡϿ��D{i�]����a�
Z2O7�o��٤:f�a[]%���ئ(~�`��c��,�����F�V�X�ԅ:��D�}8O|����>4�=�U��Ѱq�*K��h7��m���M#M	{�_@��U���i�U��]�hFo�f��f��ڴ��4.���є8A��s��W�U`�ǀ-[a�.�V�����Mӿ��g�z��7A#{(���soښ�(�iy��?�?���<      �      x�t��rY�$������w𑺕�[,i�쒵�^�@�@Drp���'�=b��������*���ʸx�{�����a�^4��z����׾4��K�Y��z�[o绦�7����.z�����ۦ������úݾ�k��z���i�?����EoY�o���`�����?��W�?������{}��׏��v��~��ۻ�z������S�[�^W��~s��߿��f�{hOoz��s����4ϽM���b�h�Eo�~\��>���w��?n������[���������a����f�o4�KV��?�n}�?����{:5���`?�M��kz�v�������fW���v��۵�3��h�޶��7�O��W]��cÛ�7?�a�W��~��;��Ovy���sa����3Uw��r���?�������/� ���ٞ�]�k������~lz��^��x�������~oτ7�i�]=כ��.������vS[{%�ڣ��y��+h����ڛ���������h�n��S�=�7���=n�x^���q�t��zP�gx���ݪ�ڕ�uaˣ��skw�ӎF�d��h��'^m�~�[}���m�����.�x�7��s���]��ǣ�������O�wN��M�뭚������͗�����ȇcfo��k������j}�g���OD����g�?�:�5�j��=7���{�};�S�������=���v�����s��^����H�-���C�S�؟�_����f���d�C��d'�}����%���Uo�/�������:f��e=ߵ�{������]���D�X�����#�glG���_��\���6�����~�]�}���c�s~�v����(ᯅ�gټ�K�ơ�_�C{N\�u��y�۳g���l���o�ZU��W6�gp��u�j��GgW�=�6��Z��^}\���=w{��#q�ڝ����y��k�e�Ͼ+;<oz�?;�������,���Wv���P��l^���C�Y<v��оۑ���Ue�q��7��Z4�5?`�����>�u��R�Bl��?�?DDzi��D�0�L�$�A�%=ٗn1o�~^o��J����D�[�g��^ڏ��f�=��/�+�)�Z������#^��&��W��������n���G|���1�e�s�:ړ�/�d_�lA�{_j��ǝ�K$5"�K����o/���Z��a����,�ՏH6���k;�Ebң�Z����.��.~P�#���-�;�;G{,^[Oxqa�_�����i�1��=�#G�1V<��k�d��K��q�>@{��]ð�fl?��c�}=v����/�>|K*v��k�P�����������Xp�C�ͨU`LTݼ� �m��/��v��do�=�=����y��P<O��w�����y�ê?���W�����e'H� iOu�=�H�z��b��}|�/S�am�߂媱G����c;¡�G;�z���v�4��#�G�#�޾����{ۍ�.�	G$v�1-�x����ӿۅ��M�؍�
:�I����sq7�5�+�lK��'�(������B�}�",�3�[��i?�M��;����ޢ���/�d���ֿ�M�(�q��vq��ncˠվ�g��E��?�;|�]�c|�qUwJ���N�U<{�|���w�b���e?�[rX����Ϊ�뽢�Ξ�\���a��C���\�a���j�֞������eu�$��'D�g�7����1�^6q��U:8ݯ{^���W3?X�ܯ=Ǩ��߉��ت{�7�g�^+c�y���j^�f�Ȳ�܌w��o��~�=�C������O��E�J0���o���k;���#Oe����*W՗�E�E듪���e��[�Gi?�`g��Yn���pQ��wfKEc:�������\�`�=���v��ۅ���1���2;���Y�ٰ��Ӻ�>3K�#;�~eu�����۱<�J�B�	��!�%(����b����N�K��=4�:�z�`��lWٸ|�_Z�f�sm����e�A��%�ջGV�;�n�G<VD�3���S�F9�?>>����HzA��+Z.����'�V
Z�8�!X���{�;("����{���e�lX�������Y���e��+I���]��~YY�������#���e��7V� �6�������c�oQϮ�S���{D��h�{j�;���=_�]������<��@0��9��U�Wk{��#������/�:<��Q�&�:�������Y�D?�r{'�k�k���/����.*�!�帺m�w<�=�Y���!����V����x����'u����|=#X�h�s�����5�<nE$l�P6��5�"<� +E����yE+�{�����}����~�����ό�xR}�!ghjq�^��a|��ZA�hط�n�.�^u���%>��D�9��q|�N���k�X��EYdR�O� H�G�
;��(�Z�:!���{lpKV/���κ�N��X���Dk�jk�a_2,��g��xu�]�9C�< �`�����ũ��W���\����^�/�Y���P�
����a���kW���ع��@=�`V�l�s��6��V�4,���_<l�C��Q,4��a�ae�����o�Q�o����î�B��J�)ؕ�+���VQ��v�;ԯ�E^F�.���R����5�}|nH�֠�����87��~��(�v���fq�{��Ӵ����Z���T�>7���Sjʊ(��}�áeB���<dqoQ�d�@��ai����+
���Uk��j`;����V���RP�o����~8j�'�y7hݼ^�P�H��
����5��z��E��M��N^32n��-��������GJ,fM�:AG^V�=&K�^���C�V"�z��	�i���jnl_�pP	$�<��<̚�塝TA��L����r�y�����H�G ���#����@����O�J4���V�v���>A��Q�7�x��ս�ڷm7']O�=���Ke�ƿ�`�7|����<�u|LL_B�X�������Y:E�x�o��]�9�"tnh�����|�s���d��ʞ������
��u��d�N`����^R�u��6k���Ѕ_p>��.ڸ���u\}�����7#�ڡG��S־n	(Z_O���yn��g��ȣѝYc�.�c��������g��!$#��neN�מ�>�f�O{���{ovȧ8��־�먌�;���d��2��5k��>xo8�
е��g�:i�,	E?[��r��`o9loe���샷Y�LZ�l�W��C����h��~1�K�V_𧬨� �� vb7wh��p)J��"W}a�XM� �-}h�p����/,��|�����-!��`J�sq���ΪkTi��RR xkA������!�~j�Lp�N{T=�HQ��r������|�w�j;D�0g�^X��eޢ��h��`���陌�+�����60I�F�׺^"��%P��, ����kE��;6��e1�e�htU�!j�� ?��֛���]�;�f�H��*05r��lk=zE�ւ�q�&�yaW��Ԣ��V������Eͬѳogԯ�^X��[b5 �H�:�f��k�b�䰤�#������ �+��F�J^�։z�ko��9�5��kTl�q�� �輧��)�Ƚ�l /w�^, RF8N�����E�bY�qɏ�7��z�o�������M�}�}\䰺���{���!r{�n�Bq���E�Ae�'��c���[*ט&�(-�۱�ע����߯�S��{�x�������\i��t�=	��v�#;����x���s5�8�����5��CqEk��߉=(}���A�fSx7�H{��|�/TЄ�/�(�Gc��^��VF ��(l��R�X�X:�Ps<�w"�э�?���=NS���cON����PK$���A����fA94
�M�;<��Gt�^M�&շ]C`z��Ŏ�">K�o�1��l�e� h���]kZ����+;�?kk���@��?����o Y    �
���#0L�?J��'{;�@���q�I9�{Эb�ѡy������]������8)�H�����B�k�U.��CGۆ&��E���3�vX��]�]�m2��q4��T�Z��>�i����Z(]��N_}�[C��Cs���WG�ӹB $lu���{4�ݘ�
��:=Z����+9�[U�!	�Sy{D�g�T�[�ƭ���'�~3w ]�Y gn�	o}��������2���Ap K�x�c~Mbq��'D��k���W�[`>��G���2��jD|B�	�|�8*��&ZQ� ��ի�xQ�}9Dĭ���UcU`�.�:,�8�Y���W�Vv�������RS�nH	_����O��@�U&�7œ��7>�|-�_:���������j��un�@ń	���:0���|��IË�� �Sd�������r�l�Y iM/��}G�a�(o�Ni�guG[L���z��r
c\���A�fVl���s;�!�����y�Xlγ�P��e��Q}f) r�D6Ry\r�� �����f�1�nmƶ�u��	!���[���!au81�a����pl��&pU �\�����|B�&n�P8��i��-�W�3�S�
| ~ �jϘ|��g���כ�I���%8yu"t�����9�0g��8[����CS����N�B5�x9��L���q���Xq��4ĎA�ʕy�XP;O�姁��xZ�q���Ƴ���0�1��hR����s�:E�K
�hIR�iY��xdE�P��� -����-�����_-�bЉ����'�̸�캷�'gVE�E �<�� ���X�G߆C�g��N��ו�Sm�D���|V0��뽮��f� �"�T�,���~�up���6��q����5�W$Pq6���K��J��_h�������\YIm�,ږE��N�ݭe��οԯ��Y���W��)}j��tK��*_�����u��U{���/���1���־5�|wtA%(i�����R�A,~ii|�dCt.T�h���I�kS+���z���P��+N,'�)�y(�f)��DQ����w|G��܆g�� ב���дCcF��5	�j��ϲ���S�r�a��JWg�$���L�D�X/p'�L`�;E`�9�J�lA���I��+_���������6p�����+G� �4ď��ׇ��X;VH����ż#�����0)�O������5cƁ�1l�~�O��o�h�>$w�O��cS��>�W-���3,2'ch��9o�a?n%�+�4��9].�#_�V��G<o������؊4�*(�,<��Ii左�or����r�]#Y���w�-o13���L����i�~��β���� ڀ����~�[F��%�R�ݱ��P��dZ}���@^��R�ln��S��|�0��\�i���t�=���Ĕ�o�jz�/9���R�'�Ubg�`��sV}�4���0�>	d=�3 ��9�3ѵ����y$89f8B?�"-�*�;>��9�"�삩8���B'V{��٦�v����;��Y�Uh�G*R�6 ,�yk)41�H�r�����Bzs�tSHna��~��=�5�$���E�{1�C1?���^>��&r�> F|�j�����k_�<�����:�W�r����������gT�����l�"��Oe������Ӿ�\�_sB��9�y��j=վ?��E����7�95�4�7������x|A���c�N�L�ZQl�Ձm)<bKa��p�������������p��-(I��^��`�.���k�K=| �J�"z xuN`�|���j'�����}�up�4=?�H����o�(�u&��z��X���v�Ԕ+�x�#|��թ'����{���������Rm�c�8��%3�6?�Y�eLO�[��mCbM`b�;��h��7W���1�QJ�I.,��NA*���f�="�/���-} Nn����Pk�����C���Z��g�K(�����O'Ս�5�����c�AǕ����"�[d��<�@^��zk���cM( �D2�(���-pa��k�p��:�^�V:�����c�N��V�F�x�V�+�9���=Vg�?�>��(bW���ͧp-��^�!5�Ꞣ�`�Ev�r��(X����G�˘�2��ٟ��ͬ�Xs.w
~  �ꋔPo���H�}�f{;#kt�G�|���y�l�	ic�+1c�M;�x8>u��_w҃����d|b6��H\EQ%��}6Q9��_�9)�)�h��+���yg^&W�9��p_{!c��|2T������r��P���>���Z�����B�쪺�� S��t�E�5��En�1(�?�۾���h^)!ԙd�������Ƥ4G���K��zHڹ��r��I'Q���J���_�������t,���4a����ӯgo�(�@�L�p�s���ӲX�v�虀�����X�~��Q�&8�K�q,@����)�H�'�u��~��&ޠ�X2��� �& � �l������� E�w�|/@X����dē)��E�����	�?��?9�#�t����þ�İ�{���j?Y�f;q��4R/�(K@�q�r-@7�(����fמ�̑]��2�� q�l~4ɌX}.o�)�Gn�����_��V�<[�)�p�C���Gv�����4���j����`"��l\��'���떼<L���g���&BS�_��cK�o&z��Ή�HD:� ɝR�r�����"` { `�M�F6�g�l����@x�`BZuX!
ފ@.v\h�H��/,�~^-�	���r	���X 㰤�\"�x��hH��#���I{�z��Z�2�^���yg�a��W� /d�1K���f�- �u5O,������q R|3O)ds�$�ZN���w�jk�{�z��9�7�{t���r�i�V�Vi��@.����5x�crT��=�E�Lw����AP�L�uE���qP?����8l:�@@;�8�.��5W"��b�iW���9�'�o��MMx2"����d�z1�	jʒ���P5o��K��Ψ��ؐ^_U2��c���&�K�;P^8��D����w�|�����)˦�０#� ��`�F� ����c4���Z5�q_�صq&+�N-y��zl���	t$I����[�T�^Cތ4���(��K	'�q$e����E����13C�`�YP�\
~�b�Z��7���f��2;��"i �2��M9��gsv�!e�����(��%?���S�{=�n�Q�����Ж��R]$:X<�=iXB��k^X�OQB�%�i�<�Z�S�Ӆ�����z��X����r2�Hx<2]d�V>' �*(_"X>I&�yκ�N�2���zZ}d]A���PRP0ځ�"-9%��0l$H�X��U:�G�����ms`N�3?��}݊y���HID���"v/�J�F�.�%2���Yï@�3a��TT;J
"��;��(Y^]k���֋L���u��?Q4�4�^1�oTY�8�b�ʑ�sr*��v�,�`�c��_s����H]�����$:��*�Y�0���s�n#�x�P����5���>�)������=`2U}�D�Bzy Ν�`��6�ȷG�]=�I���T>���N�&�o0�먃	�\H��s��Տ��O�ꫨMSK��VS^�{�ͩ�Vb�u�����uඵ}����4�G�Yy���!�ǔ14*߀?]���)\��$|��	�R~�b��ajKB��&	C4s� �_����A��4�㩆����^"���qo����un5Y������d4���ہ8�L���$+*���[}�{[������7��;��I���[�/P�0wI9�1(���9�^��?A?ٶ$���H$hG-�Ő���W��'��!d��?N*PlY^��>��"�sJ,�2�\�;���TL88    �w*���d�p�BS&0#pE�a� O� �Y�Z9�ѩ03�~�r�`���jR��ǉn�,�6����M��h�JY\�@5XIwx�<�F>�/��.}K�S����bM���"¢u$��Y����[�,Nd��d+V.0�b��)��"��D�Oh�tO�b#�Q�hOd�>˙�����;�C��Y��3I~]�;σ�|W��E�A�������U�UW�OL�U��6�8��&ͺ7��wlg�|s#Q��b��^ox�]vɧCH��>i�y|Tc��;�\�hf鰬����"���@ D��v����H[*��=�&��W��͢�l6��~C���${&vg��Vv�Reu�$�%�_������C�aS@YL����:��v1d���u��-)%���ϔF�+�*�,���b�їb��҅��}ѝ��R���]��)z������A�قM �ީ�0�8?4���~��j��?�|J�f��]cu��}2f!^~���;�S�{'�����,�o�rN؃S�hbW4�������8��35�B��8fۂ�8fH@�홹�iA��5b���e�Ҵ�gw�����>Ҟ������|���ޛ�KI����G"'Z/a�{(�.!3��ؠ6������M����w8��9��pFT����L�-ա���8�f���Qbխ�y������H��d9%!H�P(�+��y4ħ?�U]���M�{<a'΋DG(�&��Rd�L�7[�&�Sb5��|<�أ���<tq�2̑lO��eɏ˜U�)��Z��+"گc�p�2�-�젋���Pٸ��" ^���z#ٞ�ϙ|S���k�Ɨ�m	8qX���������9�V�$�X)�kv>�V=��F^p2��"7e��&�v8�K����J�i׆J0��w>��)EF.�/i���!2��PK.gz��:���<0Z`*��ޙe�x�����b���{*�X�6��؏{>��V�3����)i:�B�����]oӴ/�e�C��,YVd^6�逓��$^�i*��i�8�I7@σ\g����3����A�c�xqhܤi�Q��.��c���s�'����I���;@~��T�ٺ���t��dR��~�yԉ��E���2'F�.����Da͘h�����i�ա��}��v_
�HÊ�n!���a�����a�����N�<�Z��M��PK�.s�I��|���a�R<^�E)�r��AHFߺ���ɬ| j{<]���	��q�C�B|NG'ͨ>r���9)q��Ӛ�mjICː�]Z��L8�`\��7L�AN��N
�A~dtPY���54<a++H�[%hn��#���Bz�����*��7�{g��"���9����3�gDez���=��7��%fTy���{Y�2�f�|�Gԃ�I%8�:��ٱ�}������t��Z��`Zi�;�*%��IE��>����Ţ�y�)2�<'8C�sT����ԈDAbKK�X��&��$u������1�]]We��RΟYڕY��s�jC�C(��
� J�L��;�Sj�*GKA�A��e�y>rF]5��>ʳ��9�q랏���)����e`�pط���`٦� cP�����L����	�i8Hi򑢁�^P+� �#�l!a�3	/�������@U.���j�� -���P3�x���2��F��^�@�C���l��	r���n[x���C֥�ѵʢ!�]��Mrv�i&Ӈދ�,�
��:�78�i��[%c#5X��Z��N�ؒ�@��8LA���
 <�	:�	��6��V�X �:KCB6�y�l��#Ĳ�p\��E�|�5����k��{0^Ty_��K{;�_F���mS�r�(E�\�5��q�B������uA��}XF�1f�uH�A)_��ӽ94�&Zh���'�</կ�������H�I��`�s.{�>%<�ҡ}RSH�h��_"����O�d�u�ͱLy	4o��'�b(ĝ�,w\�_XZg\�}d7������u�!�ߑ��q��Fޞ�������Θ�s]�*.yT�s����aj���Jxz����C�>��E�K���MeH	��)�A1	���x�h�X�u`y`|��x�z<��"���������Ф��ѕ� x��5uH���/z��B�NՌݽ��AFi%?�Ljgy]���3�AY�tL���]g�:�Ȑ �%gA���VRr��F�X���>{G�����1ٲKDE	�A��!�k���A �?r�hPݹS@f=����8�%�w����2O�$C{���5H�I��^f�����}�V��y��~i4T��la��AX��(��0]ay�-v�QAd�s�/�#�>���S:P#Nz�K0M��d��|�MZ�_c�߅:�oA��SY�1��z�Wqz�>�y;^��Q��K�Z�m���:;�}ԓꆮ�͉�r-��q�M��8{�#���
��:e#|��qY��כ\š�����]�Z|S�l�.SR�Ĺx[8�S�BG�&�jX}�l��u5������[��������{��4��qn�&˷�ή72�ޒٗ肩�!}ʝ�#�E�{���g�;_��k,2�� �b��y
H�m�$9�=�>h�}?������:�C���}w$��u��&��]d���y�ۥZ�'F⭬jl����5�%�F)V���I�����a �>��9)��ע}U��I0�JtY��A�'oe�H�~�?#��uI��{���J`A�/�ַ��M0��	|���gS;~^��p��!��x2�5"�[*�
r+���b�	���v��Ƴ8�B�2?v�n`�O�8yw��aS����K�;`:�.LşqDW�La:���불s��~r����v[L��&��@�G�{����	1Q�P7&ڶȵ"�y��I6��d�=jȭ����J�o�A"ց�#\��p��9c�!?0ٴA���D�0Xe�P���C�}ɚ������s>��=��>X���u��I�t�ԁ7P��u�����!�s8C���%�K�+���6�]z�F���ρJ��i�^� ��������C���<���q�i��O1��:.��M�6Ҁak	's{tu��L%]�"(�K�d:����?��PR��2:s��vD��O���s1252�ᓋ��-��<�G�3�����6l,�L%�Wws�a�E�L��Y�[�aJȇ(Q=��a��f�4�ǅJ��y�<!�q8���k�S�q���aޑ7j��,�E#Q�v��9������v�������m�)�:Eʆ��k�L���9�;?8�F������2�q��dϐȥ�G̵�8h���<����\�S�#�ܔ�c/��L��a����g������S�-��#�=�ǚ�;#�F5��/	��U)4����J<�ZI�Ѷa��W��Ӽ�kc���@!9��M����6'���9Y�s�J���&K_�Ov/>%w��Y�"Z�mKL���e�'3�^eߊ}�2�d�iBÍ�4i�?���ݗ��Ez8��\>�.���KW�2�x��y ������H�M�vkз�������dGN��%��@� �djw-�:��*��(}�vC�R'88�/��d\�,�v'�S�?���O��
���G"]�}��05�4��]��[4b'�v��)��ɴzj~tA�j�Ɯ/,6�YY�K����!�v�~.ܹB�+����/9	�>���?��$��.q�d0����,LOf�g�Q�Wb��
8�sy�,f![gf9��a�5�z5�S��<��/�#����}��*}#��W�F��N�Y�J�c���j�� Av沙u�}hJ�^�ݏV:ͱ	��Xy�(��nz��f�A	xJ%��RX��6�`�z�|~�>L�������j0#T.IDV��sW����Kd����L�O�ъ��Mc��k����Uڐ�	�=�Ut2�8ʚ���j��4w1IR?�v�ID�����(�/��I��.�~��x=��`$G<��>���2    ��O��%fi�=Y�����V,P�ҫ��ɜ ��-�ѵ1(�#��鈇� �/�B�:g���O�i��c{C�)m�$>{� W����X���.�j�՘s1���u(�P�OG�ZN��{+�����R�f�se0��_���V�׽��u�6��� }�3�z�v1��#w��w޷rb�_ig�Ŕdb9d:��ׇZ�`��\kP ؏�?�`:�j| 1��RD^��gEP��&�`�W�.����w���U��D�֢�11�T��E{�pU�lR�"��u��>�ӊT���q�V{�y�d8���JDL�S��H��ݾb�n�S��L8�Eԛy �t3-�ki.xG��WX(�VH��)�gE8�$X���F�>M�v�[���	r���!DHr�����X*���pDL<�b�:'7�;/��%Yp���������':rcO��04�T�_��n���;c��Õ:G�M�M���>��26��������vhɔ�~��q!��_��ӷ�ɠ�)��j,�L�l>�̀�X��_.��r�:wY��R� �S��BӋ�_�}�+!������%��9��U*7AȽ!��E�{���nm�K㡘��y��/]
�pǰ�#'�D%��.ڎW���H	�y$�!���b�EꛬovXLZ�t��h�7�tPʁ��ַ%k:����9�O�z}�t]�_�yuD%����"b��+F����nv�/�UB�XH��Jw�ؾE�٨��M5�+���V~�	5�����}��;Ӌ������Ō���ù���3�>fc�FaTRd�r~	՛�n@$�"��t��l�U"�������#r���ɧ�i����kx�Kd��H�n�Ppr��n�Q�F���p�½M2���1cᜮ40`�nK�������!�L�� �`8.�쾋����埵@"�u'�;<�V�\L������]��4��~���*�_����XD,��{�=�2�s��f3��ы�����77Ͷ4d���;�4&��li���tQ4�99�Z��#Tb�r��k��"�����N���OK�� _�Lv�*�HN�Ǥ� r���5�88
�����&X�߿�� ��n��+7�*�������¼�����U�/O�k?�\}��Fx4Q7�"�w���@���ґg5�1�0Lİ�_�U��\T�6z��=��e ��v@q
�#J���~�"�Qoc�"
���r�n� |��A�^f"��[� ��&��׽������<K �Ms^x���%�cVD\��B���C �A�����/w�2���+j�Uq*�s���o����΅��khAÄ/
x7v�U�J�y^I�{�5���Ml�0;Js�  j)u���9�PζC;c����T~x���t)J��Ծ��רd+۷x{��� 3P$����,l;�������Y�G^Ƭ<����,:^[{�{���%��D Sn�Q�<�G�]�rI*���e�Cm�/n���&'���#��^ w� F�̍i�q�ρP���j��`U�4谉�9�p����\��I25������.h�3��6i螻=آ����0�$0��t���������i�d1L9i�����2H��8S�f�Mk4���!���ER�m�R)-*G�0����f�VX֗��U__�����D�UH��곓V��ʯ��� ė���N�F*��i��h�w^CF����䤌wb��b,<��Ү��wyj[E�E��@��?�NY���7�W��߁��"4�b���G��E��*䭻5\���ٿ���W�6t~�盌�Ѿǻ�����t(���Iǘ��\8H��}�_�.���X�:�T\Q�!Ą9�(\5��+��+�^��Dg;#��uGN�,#WR������jVa`��au#���$�mi<��12���Ω�L7� ���Ǵ���r��*e:	g��PÙ]墨'!�>[.�n渓�ҫ�u����U�|��?�*�����[ͰhL��D��I���r\}�IaZ=����mwܞ�T2�,�'֖@X�n	�����ZG�0�vN�h;%�x��g�6��`U�P෹�F4��y!�bU���!� �q�`ؔc�,��h�j_;g����<��M+Yp�"�JM�Owy}!�Ϊ,p.Ƕ:��LK�� ����9�n,?�Y�Ò�?��$��|G%�����f'z��fU�����/֝�z�8��O66�|��U�n��*��;�бD�N�o(�R��oa�P��]�G��\����L6�if"/7f �.ˀj��;tf���ẋ���vs)K�{����[5I���9�}P��[�/ �2������ɥ3(����=�_�j�,� ��p�C����k��#�DPz�]�c�ò!�̦q�;�U.:��C��~U�ʺ�"G�r5�΂�V]k����W��~Z�%�09X��l����,��b����R8Ɍ,��:�gQ؎xFO��8,ȱ�'ΊM�M�P�Xf���������5ͻ'5yh����q�+����S	~�- ��:�z��n@�*q�:ngX�I���)Ē܊�=���í�����ŋh#��h���P���(6�Ƅ�Z͢23�C7-�\�� ����3t:'z�'
mLp���T$na�w��,��n�˿Ȧ"���L�lMb�Ww�R�F���riԳ-�I��g/�� (��4�}N �|z��W��m�P�PM�~�I��ǁ1����ە�!t d�v9��\�S��8�ՁW�Ֆ9e6�	{�s����uM��ͮq�g?�Y�����׍\	R�h�������e4�����GyQ�M,��gշ�Q�nuAic��q�+,��j�د�l}��,��y��޺p� ~^Wl����B�b�vhex�}LA)�J��/�,�M �Ws,�̬����c(�����������aAϐT��\���K
=�ŷr%�wT��M�t��X D	
N�bNJ���$�g4�	u�}��I/����4$�+�sr�j�8��A��i�Y�"K�ǥ��2*Иf�拐���*������YR}Jj |"�q�Dd|������U,T����KgG���1$Isܠ+�#V� b?�����ș����w���m�~�܏6�:�-Oq/�d�M�Ӆ��\Swe�%Bȃ�5�Ӵ�5hv	�:q�*UgX�AS��"	����e� �G P����_�y�6W�WTk`r�N��� ��C@3�zso��a����W�����C�9����v��B���ak��]��S�>Z�}L��D]/I�y/q|SI�����^���yh�E��,�亍�}A�a�Ώ"�C�Vi�}�@��hZݩב�0�������2��|�Ȋ�B2<�x��U�C��pV�Z�,Q�@,�.���%�۳�>�gN2��s�� S�F��{|�����W(�,�h���;�X8Vj�Ι��ahH}G�͗`��.��E��&���D/�]g;8�zU<��5T%
É�+��ۑ������i���1��h*��ĮmxEF*�W~./�7�&���[(<��+�b� ��}Գ�z���Ƙ�@�Ʉ����C��@���E�c����хдmO|%��F�IfLR(��i���$��}���i�*1�>�P:�7�8`�nw,c�L��2.�PZ��~������b:hu)��P	H�F39#v ��x�qaDh�T�&y���S�z"��s$z��)��=��k�7:~Y�a-��f�lzWN�d�mL[?Y��4�I�H��j��"1gw*�B9��z�j�v�[�]r�b ���8b����´2���$v6�*�eOb�D��>�TK\�y>W�����`޳\:���JH����Dr�5F�l!����,��\2
F>��,���Oܽ�*{!�鳽t�0��yk���xr'Ҕ��6Z��ss:sp
�N*�R�6ﵖU��(�I8a��L,��ǹY8�秾���ř{�`���X;���w�>��\��F��CP 6N�X:��ޙ���ǽ��W�[~�,L�{@6    �'u�k}��@�d��.|ɱF�S-k�uRv[H��^��NӫnY�WY5�YY�˯�����h؞�˩�Y�ׅ&��BV�B��F�N.��������_X�1��Í���U��i`��U���j�lL_�'��'b�^[%�Ye�p9��O	�����I��>��J��,�Zҹ8	�D!��}�Ѩ�qV�FH��AI^q�d���!�v��+�����i4�{�۪�n����G^��e���K�V��a �!����$���,��8�ڲ�Ѷ@9Έ�Ƿ�f=�ģ�}��$e��/�dGQ�c HLL$z��$C���dow���ļ�J?%�'�#y�`M�H?5�,2�ǅ%��X��I�� �|*0�;"�Dt�����;ky�1�'I2�~߲Ԏ��L��0g~&zϝO��xy��حX1~�,?��H�cY[`��C3��g�@f�6 �-R�(��19����mj��`�jM��[^�'֎�|s���]
�Y�i?����9�_���N娉��L_LˢU8�����8�;R�U���A��~�!Me]N�����\(����e�;�{Q�bM��Cd;?� +r�m��)�d�ahz�\��C�!��y:�_���P�U.��Tr��[]T�leՀ(�<�CKM+!ڰ����q�vWJ�턦g\@h~����e{�7�\�e8XZ�L�=Hv����^.�S�Qe\n������xܖ����:��OrZĉS�LxA����Q5>����� ���ͪ������b� qJ|[�lD�zl3�U����ZL|m��VY_��O�^�aϊ��N*�� ������|���@I�@*\'�W�e�v���E1���+?���&CP����QѰ�]�a}��~�R�
`�r\�3�US���F�"���d��o�3&�ي���D�k��A�%Rj�%-N�5$��ĭ9����3V����G�� 
R�6��r[J>��X�B�=���&%�
�\���%_�:�9��K�!w���R�[)0U�>*�+^�h��<�a��-�/xf�'��#
g};��*����C�1LZ��[�-�f����¸6r�j�����_����PLm��7�):����u"��2�9��5 �E����z�b17ӠN� ���W��i.�4�<5��Յ
�?��&�'q�9��3��mP�7���h>$.H1y�+K��k�2��S/���jcR�e�]˓�h�և�m���i���
���x����-�$B�OS-�E�|��)��0`�)"�xV�g�2�0�_�2	�XwjZa`M
`w������� c���1�y�'�-�ĩI��$�\�\�����_W]�5|�S*��j�o��y��!�_��I�(�M�3���C=� �p�TY���_��������K�Re�%ؼ��'�3:��&W�;v���!��6,N����� ��4%���6�>�&R09e%n<`αƩ��I���>Sӓ�B�hn���^���3'̒>�+v�N��J�Igɂ	|�bK���p=��~�MM�q�o	@B?~�E!
��I8�861��~�kk��/�Ϙ
	n���<W�r��+��Cf����z�b�
��)�c�j���
�{�@�E��J%��Y�,�>�]q��^2*��Q;(D��u2�ަb	}���-\�u�H��H�����;����;�$��+��1I�qf�K���]��7��y�S�0���P�E�@��ll"�T������Fa0���"���q!���i6�F-wun�5�ƀ{�ǣD��/T�nT���������k�r�󋻲�d2��bi�XZ�ZlR�`5�X�MVmFXf��ɤk�J��[�ǎe��n�^vV�u��_T&Ƙ�Qnp�/̼���Yu�8�Kg�A�u��jՔ��Rp��-�[����%M]���0���vߦ�h�淜f�mZ(����\t{d��s���	A�]a�/�~ƈ^��<r�zW.�J��h�١�[�͹}	Vy���^U7|PȕQ�\�.o?.�ۙ���
0{v��.Q�~i"	8K2��FYz�P�ZL�={4��G�38�p,ݹd��	���F�Z��u&�>9Ρ)͐�b��vG�+:�J�)^�
���si��j�s�8���s�D���<'b�3T\#�(�4�s2���#�@�O&��� +y4y��Q5�p���f�Z��W,L8H��˛�1�yVOL�n�u�\���b���3����N��h�if�xVt���>��If�����}�� +.����rW�D�+��1��\-mף5e��a�nF��@�xM�m�����	7i]q��h:���m����Vs�Fq�<�{�YpQ��m�k��ʿ�tR�6L�#9��<@5�JR-�{%%�ge����鰗��'9��8�HE�lz��߃�SYZ��1���q�`��P�z��te��J}B,ʁ*�����ާ/۷��I�΄m�|��W��fc�Pkez��J4�q!l��t���y$h�l�O����Zd+{�����5���Q�[�1���6v�_�������:� ��C��6��/��e�-Z��v����9�\㚿4��:�z=�&T�X��yx7z�M����b8�1�gW��p�tEcz���4)8��B1R�SR��Ȕ�K�_c�<�Y`-�!۩e�����!�g��蜮ɇ:jrD��.��Y�4���h|��n룩��/�5�nOL�s�
��٠��{M9�j-�-"��lC=Q�$���5�*�z9��S��An�?��vN��G<V1��r�t7*�8Ok]�b��im!9K3h��P�.;ް����g[��ze4U�����"�6<�c��å6O�95�?���[�Ip�Z<�l��w�����AS����Ý9L�.�hM�{���| 3_��|�_x4�.��8]t�xcي U}]�1��&9�p{�F��M@_ �c�*��iBTǮ�=�2��(�L����߅�~W��^d�cr�:�r����}�D/��#�~�J��>�=p�|���Ta�e&�d��H��,+-���#	�ʗG�� /Y�
x��=���͑X}�\��NsA���N��|�h��[gF�n�m7�<LʹKU}p���B��̘ o�L��c\ا!�;�������\)R!��������#β3��Y��[WM�6k�5 p�q(���y뺯հC��v����>y��N��a,�����>��^�]DԎB��\�����c�5�l�W�E/,u�c�ź�{G�S5�P��5nt*��F�yƇ��1��^4�W��d!X�pF��N{���*F��r����rg%�̡�ti)�V�RTPN�����Q�	"�wHdi�1Er;�/���N��G�:�ng`��ڹ/�4YD����'L��/Ї)�R:�(��K�!����0��R#�D-�sW͹���d�߅��Z1҄�V6*`K�[]]Y�|=���Rx/���ɔ��҄���W�B�Sl�J�K
�okNF������>ݵ���.�7�o��,��M�nޜhx������|�9�5�"4F�ٵ���W�s;4��]6�{���� �@M��U>_Ȱ�.���#���=���3�E�,��4L�AY/�.g��{G��c�d}J�"��rsI�5LDe��b�kg��EB�kk����~�Ss���Z��M��[|_3�\�����6�vy�/� �F��Z#�R�����y��"���(RME�ެb�7�ϥ�M��&/YH�lh�l�o_J�U>��Gr�az�:��X?� ~|uU�s>3!E�d��ӒM�2,T�=��R�xt����I8�.�,�IF9��ђh|կn�a�g�g��F�����C�����ΛX������p����=mDNa5O#vR�R��mE�����q���D�嗫�w�aQ�h�v����`	��r��Wv��О�w�;f��� ����{Ég
+�T�Y!4��{-�=x��}�]3���~���!#7 v��RNZLR��.8 ޭ�lL���>����rR�LA`�7`��%    ���7ן	VA��莪{~`����q�Tm�?�i�Dq2Z���M;�-ʱy&��#�8��_\��W�}���!�ބ.0ѻi�9!�jh�6��s���������R�!2�F/�-�$|�I���=���N��V���W���áXa"J��1Z�VȜ�v�wڞ@�r�Zw"��S�MN���`��8���61���e���<%��Tl����}�,t�@W�TE��U�y^���I~�����B�0�ڍ�*zܸ�:��F�6U���� ��V}r��F�_-Y+�T瘩;`?�K,)��v�NC6��Y�F]�����CL�"F_�'9�$����`��	�����Aα=zRGV�R
|�4�: �i�
��s���Y��j��%�������|o�d�Q}u�Q(�A�/��u��%j�?�XR��ԒB���/E���ן���e��$؆��M��p�Iv�*:C����}�b�>b��A���̗{���-���M��z�sK ��������;��M@�6l��:����i��
� ���o��<��C������+;<�2 �;�3�k\��E���[pwݓ�?.D*�{g��S�P3Hh-MS'�r��Տe��"�($Ɏ+�E%�s������_��χ���Q�eڗ��񴸽6qoD@wJ+�j��_�F}v$���Z,�Ǭ%�2_��5���D���l��V�jo�����	��I�,�O��C�4񡥟��^3"�<@���~Lb��e��NH����'� ����/P{z	�(��2�8n9:��jK��8���Z.�������d[JC�,�es��-�uE�/�m��J�׋�p�7Y6��ʅ�>Z��ǘ� IV�&���Lw� K�,,�q��kx�:�����������SW�{Ɓ�&�zܟ���<���e q�C8[����t���i��o �>�~������l�XՓ]?#��>�g{o�c�>��	#	%rwY�Y\�W}��\B�t{������P�s�ԭ��R,6&iv�xwJ%��pI��T5�+�����	�C%@�&Z.@.<��:�T��j�]w� `e�$p&ӱ:V)y��*�3ߎ���J��^6��?�[p�}�Au�)��1Ҿ|)������L���(�N@K�w5/^ty�bݣ,��n���a6:|\`}�h�au#-�>�U���M�p��&x,(���4�F��$KG׿Bv����<8��-7FՍ����/�Z]�
o���6]l�c���كA0�g�&s��,x�uI.���q߮n\}G1��::n!�݄s+�7�iy.���+!���|�^n|R�a5;�{j�_S,R�����tfYp0�n�24�q��$3���E�W^���r�=I��W��'�K������7z^��V*oc{�Q�U���>�$��T݃����!���q�wV�m
1,-p��#��4�������$A�Z�&_!#����&�dy�TGU���̪����W��	��>AɌ朚RW�g�7�K̵��2�&���Ш&b�+^m�X��e뒌��]�V��t���[������}�)��Θ�G�+����'��>����(�2??��eAa�k�� S�ca���S��^�:��Jt���>Zl̿�e��HE3G4w�Y=�M��=����B�� /4-���J�a�M�&a��J������I=D����ZFa��@���I�A���m�"6Ǫ��t�7����������a�_[⨨����w猉MS(��PL^�#p\F�CÛ����^�Z��K*��P��VEI��>�s	 �/t�v����#z�w$� :X�C��ֱw4{w)���x��r� !�'#�}��N�Ј��4d��`F^$�J�B�X�!p�K��9�p�;��ۏ�YB�oF�ت��u־�t~p@�jL�yAd�(J�r�ݥ�^��3���X��pZ%W�@�\'A[�s��.�R�5���:/iǳK��+��P�Cr��%Ke_@�8�L,�{���TFbʎ���n}p��f��/ȑ�d�O]L�P��NN*����H�ZOy�yN ����U~ *\����@r�.��M�O#=��>������#H�R�N~٦���� �R���Ά�c C"p6�"�;4NDV�|��#�*��E5f*�]�p���G���k>� Κ���Tr]E�3�|:9�1"f�a�:c�׊��4S���E�1�'�va�K�N�9	�^7��Ӑ^{_AOgg��q�P�qd�s~l�H@K���y�%���M(�~P�.4������˝	~���-ph��hP��s<G32B_�������=u�5I���Ҽ�(Gk����	Kb�u �}�$���	8��(#�dN��Ί��q��hXES�6�υ��m������
�J�d$��;���]�zb(Ț�5r$�1S�i~~�GV6�FX˻Y�B�Ƚ�6�������Ut�V@ӊC����VZ~�;V�
.U��K7���Q�=W�[���\&�`�pz�U���5k
�S���i-@1MG̖J~חp�E�@��Bu��	�+|��c�D��\���Gm�|f�|4��4�5�WL�O��S����#�1#ʉ\<��\�:��[��tt_���if�C@�����}r��~<�V�S'"c�k$q��\��1v��.�q>7qd���	�~e0� �<���k�XF��h4��g	(qz��ܼ-ߥ��5�p�WK:y)�{'��S�~�5ׅy~^b���'�(=F��KP7(��T��޳���������O��x��5��Xp<��v���W����0�Q?���Ų�� y[KTl�p�%��~�oQ�p�����I2�-]^R�eNB�~l?k�)�1qi�+��^�*Kp!(�On�Pm�P�y���I��"�#��� 9E�06���V�����5X˙C�#�|�q��/j<���3�7�T;�]Cm�Ƌ���-h�Q�˅ p3eg#����]c��;bB:�̽~��.�"�~�$��M\%m�x(wF9[�I���fԵ��B��!��&�_�n����0��qn�σ���j�.�s3]��㪘%��'�S�:v;+�'����A��n50)~[ǝ|�bP�ɱ-.�,;awB��x<��[��E$��R�xY޸j��@��[tDq$��H���"�@<!��"΢�Z�;�7Z�u\�k�4����-�}P͡\U��i����0]���C�8�Y�C)��h�
5�u�c�b��Ef�{<	���{Q�o�h�5��M8�3�mr\e��+��&~I	�2��qV�7�a�d�<UՂJ3T�Nb?��|�2m���7v-�,!Y��
Ddt����.��I?�[r%}�@*�F�9ʆ�w���W����ݹ7M�R\��y��E>RA7��>����aobKJwfk���$�ܯ�Z-Rw5�3���T�V�ލ:e��--N��0��	�#�^���`�-L�I���I��(}�!0p��է�$ëUǊ�b	�>�?���#��@WύlU�"���Β����ڥ�ؓK�\����R4.����:�'�&*����2κ����$�;vx�#�&�S��<	͞@ʪ2N$�;9���3�P�K��%���!F�0��/�����1�y�G,�*e�w/�F���4[g�^a/�T�8�� �g��U��7=ʝ�U��I��N�y�Ш���)����H"XMƩ�4�hz�}a����$�8�����e�B������=����I�&0
�W.��՝�����a@Þ�;G?��V1\�����K-�Pn�	2	��ڥ�{�K�͚�n��RG3s�+?�t�O����k�h����}G)�/�4����/�Բ��!_tQ#����B�L�Z�ݦ��0����b�h��Y��҄���^B�U�K_Ӧ�PB�h��ڕ�~?��y�O!T�>�e�9W}:���r��;�3F��g>�Q���Ӏ6.�&֪�dpy�ÉQ	������������O	��n���L������_�����)Y�֬~>�@��[�������    8�(����Z�(_�/�B3#��{�]���}fg������~%�SwAj-͐'�bU��fdu��T/A��,�Q��� ��=��$�~�W��T����7p�E�� �I��<��1,Kj���H�37�=������xƸ����^��Hb.�w��˔��x:��+��٠7���'���J8�k�S�p�'�v�:ά��7��?���*Shb�g��� �OG��V��atbi��=��`��K2�����3�A9J�s�e�3��Ql�y<��cQ�{S� ��lxZ��H����u=�/����ZX���E��
iX�$�/ii��f���lobû��T	�M����nD]}��n#+'�l�kߛ��*�.|�:X������@;b:Ac���WrFD$&��3�0���A��̴\�7��$�+�)A|�DW���N���0>�}:uP�����xy!0-r�ҝ#���R��)�eA���Qj��� ,��i��p��x�f��`��� ҽ��z�)R-hk<u	��.���~��6�|N 	�����juGm!�D�K�F'�B}�����[�F[Ƚ��ix�wi�F�$�7>=1S��L~��z��q�[�C��ź�m���'������R���� e����7x���f��p��BaK&Su�\��O��ŵ���k	f}�W���+'UƉ&iNʗ�/���|��>������.F�-���԰�*8��4��BK��Q�wJ�٠J��u�Ԁ<S��]˨��
�pC���Vے���ݐXO�l��j9�k���o��;�d�*�=������Kv��D��U!�a�����w߸�K����� ·ѥB��VW�>��]�Cٻ��M��N[A�s�3K����3k�kN�6A�nÕ��'�S�?�%-��d*��'�5�_���]�Q�-6YK�Π�f����r�dqHdUЀ��]ٜ�`u?�'\���`��	�<c>2pZ�M��+#���,/�z���g�ǻ�g�'��-����ȁ���b����ndP���[�1J�����^lw�#����?�\�"F:"���w�!��I��i�(OKS`x�b$��~����z��M�L�F<i�[�9p��Z ;�z��٭E����fn;.gEQ�G�g�'>��:�V��+ '��ܮ-<W��(Y�I+դ�i�[���Xhp�\Oqį���S(�}�镘{�d(�]�X��d�N��Xb���۷�N���(�O|��	]��X��>�w�����ʧ��P�N�_{�D
(6O���Lzbn�J0�C�S��w?+ϩ��U�[�k*��O���M�#3���ק2����b`���P�6y�D��mB���-�,7h9���8�ET��Q{v�7]�ӅLk]�׃��߃���.
Nd��������ۤ�gɮUy�9��f����.�Z�� �o�ŝct�ݲ��'�aHq�l/e��U������xջ�,G���4R�BC�5g=D��ɅWN˴�3�Y�=/U��y_����6.�
�Y�;�K9W�i�_�
�h��y�������ޤ�Y�[�Ⲙ������LOC������Bkr��8\��8�˨�@�O��,�:�&(��������H��a�a����Ob!vҺ��M Oں;m��ʹ}�3b2�24�͵I���*�wq�y��<S7��sI�s��1��i%)q&{p�oX�ӈTm�<a����R�V�	�w��l8�M���i�k�1F�g��?1�I�N֥�w���X����3���}7�p��P�3?=J�U��fG���h�^{1v�
h��ˡ���cAo�34���<C��'�<=� �m���i�k�R�f�~ty��_����5�$�r�1��
�CGUї�If�m�a�C����'S��AK��	`���e_Q����%	a�"'�K�`�W��~��p�y��kE�+Y0xvB��TQ�
��}C�YZ��J�c�|�o�m2��0�eGr�$�,Yz�����-Z�~���]٭Y�'�Q�i� ���+��ur�=ȱb0�\������r��Ug���)�i{���tj�7��ӼQ�'����k��ƽt���� �0��)�I� YϒĖ��K�k��Q��l�pq �~��k[�8���|N��^ئ"���'��w߫Z���P�����(��p5=�:�)>VE���n֥!�r�k���U����7�0�R�O�#�}���n,�P�)"h��|�X��d�"be_<]����I�?@�LUbLy���\u���l5�O�=��}��r�X�&c�y�+&��=D��Ds�/{-K��մzG����	��	�k��M�I�T!��[�H vԢ�	�����S��4���\FT�}�c눹�4CԺ��zC����M����,��,'>?>a��#����]n$l �2=�W�	|t���Zq_"]���������>���$��
G�`*��\v+�::kW�O��.@��̄�3��k@�����-m~<�.sG�Īqi��@�5������p���j���X�]�G��SFto2RW(���æ�#EYm��t}��]3�gH����Kd��~#.K�,I��̠}h��sƮ)�L�̳�/0���w#���u싣S<U�jg	��J�>Ͻ�F����X�c��`ߚF}I>$BM}3�-��Qw���:҅.�l�آH�lA8��F�����m� �Y�5�2���̀��&�A��p��Yf�%@A�7���#��/����z��~k�c0$+x�I�r�.4�9�G�3v.�\K�lz�X�m�I�������}}B]χ�S��Q�	#qL��m����� |�uj^A�s�HEg�F��X���51uø�$9����+�e��7\��J���'Wx�c��Š��U�]6��pP���C2,��C�C:� Y|:��?��7ܐ�3����a����2�å��«������
�������`>R=���w��#����b��ٓ�T�:��'w�SYW��(B&8	T1H�ǵ�{It�(0�g���������ZW�ꂢ� \��h��@P�$��G�K-������K�tq�f����I��x"U��=)�M���e�O�9~6�O�~�f�4H�Ή�d��BP�����
!p5o�$�[;�k�Z����f�@P���\���o��r�cp<ۓ�J;��-ۉB2U��Eߨ��<���e_��	�:����&o�7�?9(/wv�R�}{;H��Z�"5������	~�<�k�	����̧C���r���b ;��<{�����6<���'��<��,�uG���%����7�^�Z��!�K�q-М��OU7tZ�i3��[��H����{��Y��>_\������9�3�{�M��F y`�=�
p*FŚR�R�K��+l�������Οl��苸�C�h!�!�%*܁������0"O��knɅw�����2��!���o�Z�����[��g|��<1Y�ӡ@�B	?
�Z�Jĉ�ܥÍ�eF4IW��c��07���1����'��ND�r�/���xw+s$�̖;A��^I�&q�3�*��"����#�/g&+�%U��`L�1A�E�,���^��x���BH�@���}L�m*��p���b��]{��)}�����v5�s$����e��Ɉ(�9X�Y�Tlv����%���G>�d�jÏ4�Q
x'�(�^�B5I�5�^8�C����a���@)����O,�8�Suj�t)�Ɂ�X�u�3�nA F���Ϥ�z-�Mw��䑩��+S�WY�Z��R��y���j��U%��`@yw(���]s��tٻ���K�j��
�	|���,��W�ʭז��1:�j�
��)�!VO^G�����(�V��M	BȤ�:!Ay=���*������]ɍM�1N9�Q�ϩ&}ˣ�A����K8�=hb�ސ�3���ihIc8��k�����NU*�G$a�|n��]�����b��ݵ&t	X�����(���j���)���N�)� p%���=����    q����#��
�7;��7i[&��̼8�#Ч��{0+�$�:��\.�%>���׸R����& u�M~NiQ0��0�#�O���*���Ƿ�a����0�q��+%��ݟ���5����	[9w��X�ǁ|L�n��%-HAX��+!��	N%���,G��k����*��ˍ�=Nr'��_�6),h�u�2���_�]A�|H��4�q����#i2JL��J���� 5�a]�[g��<�xɂ�<6��k6��TL��J4S�K��#�w�r���!7�\�zȼL�2���M�#FP�@f����Jz9�x����A ���6{����[{���C���d�f5�o-T��zZoS>%M7<�� ��Xf״;���:UI�7� �pD��"���I2�%B{�'Np�E�16T)�f��CH�R���HP\��d�	���|�]s	ۑ��#svn�Nꅰ����b+�����&�c�����Ҿ��_3��^t<�H6/�BŃ��ȹ���s(��� ���C׽.4��5|�`��j���ɭ�A]��5�.G��4�Ұ����&ͩs��k�f�̖��Y$�-rS�y����2��`Vd+̔����e��p�NL�O^��$��ȭ��s�F�D;EZ��-;����;��;U�0:�ØŊ���s�C�^E�e�3��F��b+GV��������l��\Ӹ�@BL���N�+}P��0v�F2|Z���R�A���l����p��������"� _3�OQ���'���1��t���b��`Zfq�~r�N��D�my(Nc��+��e7��a"���s�L\A%�|��Ʒ�]جY�8�Vd߬�%���Tj����M���g�x�t�R$}�M8ׅ6�5m��+�}#��RCx8�Q���4ͪ\h�m�q$�k��x��D��@)�|'�:������6Z�ｗ��ԇ7i���(J��������7F������:�#�h���B���ˑ����e��wVs����Y�/H�%��y:Am7��h�y��ֈm�N;���5ӛF8�NJ#���:�����T�4]���Go���M9����;Sꋼ���Wj�M�٤�b�/Ln��bȐ��v^[�J[/K"��ӏm��8gF���m����x��h�?�#���HԡN�3U���F�*T%�U�j�x������)M�H��edg�\ڇE�9�JK�����9��x2�|�۹��`㡽��5�C�@A��L���黍_�<4��+*S)|j�����sԁ�Q�)�x��YG��k.� ���O�ELJ�_PI^�(*%����hj�~\%y?�K��$IF�zM���Ã����Zo��\aa&�<xq�9E�F�셈������O���x���br}"!P~~:a��}8J,iz��/ܟL8��8`�YL�c�����6�w" �5x�����~"�?�<�.�v�BcFa�Ď�h�=��k۞{1�y�% ��@���UN�E|1Ϝ`s��>�E�ú\j[(ț�?�3~��ğJ���9��]��(z<�.����=���dY�l�ؾ=s7��0��>H�,2S�n\��Lde�O���N�3!єPdOȕ`1mh�ׁJ%�>� ��波.bj�vrU�6au`�J2at�O�/tOy�1(�+|���/����.�5cx�5�N� ��8���%�3�/��c�/)�4]l)L����M��Yѓ埪���q�~��-6��7C՚�������3S��q�=�u�C�Oc&�&T�En�x���º7��?+
�}%7�� p��axЦ��2`(:������0�>BwsYv_��/o�Q�G�^�'>�ώq;��Y�y��{BJ�XF��D��!#�v�IM�S,�r�}Y��:0ɨȀ*|;)������e���� ��i����G(�腻� �����m�y���Q����Q˱	Ʊ����`a/%��~H�$�~t���7ǚW� ɭL|�(��D��2h�e��I)�ɱ����#��9
�2d�ɛ�iQ{vg�)(*.���;�d������tu%���n}�)�$0I�s8bp��i�d���Z&ĿvZ�����dZA�MM1�>iM�v���"�H�A@t�`�k¡���Ux���k
�蹈�~!�͒�"�t�F��F� K�ݸ4(+��}8��EQ���
��&�R OW��4E��P�N���S? �RB)ڳV�NP^�ŝp�B�K���OE�dr]}tJ8���&��;L~*� � N�к%���!��bv/��r6�Sa=��L��O�б�w1~	d��kg���!\����um�Q\������Rߪ�tL؄�&&�����nB-`�?{]2��*͋'���k_2W��#����a�x˲ӛ;�#"w��5B�֩ʦ��^!1#��n|�p��f@R�D�ΊTx�xڰ*7{9�h��=�Na���H�<��g߲ͤ��0x�-�=[1�b6�����0��:�5J�*�:\��a0MAe��Y�$\��Q-�y[9;?�(�afa������$b��C�j?�!"d� ����H-��s傅�6p~
z���И�4{�[@k:�<�E=���5&͠v���`3g�x[5�%j��PK��!�Z-yg<��*l��z.si���uB�@�b�ۧ9S�Ҹu�6�/��d;<N�L�X��.�q/76_�n��I��5$"j
�&|zE��G�b�$嬴�a�� ���#��ZU�����9��JUDkr�5i`U��Aۏ&>X����)�_Ⱥ�����I3�Zݲ�+ ��>�6:�%:��<g\�3	�Xu���l�{KU9�޳��2H��˞���ժ�to���ͼ
� '	��2!fU��*h�,�K�a	W�K���R������D���K��>����`m�y8P�� Eh8㩨\ba� z"��U�n�1c܏w�1�Mz��l��a�Z�u�������\�p@��%K-�5�2w��	�ԁn��W[U�&�I�U����􂕇�j=��:f��	��M��m����!(��U��5����t\ ���1�ÒPY�����P�֘��Y٧�a�M�8"��a`g�D�P���(4����:�1�A�vc���d�f�E6E(���h�bd�, �^�a� �K?�������+,o�_��E,+H�2�@��WC�׶�ϜkSHS�Š?H��Q�qU��*�b �Vŭ`�����R�*L2�G���.]���Qʢg;��O�P�C���ծڮŏ^�h�	�R�{՛]M*�-*Y��{a�(c��s��;�L"�u�|�C�Fy�+�z��8.�J/�}��&��v��Y���{��zݽ�4�.{�Oq�os�C���,�a_�u���R *�]>K��:��a���ZXz�ߩy����<�w+���$�$��CU�D/� JE�ʬܔO��7���f���>nc�����㝅�� �������2���a�w ���k۷����W�[h�Tk�˕��1{�cڣC��BB�F!����:�iam�H�Ļ�_��
b�����®�tn���@x��\z�L��e7�҉
�S�V?�)٠��;�x[����L�2IC2ڼ���h��7��bF��܆�6��S��R��Ī{	<�S��XU�*|���.�� �^�����#x�`��m+˥g�-��~�`*!��.���S��g
aAt�Ԍ����֘@�*�}�LR�M�e����	V7��<�p�0+���e,��e��JF�ذ�U-�d舔2�攛t��d�r6?�ޔ|G�;c1��ϡȊ+d��
@�ɤB ;����� �P�s$j2�1=��N�u�oy/�g�N=|�	e��;��T9���-wwb�ZruAӪ0C���C�R8�7c��Yw�@��Y8H,��F��[�+/B�Y�����d���}(��4.i8�ʹo�9��q��d��w�*�2bB��7/��fS�@��������{!����qF5���"�<�Q��Mh�Hq��X�ҟ���]�^$D��!t��=���u���R0/�g%��Nd������Yw�n�cp5|��o��RlԪD�bbk�    �+�RL��r�v�T3!�R��6a����\G�O�7t|��'�˿�b�����|�j�
����l��4/��S�MS��h83ABi��R� 3���C\��籄{#��t^ږ�HL���s��V�"�o�.a���"�QzZ{��!�<q����+��X����ц�{�<� JQݟ.:E`�*�Q��kB����Ad>�S�8��� �*J���A*~f�Los����*I���4��B�츄A���[M��f�R����u���wg~�&��̊Sz�K�W���,A��!�9���ī�TT���AT��N�cjh��e�Ȗq '/�;C��F����?��O��$��_A'fnYs��B!�����>�?�)�2�<S�!!OjPo��V���I�L�nb�V~�-�ʿ�0]hd�+z�O�[ nL�,&t��Yy�5��"e$l䀚 8�4�=29�)yF�{��H_�`4x�o��S�۟n�߬�qд�zb���*���r�lf�������Q{m����n�?1j�Sz+*�����mɘБ���,8��u�'O���N;__���i����Z�tw�DY��$S�i��)I�_x�;��"]ҍY.�p�'
K��+�)/6���+yHe�J�	(�X��s����Y6�G��c�9����"t��P�e�⃶�d.��28vXD%�B2�q�?*;�	t�W׻�|2��R2~5�M�(��}˞m����o�Ր��L`TN�� n��j)K��9�]P�-��FF�����1K�(GX!)H�o����Y|��y�9�p�Wt�����0*�Ұ>@��S���9C��9'�WĴ��#�8puM�K,�EI+m6��"x:�1!�	C��[�p�r]+��%A��K�ebRZ��&FOBe��2~F|��3ӣX&�Է����7E�������DR$�<��? �P��3�y��F�e �����tM"�HC���(�S�ꪒ]f/�Y�i�Mb�Dɸ"N�V�ju�G���j��>}��-�T�k�Pu/��"�e���(��lrT�p�	1&夺��G8�xg$_�#K��^ٿ�u	!]�����a��O�!��?[w�S�i���&�6=�t�od8�f��]p�LK�u�7R.a��A.m����ES'$�L���7����F�SW��x�yx��e�d�Ψm��!�%N���p
usA��ՉQ#��i��F`���	'��,�q�!�� �P�J��;������Ĥ���)�&�r�xdׂIZj�eV"�/6�~ȨvBQ,u��,��B����I��K��!%E�p�j�����2ƴ�*r�>+�_5�?A;;�x��GHt,�5�nb�3+mլ\`�(���;�)��ٳ�w�+�
+��g�q�S]P5�����c�ؕ��������h8�_��A�'[׻{ �6�\[�yW����4)�jKA���<��{(���%qK�[�M��&�žiC�$8��U%�3#�{=>Le��R��@���0����`�)p�M8��|:{(b5��'D��4]D�M�)�	v&NH3g�ٻ]o��8N�ٲ��/nrJ��Y� �r˯�s�g��������_�Z/5r���	GLz�躊�0��	�b�Q*nf+nB�Ĭ�|�bR4��p�S�ZgִI>0B����<?q\�C�����;8\p:դI����g�߱���s߽�Dj{R�c��+[��yqו |N���\�v�4���ĳN.0����pz�S�gr]r� #B�F��8�8���u'�� ��| k�1F`�ӶT��4�5�l�+3��f�G{_�������i�|
Z�(��&
�M/����_�]�G%�}ۘ�ro~� "��%K>2�ڑ$1^ 0�]�G��vKׯ�8��i�e��[�cB��u
� 7��*�ەu��a��ۛc̩ m�Sf	��Tԉ��+�[��4� �X��>�)��1�&�nj����H���Yp�"ɩ�W��>m]_�m�*P�����@�C���9�Y��B�,9�$�1¢ʿ9	��t��-��5�L�5�H���Ei[��(OpY����i��v*�{����Y9@�e�d=ǥ�Z s�\��w�m����"��1|ɠ�,T\S�ћ��4��"�h�YeԶ.�bI6O_�dR$�%{�վ"�T� ��#<�}A��{ǃ%J���О�n�j����Ë�@>�RW����X��M��A�U��(o}��Q����<�b��4p3�3�Z�փH�h�t|P<��UV�z��������:x&-TU�X�IY��09���c.L�h�p�`V��p�j�b͏���W�FJ��,��!;�f�㜖U<�	��H�K�L�[��D�;.�U䉚מƂ�c�gJ!���<��i,�?;�,���;�����'/�ͬ�>��P��R-�&��ul�h���*?����5�7=��a��\ntУǓ!N_�RЀ����Ĕ�|n	��ھ�7�A��Ґޕ�}+�%7����?�7�4�� "9y<<�ww�ū��+�X�R����m�XD�CC�$�u��0�Ȧ0'�r�3fa!�f�V�k�2O�-&�T��i�F@*B��9�w�*k�ӄ�Tj��M�&�_��w�>?|�x*	����kq�[�zצX?���v��YU4�E�Y��e������G�5�o�%=��j�������謝�d2R��hئ�ӛ/� S�(p&b>���~����M��̽����c�}���	�p<8=Y���#}S��������Wb�Y��U��l���Ȩ�Il�h�0r}F�[_N�Ţ{YEL���� .��T�4�Mh��1����kY�����P�8)pk,��+jki"@��Iw�U	���.*�Ҭ^�=���.B�O$�a$¿i��v;�����/V�S�6��|���U��12�`�I:yA��=|�]8 ��B�V2�("��u�������#M8�D(uL8ޫ�h.��e��t��_G�E�1t�z�diW�#n4����6��C�g�1;ó�V
`��<���/Aٿ�J���k�1�p����"��u�D��tgҔ�6Y���6�;��1J#\�w{g���r`R,゙�s.��n�E��"k�`adJ"�]���f.C$�*K�*��b����0u?V��d�/O;�b�!6��^q��@JgK�C��Q�c��`Ż͵���tI�����j%cb����g3��1,KC����*�n���7����b%B���j���?�?����FcxbY˒ ��I?yN:���m58��{r� �Yΐk|�K��ʜc���(��+w��~�WJ$H)��m`fYr-��nl���̨H� /�a0�zz��:��b�s�(�a6!�X[B�g7��<�([�ʪ�3A��B\�U�+�SD��v�����i��p��w����}��>hnd��B�C��(��.ǘ�
|�����>�huv~�)��r��䂳��"$|�-�j(��ɑ_�h��)H�7�u�ߘ'�+�8��1�t�i��!�R)Vi�W�/�d�T��+���C#|��Gk��J���M_� ����mc�ӯ�N��_����O����e�(x�B!6�apO�[�G�,��%��� J�q�shn���������	!����$g�^k*�?��d�Z�T.�?{<6�T�o�՜F�.��[A6�.9񑧇�e����D� (�����2��+:��|J�W"��#�8��.̌��BS���4���`.�wo-�	eF�5E-I�\��8��)�F�Vg]tX�D�x�p��m���� ��$��O�C�X]r&��H)�ʘ�6B��H'�8���%�Ӎ��)�/��jN!͊��3Sm!�*^�p���� Oʾ3�)��"C��� �hm��M&��9�K�����H���|�����'򊃛��f�#:��ze�E���Ԣ���@L,S&���)���W��hx?A���W��騍O�Yr6���� �99U�¥�\o�Q��k�J���iD';�0"C��Yy��F����}��`�HU_� G0]
l;��qFʡ   @�M�c���n��I�H0'�gx�U�����k�q�I��k<��-u��������%Bc��<��bp7��9�@�W�D�UV�Rn1�o<�pT�)2�~\���bH\K[\���G�y��0Tk��'* ;��$4��M�� ���"���W�66k��h�醷���Ӿ��c$�?x�����rͶGT
�$���ڄe�x[�׷[1&�pR��d�V�j�@�0�4��x�l���?�>Ъ ܦBz�&<�D�Ꝿn�1�'`�&�}T�hȧ��A��|��O�M�s�@�w�8�Dm�r�?�֥����UN.�p�zNu~Wy��%<�dY\ګ��w�v�e%d#���z���9����u��!B�XS�e��:
%iQ*�;��n,o�/H�5K����
&�/DYő^'~�k�MQ�/&]"�c^u�L�r�bDv�r�A@��װ� �C�g�I.DV[�T�?JcV4!>f(#*{�oj�T�������m�����E��:�U��2���$�Ȟ����{3���BE�wʉNS�8��+�_
&�O��}^WB�/����g ]�_u�o�Fs�\qhI���Gc���$��o����)ofLW֨x��Fb���G�|��?�r���zꇟ�R��	�ѩ���+�`��D� ��Y�Y�B�o��������I��U(�(u7�!c���Y��K0��1W���̐�`�"c����p��U=���W`P�>����XH�~D�h�����C�/���Y���t�h >Y����=/�L �&�T?��8Tn�	�h>�g�{;c��/7�֪/ZabPv\�ߴ�y�7�\�	��9&��2���h0gqU���nQ�ֽe��n�Dn�l�xrlE�����P	UB G۰���N�p���k�V��i�H���Z�Xh=W���S	
[Wh�����e��Y0Q�:i7=�Ϋ��
��"Նa�"­H�佾��G�2O����9,x��rV>Ǣ��u-��A�.?��.�-���j�b��u��C�Za�l��`�u�C�A�]`%��ˆ�XP��ƞ��4����꿨��_��t-C��n�>��HY���s[�@�_�>M��U<��L;G͸;Q�k���A����H�^)�8@��c.��)�l�?�`����ne��-�W��D�)v��X�#���k�|"��>�C�*!яu:I�=�@Ai��?E�2���Y���
?�ł���j(?4Df�R�̎Th.*N!�(K�1�s�#g��ڔ��&OX����4�@N�����d֋T��,�I_j $�e�|l�`�W�i��[�ݳ�L��yhRk@�𮮒QŋF�<E�E��dd�(-f��Q�eW ����9���:W��$(k�K B�^e�^	u��ӌ��;n`�+ts�E`d8u�C�+��vWA���
�Ԫ57,��\��`zx��)�"�RRl�.�z*�=���b�2�_��9��lG<R��F�.��t�O�g�)e�!��ߺ�
�T&O��+���xlm�J�g\v�N(��E�ଟK���u��h ��-9;;7��l\���9)�Ţ�:b|��K:���G��ti�/�%8�'�%�&j�J�מ�E���]8-;1����̻Wq�kҠ+�B5��'��\ 	]Վ;Ǯ`8#����>����I�Aj��]Vkʭ�I��:��E��F�=���V��}ڋ�͠��2e�'�����(�$(pt�Ui"<Bœ����Y�����;�Y-B��/��.��͐�{򙯳�	'D'��_�?���=6�f����鿔�.�*����$X��P�y�����m���EF��θ������f>�m���Tz���oX/.��nlWg�ף��Yݡx��	�RCU����;8PR����3����֝�P1K��؆K�o�<����v��D�R����:)�j|R>����{��)@}}�e�)�<���To-c���G�7|ٌ�m&z�7)<du�g=��E+��j=�wv��`c�9Y��6=!� ����6���S�^�����#?`�D[n~��?�����ӝQ�      �      x�e�ɭ9D�پ� �K���v�~��R�R+� �������om�y�J��>u>��%�g�眿�������4�9�R�������w��~Ntf�����h�;��ʳ�C":/i1@�ٌ֓v��F6��n�Lb)��zN�c�.�Y�ٶQ�}Z���%W�\����i*�fS{���\r��1!?���Łw��9J|�M�r��O��<�j:�ۿ�nsi=�M�XGύ�K�O_ؘ`��<���(�X>pz�����v���&�k�}��N���XH��ON�eF6�\Yy��V��|���1S��Jܫ�9�hҶ���8_�h�.������^���+���e����􊭉��\Oۆ`��cc�����u�q��i5���.dd,���Ao8򘆷�yLvx��gB�ͭ��6��6�&�:i�!��]ME3l�P��M/�>7���Jտ��鶫!ryDvġ�r��_�J.c۰!��]��!c��_�p���'>�L����D8��x��J�ؖ��d���6EA-bwk�R�����LL+�e'��c�9���w�8tΛ���&A��-oL/��t�8Q�|�"�y©)'���ⵂ���Co�Sf�P�	����o�ї��vy�h>N�%�n�v58����Ӊ3�܏��~�S��/Q�_�T�.�%��Cą���ɥV_R�n�|�����)U�C.�jF�UK�(F�Ʌm���_jŞ�9H!>p�J�ۆB*��1:ܦ8�a)m�B�C�LZ�Ҥ:��)��b��5�2���t1���bw0J*�����q��u������^��JK���D���GN��`H[��Eޕw�~��T@+�{��g���b�B������
	3�0�N6a�#�O�MeޙE�Ng�����?�)���F6�r	Y΅����N��b��I%�8�Moć�Oþ�K��wcTB-NR��+��/u��O��f�$w0�x�eI�����	:#�#��ؒ��K(���k+�����e�]oh�Sn������C�SH�e:����w�,e�>�1�3]T|?Rq��+ߟ��%s��I]��R}�{�թ%)���Ɓ�V����Ы��#49߾���r
F]j�G� ���_0J-2W�g�H�����t-
�b���BV����4�7�E&Ǐ���!y5|���ۧT�X_Q� �an�-�Ǌ����
�
����uޘ̗��=��k�1��gf��/�S�n��gz �hC��,׌$;�.��)�t�8��ӨXm�{�Ǟ��=�z�zq�q� �����c،U��LN��_���&w�UR	u]�p�����V�IC��;�5d�|��:�a���	<i&'R�ݨZ���к�ؑ�Y��U�
O�f���ф�:y1l��Oi���w41�����\�jĭ��w)�KuI��E�o��j���C,����5��"oę��?�	���Y��\�9
�
3��o�������<��+`R�'����%���ơO��{w������<%x��*:��?M���}L�{$٠MmJ=�ytF��D�������{���5w�����] ���r��f
�G��c���~.XbD�4�����'|ЖP  �
e3	Q�Uv�j�^^��O��9o�����qh�^���"WqbN�ab�ru�c��lK7`�Z�i8f�b9��α-Y�y�V�R��hU(x�
�/T�o�4ipg�!�E1�:�ɥй�Ї���[B�lx#i7�-���Lp`~?�α����9�đ�v�30Nƛ/FﲙM���t|����o���yl�����,֙�S)�w=������ǻy68�1�0Z��Ⱦ]�7!���u��2��'-~���E:���f���)��Oy�#����=o��ޅ�A��-���%�ϑ��;d~�P���8F�.��s�\#޼���t ��2�z�뾃��2^d�m�,�M�J�8:�r��mAs��?j�&�<�h�:�ؿ�9�)sߎ E?����AC����\ĝ��F>�О��X̗��O*��.� ��a�ǆ�e�&�#��
��Rq~�=�#��%��iI�*�LS���!��,����/��0Z�r3*0��(�I���q�ēJ��^��z֨WI�G�=��+MP��r9�����Ph�e<��u�Gw�zz|z��/y���?�M���s����.+�냪�gv�P�{,=2��LN����g"�g~�EΠgz������$�@�u�x��v��J�֥w��-/��a�BK��������C �{�o��A���3��c�
"d4k��}Jp�q�CΨ��=��C]�`�@����|����i��.������`�7�@�i�3P*�����A��J���3�u�~!K����N3p��%0G��B"Ɓ�Y�Ra����>'����_���x�U[ 
�;h�ց��j���o����h�ރ�:c�~$�`�k�!���/7%�`���j�<��܌�_�p=���u���B�ԯ�P�U��b���:h(�'*6�h9)l'*��h���xe]��ǫP�7dc����+�\O�G/�y?��i�X~U%2�N���g��N�a���yԿa���v�8� {�Gթa�3�gpT�.�#���5��Q��*����y���nݏO3�}�>��XTG���Ȫ�OC)��GS�\�r	q�i�J`73�
6�M���.�M���c��	�1c>����P6�O�2��$��U��'ԥ�Q?7乀e�`3�Ce����P �s9Y�8R�����B�6�r:)S�VV~��c�G�Z�tkbǼ~�/~
�w�~���y�C�q�~��1է/�8d,�����=�
ˬ�{;�������^J����4�V��KԿ�K�����e a����od�NEl4��W�[p�;�b��[� Y����9�����q��p�k9�(o=���iw�}�Y�����#ņ�;���!�ݧ����?,�+��Ý����io-�r��bG��tQA�[�?�)���Y�p̬݀eQ�,ʭL[�F�x��C�h����Δ:���jv_��U��7��٢Y%%�*�
58��F��Uz�5ެ*1��Tf�#me9��Z�f��E�6�� �ӿ�N���8�x�OvS-{��J�C��LŮ�L����&�v%�]�gF���N}��e̮)8�_jȻ��RQ.�$z�aVfWU���*�i�5���׋�, ��7�tS��0�qr��t�k�¡����o����[u�)%�rN�.p0oI>�#M7���(,44{��(c�x#<_���O�.B[�d�;�s	冝��i���Ku
�8�u*1�8�miM��,^΢։�0�J�4ޛw���bK�|���aOBQss+<�UطB��~�6N��5�(m���#h-o1�tt����"GNO��� ����Å��������ˉM�NS��8�͸sen�Y��J��:�^�.�+��ի�L�K�*7���L�]�૨�e��7K�� 5.�ܻ}��Q��̰��E��V�n�U� h�d�p���[���P�[_Ij����[YG�KH���5���\���c��T!�6~5q�CE��J������ߪ�b$~��Ƨ`ۖ��;�++�h*VW�$L�
s��C���/��ե���[]�x��ك��J8��\i��w+(�����J8��X�WD�D����l����*Z�����
mp�k�(�sKl��߇mg��h��;�q*(rI��jT9S��`ћ�wC��~_��2�^��~6�}����B���!@�J����rK��-�=�T�Px���cM�^z���;��b�N�iR1�Vqf�e, Z������:X-/��sk��Q�>�}�˛Z<#��;�G��P���,h���5��d�sig��^�3��+��w{���d4� ;�������C���mk���+%�;�J�@wQ���.��}�vQ.�5��N@c���2�͎5���E�u��Ba\��0�	��.���_;�t��Mf҇����P F  zW�NP������R�\����L8��n�Z<����Ҋ�
��T�s�R�6��K�o��/\�����C�k����岑�2W;o,Нؙj��w� �%�%u1��</��`���7/+n������+����?T����N���ޝŁveO�P�{�7$]�\�<�d
���L�M!(�e߷�3����Rb�/�=�;�:���RYM �{�.>W۱���B�\T��Z�(����'oq��`ߤ6df_�AK��������[���Ľu7|bN7��V"ԏm�k-t��ށo�Q���( �#d	����L�w����}�*��H7��w�yԿ�
���˫�Q�4G�۵�y�Z�֝�W���_A���>�����z
�bw��W�@��
�]�NQ�k���2�K	��)����3�]���ۏS�R��s��}ޛ-�g�{�
��J����� �"'�5H����FK�&��"T��z��(4�c����T���oR���lw����
ve0�j��MдG����_�:�D�s]?��T9x1���\�t!�uEص��J�m��p\����rG��T��j��P�ʗ��&���E"q@C��!Cń}��'�&��Iv��C�:_�:S�����Y+q���3��P�"x�d�3rcx7����D�D�)�)���&����m���h���Βbq��{�c)�z�n��Mfa��v��ݱӬ?c��l�Q^>q�O?u!-U
�.����7�1?G6�t��]���Z��ϑ��(������6�O��]��@������R��
�|��*���H��W|o�U�����:AՍ�ƶ���� o��p4�E����Z��|WP�j8@��ܧ����+; K���:U��U�7�RqHl7Q��[��������U�9UL?�Vo��U���M<.�6	2��{�dx��m�(�W]�٘WS���`z����װ��N�����[�&�J��%oZWj��*Ǚ��1���N�n'LNA.��x�g��F�o�U���$�r�bU
j��&lZ����vԸ���̙"�D�jFE�+��V���l�,��L|�J�-���=�R����̄<�4������<��n����%T�8�5��b��& ^<y��o�y,�=P�/���a�7_�[�u葯�o=
����- �*-�5�AU*��+%�Χ筀����d�[ۇW��-P�# GiYj�[;��<z|��/+
|U5㹷د*�6�(�N�zT�η��_��	��4rS�E>���%�=�;�
-�ަy?��=���{r��%�k�Q�|QN�`E��&U���\�S|��0�������o})'���Q��"�����Ro�o�)���)����ٸ�	د
j���w�>Ǒ��}'q�¦5N�&b`:JS��E�|�筶|@�󡄒�U�C�|A�Ѓ.������o<��T�����®d���E�txߑ!�f�g�] A��l��>vQ�%��y�8_�ۼ�Z�}*vci�w���o
�+��(_���^ʽ��;ߎ[�GK>�?�V>׉�|(�.z(�鬢G���ѕS�ʧ������?��s&       �      x�m�M��:�Eۙs�
���K������lg�,ܹW�R�%@���z����{�����?w���o{���'�گ+�������������?��7j������`��ޣ�=Ѿ�t�������������h���>�~����??��aoȻ�Ž{]���X�֢����C�'ƽ5.��1�1���X����������������p�%@�@�,����Q�8ӄ ���~�G,��@��-�]�x�4H�b�'V�A��b�V4:$�!Y��3Tn��}i/5��Э�T��K�v�{��G<C�N�����Oϧs�_]��h%b>�c�[�D/+]��{YI���P,D�R��=��\un�S�������A��P�Ā�k[�����+7�×�ـ�2fڙ�W�s�/�\�s����b����\���N�'uZ;L�4O��?V�	���=�=���C���`A`����!nvK���yu�d%U:&������E�5����K��p��T?Xnc�	�4�1��閶��O���ݐWn@
�!�L���.G��1�x�v��?���b�T#S�e�c��UWB;pO�C���)f�yB��!��rFU�Kw�@�5l��U��[�rE��Cu�[��4��i�IK[*�ZR���;U��:y�A+l�lY#h='I����WĠ�%��o$��Γ��y�>6��L܊qIZ���HZiSB�ZA�� jIs�ϑ�؈Zw씌q#k��hE�Z��=$#j�P���Z�@KJ֚�JuD�:^j������W���D-�k#j�]�'j呏�!iŉ�g�KҲ�����!�;�d#iiᴓ����7ոӪ7U��h���1Ք���!غ����~�X*)�~ϣ���h�e�n����xVu�c�T�+t�D�?X�r$*R���jZA�Ss�L��t��p�)-PN�i���S�^�����:��$�h'O�r���r�b=�p���)o{�GY��n�T[��Fjj��My�U?4���@j�	�n����|	��MZ)(���e����2LĦ�
@l�MM�&w�Om�&]�?Ħ���b��^ b��ykĦ\���V�I(v�p��N�4��~x��ɡ��$�44Q�W��(�)}����t��܈M�X���$oW�Fj2N�J��Z:bS��:�ĺB�xTO�}#6���rۉMӤމM�����N<���w⑎���?�
�ģ�>��t�mjg`fX��G�S<! �Hg&�����Sq�:�H��{�a�ŝ|$��߉G��i�G:K]�����q��-験���ȝt$��IA3mV/�&S\'�w�d��AiX�g���tR���p%a!z� KK�����D�bM�+���{�ݲ6�iy��))L��B���ꇻ�3$Ӊ@��Km�@��p��l�d��q'� ���J��P�N�4!�L<w2��@RT,h���k�jPi�QqGBA'5 ;!h�[C��J�AIűr������ T'���@PK��Q�cG��S��� ������ڹ����$��|�lPn'���4��O
��wB��
z��v^�;!H�ָ��9�	A�����t;��W��nJ석����tR��H'�h�jݝL#���3��:2MZ�X2Mԟ�@ͱ*���׶N�Q�����iD�Rt2��U�H6O!�N�Q��V���@��U�	r�ii$o@� Ҵ+����sw��A�Q?aZQ'��'ڿb}����F�=	���Ν�9�:3/����a�p����,�+��;������D��AԑF����=�	}l�P?t�OZ�QA������4������B���R!R�$J���'{� �c��t�$���=^�DB�Lh��`$(Mt�� M�A<چ�A<R0ti`��z��A<r�q���/�t4_�x�4���x|�G
�=j�~��ć��l���Ѩ�V>��C�'%�6�(s��a��Q��Gh�G��Q�C-�h��k�
]�'�f:�Q����A0Z� �􃣀Q�?B �Qw�w���1<$G�	�����N2J�bJV��
����*���R��+��ʞ���t�d6H@�g�'	(󲱑%{��	HC@��Pw�y04_;\�@����r<l�0����d�^GH0R{W�$��`�$��K� �PZ,4�(#$#!�<0	H�� ���$��|�(��n�H@Y+������1u����,�c�0�:�h��Yʋ�3��		B�I�I���@ќΛ%���$�_�'aG���nٝ�<	;�رB��,�%|�����|�i�42���v�L��|��,L#��=Kz�U������ D�t�ID�ԁڹ1;�f�Q$X�IF1&�h�w Z��J=ke�̘�$��A�T��~lF\�#�F��|�F�����92�5��OI�b�$�2��%Z���,����kH��'�D�#�,��M��.nn�$�^�#��/͇[�ґ͒��IB�D�\�0�&�����<��[��!�^�\y���%$�`�$y(��	�����;J7	��g�&�t�$�t�f)�ٞ	����P����﹏&�I �3�	�H��ń
�<�'�$�FbB$��}�B�Ht���%&c�$y��@$��LIL��1N��ck�2SrD�m4�I|y����ׁU�׽�z$M���M�H�	`�X��'c5Ǳ�Y�O��,�����XM�,٧����w؏�T�e&��* CC~q6��]�D���آ����8I� 3\�*�<���+M�"�d�����-�"�$s�h�m��^��8���jl�j��
i��*`���*u;6� ��]��2x�0:J�Z�De\U�Jy�Jc�jPf�Z��g��"��^JY�6�U��<�w ʓ�l�lҪ�]D��ݵh���c�~Qg��咚(��8�<�:�d����_ǋ��hY��=�����|��;�s>�+ �u(��i�E���N;I��R�X���V:�t:z�씓/��#�יU�S#C���<;�H<y�H<�Ba1�0:�90���U�ǵߋȓ7�`�U�-vы�3\Զ�<�A�E�if�U�g�T��f"O���"��9v��<ݵG�2ϝ.w1:�5�1 a�9���B9�'$(	�;/4��g��Y������q�h��B�X��w��*a��V)bvQ�"���GL"�*y+W,2�ri�*�8�*���z��3�1�d���_�,�0�4�,$:���e����eOI�%1.Y���C�_ق��re�"e�P���D�Rgv)���&-�w	�\9�M�n�PƥO�D�yvy�� �T$��`��_+����H^j� �8؛d�u�~>��Ҹ̻^w���k����5�R�|2�	<>֛\������W8�����ĝ��M��<1MҎ����JSBMJ�qO�߅vv�]r�y�w\��!�<��n2M��]�&�&���R[��&�,Wl��t�]��e��"
㼉.�1�]j����V�P��$��������屖zv���d�]b5~m�����&���' ��Q�R[�Z�R[��.o�F^17�F�5�(�����M���Ql��p��.AP7	��=nJ�],t	���|� �!(�r{�J�LsG�\x%E���j�܅C��%&c@�Đ��.Y�+�t3&s��wOn?������&�L�71d��b���w}K�R�]�D�'��\7�KQ��'�dqh4yc9v��YzG��&�]b/� l����.��]����#yc8�����<č�ٸSL���F7w��]�.�S>_�d��e<Đ����2�?���v�Iwe�)r���C��qG=Đcs
�<�O�9�rJ5LR�!�,߱)DVci:e�q�9�h�����8�����1�䙬��xr_o���7�Sja�;8ē�\�)x�P�)i&O�����)o��>�MT�hbؒ|�	{��2�Ҍ�\��+�?-�q���~Jq����&o>vP.�3%C��楸�% J���x�f��Oҏ��;�~�~�1<ē�T�)�-�C<�� �  ��Gf"��O��V?5S�������)D�\V��O\5{
�܉K��O�`?���ߎ��N�;��2�ޮB'~�u
�BH76�%�m�Ndmu�K�(}�)E�Y�jN:��.����;����!�d�~�J��E����U\GN	�,�IR�p��!�4N��{�p�D:%1��֧V�N���4iY��Ӥ��J�I����#�%P�!�ʞR��ԇ|�q!�յj\�mA>yB�����7��<>��������B�\����������>w�����K����)��cm�^ć�r�;?�ˀ��������m�����"����78%oI��U+u���=�j|�s�||�2���#��;��Ň�M���Z����6}[�_��H*ӹ�����v���W�H[� � �Ѭ
ƌ�1>�їք�|��AKՒ�biH��=e�^;>|dM���0��s���\Z����G�<3�W�������G=�q��[��P�ϊ͘`��w�˃��*J�9��SN�w|����t�M7�ejO����Q��S�"��t�4R�?#K&��7�����@@|��G5�&�bf$�Ň��I�^g�ms|�H��E!�d��O�����"��;��T9^�#���7��3����L-b��}OI%�$x�mi��*����>`%=1C)Ư��8�G���y�SZ�����J}�����Ғ�Xt�������~�spi.KA�k���hI���Ќ��￿������       �     x�e�ɕ 1C�E.=�6�%��?���+����h�������7d���eζ���|�X�m�6m��#l�"ۂ˲�)�1�p���F��>غ::�EwY�����:�x��u����.4�FZg�@E�:�DCE�q&�l�Ӫic����@H�䃁�H����<��I�I���L��<xɽ�,�9��,�;4w��i�<���Sg�Ü���2��&�#��,�<eZ0�:�&�gT�1Ԉ�	��z���f�Oߺ�|d�-��A[!��E�e�d"��LQ\�	��mI&���d��7<�u�\�
�~�H�ܒ���7eDҞr�c���#�d��f2ϸ�6����m��f9�Zs$b�^�r�GH(�q�<M[Me���졙KV�?D�eU�Dq�vm��ۿ�^�"_r�ƭhk�!�%'a�-�2�{<�L�^��ބiەѡѐ�N���՞凌c��s���8�����u;L�?i9>���p�����K��sDlY��FC��Y�#j���lrv���@��m����gf�/�^9      �   �	  x�mX�v�6\��?�>z8���c+�{��<�7h�D �6��S���3[R��}ԭ�ۯUkS3��>�D� Q���NC�]����(�O�><�VGIa���u��S�Y�^toO��8nL�N�t��x���xV�5���=Z��5O^���0e���{usus����Oׯ�_���jw���CQ_�D�J��u��N���3M[��l����5���Y�>[�G��uÈ7��|{�I��{�� �&�V[�%���u����i��?��]gk�F��q���(1�!�^�0g�k�'�$��~�}3n8�ŐĜ���0NǙ�!k���P�i�S@on���$�zws��٫�ƣ�#_j#:���"d�r�bF=�I�^?�d3��4�=�fĵ�}������c���}�v������s6g$���h�m�)_�y�Q��ݼV݌b��R�&K�,�ip���Ba	*�`�G���m�a����{o��a7!�l
��y�1�Ì�y0������JⓨG�Q�.�}-�ך���!z�� ��NF�v��+c��^�3�(���9���<g��Ƅ[ۚ���th�ͼe�߄L6#!�17�4�  ʀw8=|r��qQ���k���8P������eLb�_1��-rD���b���V̍t��`{�&��>���s�@
���s�r@�M6!����Ԉx#$J����?ÌܪQ$��P��c]Y��4����7lp,y��]�I�vJz06�o(�>n,�xR�V��T��Ԧ�J9',Jf��KY."?�����0Ꟁ%��-�
�V<�儽	��!��v�H7�b\��5CN���;���[ֳ�	�Թ &��mK9��<�/�^��$������ԧ>裱yѕw��Ym$��w\vׂ{��Xaف�&�Qs�
G�7<�ט�A$ Xr��2���-�=�"��"~D7���d��Zv"�"�1����
��$dUԴ�t�F���u�(��w�2�x<Z {z��2��6�:��@�,8XI�&��D(d���,B�q��v'���?_Hg�5����z��Q����5��Js(���4G��A�&��/+F����埧�Jפ��wq�Y�յ���V���#�*3.RC9�y�����@no�9��_?���1&�;��9d��~H������6b\Z
�s�Q4m���%_�n���	���R:�z���Ut��z�J;�k28pUHS'�h�l�MO&9�]!|��+F
�H`��w�-��F4���2�@L�;�%T�6�dL�7Ӵ�A�p�I�^vc�@��
5!)��	�eYIT��0<���~�Ա@����s�v���f��i	��K|mN��+c���l;���i>�������-T��E$��4I���"vV 3Z
ŨwY�A�hu�f���fp��"u��E���Ӝ@@ש�"�c�]N (t������o�#�j���Ӧ�R ���/R��Ja��=8�FD�g*��s5�^���}����l���x���(`�DI�����q�%m�o �QNZ}��?A��qB�*��l�Ǖy�gRΥm9YH��w��QS��E�{����>Y��oIY�\H����@����ʽ�U�	��ɕh�� w�{��g b�A��)���Bm�[��$5p�/�R]1`��t`9�!O^o������������G۶��`���U��}�ό�C�aݹ̠����1*��݁�"�Ơ��q��	-z[��<J�?�-og���
�=w�z\���#���s �)@,�-��*�|��4Ђ��~e3�'���)mI��)��7�R`�|���s��� �8��J� i�K�/�F�e�R�x,�z��"}�5�6�GԞ� �$ЎdEh��O�F�}��o0�l@i�!��� H��X�a� ���#����0WM���zRr*��~6_�����a屘e��`��I��gtŎՏ��,���gQs���\�i���H�J�9�����ar�n����Zyw���VR_��K�g�+E[���3`�B/����NC�J"&���e���j�,���g�s��?�>
0!(���D���ض���f���Rv��F"˴B��c�(x8��B>�UDȸ���C��X@f�o����)[��'���>��]O�١��_?Ҡ�,:�e�nu���)�y,tU̫a*[2�?�[�wC���Zt�@�
��V[�R��U ,���lv�~���ܴل���ƠIk���i�_����Ǭ慢�m
�7wL��]��Q�W�2ɻa��_�A��epc,^��ŅI<�u������~����
�gp��hi��T1����L�a���	z�W,OSX�h���gfTwtt5�KJ໩lџ*n:I3���?�<��x�Rq�Po��FO�:�V�5s[� �9Lg-�����p+�W �d@Ǖ�Px_������+�^_�D��5� ��u����;a��      }     x�]XMs�:<���~�؉���x����j/	K�AB�֣������*#`f�{z��7�u3m�v<���d#�Fƴ=����4t��Ƶ������Q���Z���(J72������)�*�m}uP�m��
Q�g���n��`{�%�D�&���48?:;�n����ʔT���ʩ]�a��Q%�$G].��Kk��^Om���2�ZM?�n�A�&*7qJ��kM��v��κW%�HHI���qT��N��*7Q��#���Ɍ�����QI)P�Ϫ���y�8�l��΁��t��)�XȄ>�����>$�$o��&�<�շ�u=�!S�2�i~��2F���}߇O?����^#Z�L��h;��A���Y���!\�rH(C=9.ܵ���~���9=��~�+�Ѹ'�D1jNm���ڧ��~R��H�B�ͩz^���*�M\ҧQ����+���B����v��{�\åN6Q��W�L�I7W{j4�R
Y���M�\�Pj�`Co�ӓ�G��h���>hڿ�xP|�l��H��ux�Gej�Ǹ]Ēޙ����їַ2ZR^�����VgK��E�����e`,_�o��ͭ�G�A�@�?�h3��e�y��ݠ�A7_�i�CAq"�د��5ꋷ9m�l�Β��@£���C+�S�D��o���Z E^r��e�m�<��]Iq&�A9ӵ��l��-B�n��V��dLNq.����������,���O�y��R�B ��֘փ�XJ��`�!�AW?�1ڎ�#��]5�oB�*�^᪅�.��ID3�k{��ǁ���yE��jlKJ"�H���c,��Τk�;��g��\N�	s�El�o��p��V�Ir�@�Q�$a�j��5m��[[�U���K(ID�� I#	ש�k2H����Eǿ�GN9IE��:+���ה&�%�AG�d"A������/����V�'��};
Jr�H%��۽
��Ǆ���\K�qE!>t�n��ٞ��֋*�*"�,D}�فȤIE�Q�R�v;�A�!B��2թו�%�H# ��m�vZ�/�H��\��vu�uP\Q�Tҵ�Y��uΞ��,����Q��S����s�h1�R)��2�3}U�1P+}C�z�|+��d$��H���4��toCFr�_h:$r;��Q��}��h����,� ���U* �vP��i*�鴍���	���\FJ�$��3�~�ڢ���L�9!C��Y�@O̖'�:�SO�EZF�3x$�fE�t�Ka��ޅHK��j7kp@V��������R���2���
��V�/�J�D%��޹�09̉����r3�[Y�U�9e�� �i��#Y�����K���}q�?�"��Gk:E�^�� ��\��{�����2�b�%�����Fu9��B�VlB5F��z,)KD�ҝ�{�9q���H$�F>�<h�x\*2�)2Zr�kǡ���#�`A ↆ���Ld9���Yp����s����u?nO��Q�����/�д�Q:���oZ�Ⱥ�q��GG�RV��Dk��O�����0�y8O��5ϝ'{21e�Ƞ��ӭ==J�0C^m�����F#�J��
���-��Fғ<� ��u�1�^Iy$r	g;u��e�	�ŐX�7�\����IA�s�-�:��f?�f���1�<9�{�+�2˗�˔+/����U|$��1��j�pQ�zMq��[�[��m���T�O�B|��u����"���U<�T!�D����4����-�+�ao��n �\���!����.��&����ص+H����K86\�=)Y?C7@7��m{<�yE@�7��r�^�/dW��P���J0���B1n�W6 �8������UQ�BB�o8���=�E��-���v�v�@�j3�THQ�P!�y��[9{%fuYsZ�mpU,�d��w�RЕ�]k�úA5BQ@��[�r�#��ml��ܩ��u�	�(2��r��NIF��Om&�������L9�}�:܁[��I�	�� ,|`yIV��{d��;g�Xλ�y;8a��G�
Q���|6�É#���ˁwb�(��z�C1�e��\� #�Rh���U���X ��7��3��*��_Ӯ5p���!�2%��\�_��P�1-���B9��R�r��x�=�\j�sl��`�E�]�oG/��p^�0��r�LUT��2e
�������>}Q2IW���������(��f������}]6��P��2����̝���aY� u^��MՖ땋�!B4�ykOa�[psY�#�����B�<X}:1�y�1��+JQVpb���3`|�ޗ�
<��1�����D�r^^���by��+{ʩ�D%�A�bi%΂����3�om/�����C��|����J�m\/�i��P�j�?Vv�λN��y���Uz�6�u��"�*�	�p�`^o�ōȵ���^LU*���]���N����S��*�eUx��x-�B�ǯ=~�VT�*�����]z�_�%�4��
Q�lǑ��v/���N������҃J���`'��+����lJ���a�K�⟆x��Pk��a�O��agʸ7�:���(�o^�n��. �;���z�-��8�����w�1g��F�����+�F+0n� c&�5�+�,�q���7�啵��YJȗ%�"��c��+�_�R6/o���	'FL�����1����8�.���.XG)�#&�,����������j>��`�\��ޭ�$�BJy>�����`F8$��/!��p�
k      �      x��|�r����5�)��F���N�ek�$[��7 �$!� ����_fUw�#G0���]]������a/8[��|gL�2QY&��kaU$밬g3���pmLX.�:��"�2eFq��$[�s��עW��45�:/�*ɳ0��Mq�E�ɪpQ���g�y��ofQ�XV�e��_�S�צ(�,JC��K�w���$�	c��a�mLY��K�y�0�F�+��%�~��s䱓U�0X�.L�9�+���� XVպ����ϲ�A��Q���� 3տy�,��������D^�k~&�~.�u?���A�=����!��a��������Va�3<n�ZG�"gE�����f��x�$��	��>��:��'�*�H��²�ӯu	ئu�0E�"f��\�Yi�|��s��6B��΄E�ᇶQ�0���f�my����o*�M���'���؅��s�ͣ����G��	�cDa�(����V��Ƥ���ŇD�|JVX~�a���m�2U�2e��C���B0�"�����$C20|��ǌEn����I/��'-vXxUEXq�D�K�J)�$A�2�L�2+~�@d��ެ�i��Q��%�</V�`����K�����׷rY|�운���u�~"`��H�l[�S ��!��E���A������2����){fbl&�YcaQ\�ey~�YޅUT���t�í�^!+��\��7������"�+�+?3��m���Df���ƅs�XUa�̎���<�$)?6�%e\��c��8v�C�j7�'/矶͉�sm8B�F�(x\�%>i�݌���.S�u�<�QH@�6�f&������|.^v$�2��ѬNqhN�����3�t$g��"A�G�-�;��.I��D1r�^�������B�`���d��A=������<�_}z1�����
�a0�"8cg̃����X_��O@�0*�zE���\A] ���G����Y��8VX|�0�`7]�OAt$�ҬJ��������9�
_j�$�+�� %ϱ��&��tQe
�)�I��l̷��d�﹘���k�c�B�q0f�L�I� �(�!H��b	3H�Q
W��u*���E=�z65�7��3��:/��[�WQ��!\h�;]�)sn[�d]%��ߚ�i����i��r�k�$����M���t�N|�����o?>5!�51��à�;����tX;� �j���403�cn�a����N�B����8*KBo�r� �b3���6���������P䀾�d�Bh� ���fH �M����y�m雙)�� �F
#TK��dLJX�
��>�6������q�އM�z��� \��+�,�	+k�ج��HO�M��d�܇�G�ϯ~�ബ�5<����/$�+�c@�`�̬�t'F��<�B���Ι�K�k��E(+�Pˎ�ʮ�9�Z��P��J��8���(�*�U�FC��y6}�\mn`�3l���"d���$�Vn��'�[l�*J��
Y��7!CL/u$�<<�P*�/c�BE�:���2�p�rN��q8���}�!��*Ñ[����/���w�*�f��`�B��aݽ�ɍ�ie���H�%�t�X1�qb�׶���rpY�ʲ*��,�G+S���h�X��p�wƅ������<XB]F,D)�%RvZ�<�P1�w,��\*u.��K�����}E0c��]��)�����Y�{����u{�6� |�ם~pn�͕�)�xK��S0����)��_�DlQ��   ^ �E���6y2	T��!�� �s���%( �_k��PBl����
����?wxn䛐���Rȿe��Їfs�6�W��Mܮk�B��!�^��H4-��P�"�����Ҥ�.�c�NМ{��l���q�*�P�)����U��Go�h�y�u#�P��wĜ��9?����U�A�n������xm��]E������O\;��>	x��U�XX�		Ȕ-�ϋ��Y02�l���|&�D:(|��0B�~I�Dt*�@�/FY�e�A��HE%S�p! b���ga��BC'8�_�.�7O~�N�>,B��0�wF�xL^KV3X���4�˿D~�ip��~=*C��5~�)�丶-r��P������4?o��Em��G�����Уh�}�����&�۬VP ����rN��K�$Tw�=vb%g��tE�]X�c
�( ���ɰ�Q_��8!t��C�I��Am��!%S��2A�&q���I
��:��o�y�d6�َM�*�MIѯNS���w�|K�PLӷ�'�*��aDN�ۙiD ���J:ę��O!� ��\�'�����|13f�"�s)X���C�'�Q�u�
�2������V�2|�j��P�Pj�t�3)�t�@�����/����\��"@e�������� �=�H�EЈ�TKp�4�<��灙.�1�AV�i)����' !��9aR���=�r�7p�D�p4�V���6De/ �����^�߾�B��:X)Xh�\�[�� |����f�aW�#y�寥��^����l�'�44X�|���_ٕ�ޭ�S�2 ���9���k]�c,#߇ t�}��_�����5�K���`b���v����]ՙ��̼v�g�(�t�F����kH�����.2Yz#q��?G����ʥxVd�Rq�1�CA�S��f�h gV������DXQE������� v���I�Vdȳ<��pԋ���}Yy�V����Q�v���uOV�{�=�_~.�~b��*%{�!��؃�3�����2�Pl���d-�����_�W���B�|N�|�h	������c��#2n
3��ܯ`���(�,�(�G�V�y������� �
�Ç��j3�6��or������TH��w��WS�5
נa#�P�� �CDB.n�n(x�c�v�j���`k�~�%��iD�
K2�U�MGi�SaCz@����S�O�H�4;�ҩl�x!��;"Y^�O�;���������H8��\\���6�T6R��<,�'J���`"���z�2)WE��c�$!�ȍ'�)�bQ3�a�R���}�i�����͆��I�U���ຘG��d�IF@\�ɞ����ܯ�7oiÅ&�N�s�
��{g�X�{�2��z"kRAJ�����|=�m%��f� �\&#�m�bm(G<4��Qi�4y�Xu�ISF/�s>�dg�w�Q>��xa��gS���Mv�쎃T&�+/� �E�
N��R�n�����WJ�[AQ�"b��U�yB�=� ���6:�@�����o��Y���E�G}����u|�}�P���w�`u�I���e�v]�A����Y����,��Qׇ~�`TC���󹢜2�w�8){���*�I���Z|`�_c�v��V]l�5�kd'����YY�7I(<0�<>�Ȉ-��|���-�"u��,��� �ZL���6C#Y����%u;a ��fݎ�f��O�'���#�����Y�a�������c��J��\#E��Q�1*v�h(�+R;7�K?Kf�,U
�����$P^��l%��~�aCA�/'/����T����r ���uH��9a�
��0��M3ob۠Ҍ�Y�~����9~uUtm��vM�p*ktq*�v{����C��s�mU}�`�	bMee 
��G�i�gQY�i�C3Ȳ�v��dS><O
�K������Q$��RI�k�`Ɂ���U2���R2T��-E:�z�Y���2�C����|�#�����V�%��@��G�l�-u2�W��*XS�[�5f��Tǀ���J�sj����x��C����8*$���U�	�|������*��(�Q�
��+s��c�Y��٫�NƞG���*���m���I"2 3ß�hg��"{ӊb#g�HSm��@*%��r<��9_I�x!��ܕL�פN�i��omP_N��m9Rs�$�d�4Qi�|���d������������#�>��7.�����n��焥L    sy�����[<�T�˚pM.�&�Ua=��dB�"�9$AR8���xd���n'�-xv2R�)�2���>�?{��ysqr���/4��`^�Qp�bʙ���L�U��O��|��C�\���U��+��
Q)P�~��Q�b�������Vv8$�7�=��A?�������h��@G��9��\�ƚsz���:�j�ğ�Rsv��#E".�����v�]��/矛8N�C�!�#�x��Lyvk�	�$OR�����db�
!5�ڮ�i���K`��ߏ�����}�j�jɖ�H�N�'�#�I�sm�Ԕ�.wue�k�92K$�D�S��b����oǏ˒�?�����G3k�&hn���N�Xi%�U��,��{�HU{��ՎJ����߷6�D+DMeT�����m��H톶9���E)z]_{__>�O�7�3֚�L���!�`����2��}�hͿ\�	.�������k�RI�$�ދ��\kO�ۚ��ʮ%�l��`Tԅ�K_k �+W��	�Ǹ�"�k�����)ă�v����T��q�6k�ȭHm[yT�tC/�K_��:#�?7�{Ң���s��.��b+-�#�i#/��Ͱ��VJ��j����'j�u=j��������2��n� �D%��d����t�������S|A�I�l�ފ6��y1�������پ	�R\<�b��=8D��Yd>'�	�%xA	��E�m�H��քw��:���m���Y�!�qx�ʶDߪ����S��-k"��e�@c�����xBju��¤��(�ԕnf ��@��L��
�4[��yE��=���h)��!��_�,��_O�Ǐ��a�#>�����;b�Sz vF��"6U*���d�aGd�鬘I�]"�H���Wb�7(.Ɉqj"�Z����R��_[	L�Dъ	!�Q.Q���D1_M�΅�H|{�:�ދ�y�L�gwEy���W��!�*:�s*��2l!KM��ؼE+�Ҙ���FK�-��)抆��w"W��:��Rٖ��^��up�$���)�,+1qb"��=�d�Q��*=��-���ځ��:{�QE����:1��5OIcnP1V�<M�3#���N:g��� ���UΕ(�	'��~Jnײ��n�DuCOb��oh4��:�3;;��r�熣21���=I��z�
z3�V��jS��<��%L���VY��(״��ci�!��I��=:�ZT�p-�VӔt.lsd/�<�;Z5)���e���T��M��@����f�t1���|�v��ʻN��!�i�!G�/�Rh��GjA��!BW�L��+���"� �j:c���j��+���E�h�#`���k�[��"�%��"��2*jĊMT�djiV.	�R&�����~-N��C���S���?O�	s��N�W�;�a���%�눊�.�y����w6Z��+5)x�B��"�H`���ҔS�7�_8��r��?nD� Z$�/lA�Y��^�}|���m>3��ӏ1�C@�+X�5K{mU�,�{vq�ks���NN�3��-�t�rsT�m�
���d�E��S̙��}ڣH�t~%��t�L����9���GG��y%v�9ӽ�����|%��'�Zr�]z�;����#L����@q��D
v(�CzΙ쬽"dGbk *$��M $,�)���C����-4�����,p�lh��s+FS�B��u$���ybҙz�����nl�����Y���G��0� rF���npatR��p����N��[�C�G-K�zgW��<���Nm\�J�*��]Y���Nl���R]r
�0��J���
�"��3/��9��_�:H�����Ho�$PAg�y�e��,U�����l���|��٭��f�e��y8�ej4Wd/��<�&�w��%AGek��8��&1r�	ۡ[3Qma�^�������Eu]n���Ç u�0 ضA4����@p�p���/tgb#@�f��ʷ,.G�8�D�)���%*¡Q��P�~d�_���GT�xhPPX�_�_�3R���P����fæ�I~<]]���3|�4�#��eڭ�)"ͷ�/^���g�(�m3̖�L|#�R,t*�+ki���C���Z
��+�h���^4ҋ:-��J;w,����ګ���<��~�e�����j�,��ϒԝ�3�d����Y����k�	�ĳ`���W�ҹ��E"�w�©%�WvF�QԴ�Ҩ(�'�ӝ7e6-2ݳ@!I,N��l/
5`���(�+q��q����}?nƍ�aY8n�F�m�J6��Y��r��e��5)52�DM�1�5���iPQ�z��x,Q�D�����Rn*�31��9�"����#��_�����\��%C׳/�y��+��}�l��U�������C��0�/���8�lMt�?ul��5���#��;�!�
ҹ;��(��n��j��27sZ�{�ً�7����v;�N��:x�&��@]��h�֔�߉��\t�dU`���,EdJv谅� <#���p�RX�=��咞�hK��6�Ǿ^�Ѧ~�~���r$7R�����3Ũ�C��ȩMl*����Uk.p��*�);D@���`sjvl���]g!(������t�ϳ�F]�(������;��}Z��O�9������n/@O< ,�O��h���[�b/;��a�]�k�K�܃IRw��njurBiYhu+�|��C�^H�P�2�ЪE�e�1���Ch�t`/�%�;d��H�ث^1���?w�ē����|��u���x(��1��ܹdo/�6k�������@�ܺ0UպR��d���;�z�	��ى�DP.�H{+�Gq����Q�wLq��U�1Š�*���W-�^�$y�nx3QU_[��j�~�ıG�/�Ow'����=�=������ 2o�%�mA��au��_.޶�Ȓwbp�W�P��
��<)�ƚN"�HD�X��˭+3��L�=4��?����[s��.@}��=�Ż�*w���b6W�ζ%�Sf�vW��;�Q 9��}���ݮi����ڳ����g5��T���M7�"'3U�9W��\��X�]�8a���L�LD�6�^,��oNT�����qt����cP�� ��k
Ӕ�-��?.G�ԓ�@{4+��+qޞ�h��g���܌����~x&.�Z8�I�~1�;��+;U�{�Oeoo���5٫��v�'Q6]��>2Ut����|u8����m}ZJK&��{���>�i���j���1�[{M�(%8Y�R::mg�.v��.s�@��Wv�� �Е��ݰO�T��Z�?�er�WFZ�	K{�N����fs}�r���~L7t@P��(�dIm�_�n�]�䎣�i��K�!y��+Kj�C�O����v=.`��_�i�U�Ce�<��^���E��\n6/��z�v�ba��ࠜT�Gm���̿9�ilՙ��� ���u��/Q7�-�ݵ�x������͡�r�J)"�������h䕰E��;=z�~hs��rAL��@�a
�S]��3���z��2��.9c��F_y�%܊�"*�]P}�T�2@�{�����"Q}����7�uj���
/���#�u�2����c�i�[�u��v�jң�����L@{Gm�(>I�o!C�4k۪�l��9w�/o)o�<@51}u ʖT�!��K��eV��M�{�Ls�o�9���kֶG��;ѸӖ��ˇ��&}��v����t&���NpL�m��e�"�Ej�6a���SOtS�P�&ծ�{_��;k9��RMÓ��Ar��7ZSy^�������n��.�����:{�쥰v:�{C~D���L.>��1& ���NUƍV��D$1��R���9��~��[eM -C�b��Izw��W�fg���D۫*X�%L����l�E9� P�l����'��=�^�77N��w
<H�Tu�S׸���k��Vq\�]���������z��N/��9���Z���
YEiMECt�^[��(�,��):�ioʫSQ%�NqOPo���;�Ȧ[����( J�J���4lrq��㏮�SC:D�@rG��^G�b<bi��^��<Ȩ��EU��)N�/ '  X��R.�^�+y�а}�DN�^81h,���u��i�xu:�����s4n3�l)>8���_B����]D��m����ρ��v�b�pL͌���ok�G/#���k�k����F�C3^��f�rJ�\��hX��}3�;Y�>��^WSd�Dȫ��S���^VѾ�����Բ�/4/��N���O�F�I.��E-{}[��E��֍x���f�Mp����=�ɝ<ε�a�#F9��u����3y�-�C(6Q�x�:��FKU(�/R�7G��_L�V�_�_}�o���G������������X7X�h�6��gq�O�W,�����$�n��R�|�s1����Sv��L=|�����z�m�ل��"�4Z��M����:׋�r�B��س����f���|�:�Y&���I`E2g-hk�����8�ݴ_�����D����Pfbv�nt��3�W��W资i�
%�0C���&¢��h+�x:�d���g���������#�7D��hy�e�Q�GoM�^8>D�@��B�x'�?�3͑d���6�!�*�����)|M]-  �eN/��wb-�}�����Wv/���֟f��ߵ��0�k��w�חg�>�3֧T�=	w�[�E�F����-�G2��{�����4|��?h�+��uz�Tl�Z�˒�!q��^��;;8����&���G����=d�ɨ�>$��85n����㮻*o�k����a��,��y��C�2�j�{W�;xޣ��ZC�Nk*�U����g�#�55�˺��8��o�ņ�Z[���-������aj*�+�J�ݣ��aߧ�Y�)~�~s�Q�ʚˠ�;�{�?$�ܽrQ�k����\eX�#S�s}�\`��fZ���f�v���-=�z�/���z�����m�ּƢu_���.{j/�����VݿE?>��L��.x�\�%#Ѝ�G��D�k�4��<X;�o�*���*��WȚR}9ө����K߀j{%yz���q�N^}Z�D�T�!���"�n��?��_X+Q���W"�s��)e�ϳ���U���]k�ϯ����� ԭ�w         �  x�uV[�1�f�)�1w����ݛ,6���i�2H���l���I�j����f�&U�w��F�*��L�� �\�Qt�LlYkU@�Ky�QpEv�*��+>�iD� O�Qf�	H�Y2(���꽄R�bd8�n=@�߀x*�vZ��矑1��������P,E:S8(F ߂ly�Zy-�W�3��$}�1%��c�����]P���Z���c�!��#��nd�A>}�|$ ��/=G��o0�`N�Ze�.4�o0Cfs�O�b�=X3�?hζS�D�����y	�N�X���N�o:f�S�������� ��X"�a���v9�W[��³2/k.08�K=a�	ܲq D۾��x��΍�����{���ڕfy�ʆr��\� !���7h����������� �d `W"�8�^�і={6�J O��_�w��;1���|����L����7�3�?�>��֑�e�¦��΢u��	�a�9�W5؞j8�4h�e�۶����1� �N���G���}B��ԅ�mY���]h�f�c@��6:�C�A�ujU(N��س5�Bi��������V����w���ˣ����b�3�F[�g��b��X|���Z]�I�6`�tc}}��\>����r�L�"3�r���_f�e���_9����|� �͠3     