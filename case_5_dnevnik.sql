PGDMP  +                    |            dnevnik    16.3    16.3     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    157563    dnevnik    DATABASE     {   CREATE DATABASE dnevnik WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE dnevnik;
                postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
                pg_database_owner    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                   pg_database_owner    false    4            �            1259    165781    images    TABLE     �   CREATE TABLE public.images (
    id integer NOT NULL,
    path character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "postId" integer
);
    DROP TABLE public.images;
       public         heap    postgres    false    4            �            1259    165780    images_id_seq    SEQUENCE     �   CREATE SEQUENCE public.images_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.images_id_seq;
       public          postgres    false    220    4            �           0    0    images_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.images_id_seq OWNED BY public.images.id;
          public          postgres    false    219            �            1259    165767    posts    TABLE     �  CREATE TABLE public.posts (
    id integer NOT NULL,
    title character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    price_total character varying(255) NOT NULL,
    r_pered character varying(255) NOT NULL,
    r_bez character varying(255) NOT NULL,
    r_nas character varying(255) NOT NULL,
    r_ras character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL,
    "userId" integer
);
    DROP TABLE public.posts;
       public         heap    postgres    false    4            �            1259    165766    posts_id_seq    SEQUENCE     �   CREATE SEQUENCE public.posts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.posts_id_seq;
       public          postgres    false    218    4            �           0    0    posts_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.posts_id_seq OWNED BY public.posts.id;
          public          postgres    false    217            �            1259    165756    users    TABLE     z  CREATE TABLE public.users (
    id integer NOT NULL,
    login character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    f_name character varying(255) NOT NULL,
    s_name character varying(255) NOT NULL,
    l_name character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false    4            �            1259    165755    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public          postgres    false    4    216            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public          postgres    false    215            &           2604    165784 	   images id    DEFAULT     f   ALTER TABLE ONLY public.images ALTER COLUMN id SET DEFAULT nextval('public.images_id_seq'::regclass);
 8   ALTER TABLE public.images ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    219    220            %           2604    165770    posts id    DEFAULT     d   ALTER TABLE ONLY public.posts ALTER COLUMN id SET DEFAULT nextval('public.posts_id_seq'::regclass);
 7   ALTER TABLE public.posts ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    218    218            $           2604    165759    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    215    216    216            �          0    165781    images 
   TABLE DATA           N   COPY public.images (id, path, "createdAt", "updatedAt", "postId") FROM stdin;
    public          postgres    false    220   �!       �          0    165767    posts 
   TABLE DATA           �   COPY public.posts (id, title, description, price_total, r_pered, r_bez, r_nas, r_ras, "createdAt", "updatedAt", "userId") FROM stdin;
    public          postgres    false    218   �"       �          0    165756    users 
   TABLE DATA           f   COPY public.users (id, login, password, f_name, s_name, l_name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    216   #       �           0    0    images_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.images_id_seq', 32, true);
          public          postgres    false    219            �           0    0    posts_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.posts_id_seq', 16, true);
          public          postgres    false    217            �           0    0    users_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.users_id_seq', 15, true);
          public          postgres    false    215            .           2606    165786    images images_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.images DROP CONSTRAINT images_pkey;
       public            postgres    false    220            ,           2606    165774    posts posts_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.posts DROP CONSTRAINT posts_pkey;
       public            postgres    false    218            (           2606    165765    users users_login_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_login_key UNIQUE (login);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_login_key;
       public            postgres    false    216            *           2606    165763    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    216            0           2606    165787    images images_postId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.images
    ADD CONSTRAINT "images_postId_fkey" FOREIGN KEY ("postId") REFERENCES public.posts(id) ON UPDATE CASCADE ON DELETE SET NULL;
 E   ALTER TABLE ONLY public.images DROP CONSTRAINT "images_postId_fkey";
       public          postgres    false    220    4652    218            /           2606    165775    posts posts_userId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.posts
    ADD CONSTRAINT "posts_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;
 C   ALTER TABLE ONLY public.posts DROP CONSTRAINT "posts_userId_fkey";
       public          postgres    false    4650    218    216            �   �   x���)nAP�}���-�.�YBj�4,�O��ѐ&&�ҳ�9�d�svХJu�9^?�������!y��'ڻ���'q��)	:�@uY�<���ٮ�ٞ7�<L3�fl���Ձ-��0ԛ��kq��`e�V�B�2���"��Q^*�@��%/���)t�iԧ2��]���Ԁ:�[�p6����c�8v�h�]�-�6�(�*w������g��      �   k   x�34弰��֋��.컰�b���
�_��#cll�i
�FF&��F�F�
�VVƖz����d����Í5�&d	��P�a������)V�R�\1z\\\ K�S�      �   r   x�3�LL����T1JR10U16�M��qL��u��v�N+L5J)�7-	���3���p,0�.�r2�)��ptq	��Ȅ�L���([��X�X�Yi������� �!%�     