PGDMP          :            
    {            floristeria    15.1    15.1 +    &           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            '           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            (           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            )           1262    400658    floristeria    DATABASE     �   CREATE DATABASE floristeria WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Guatemala.1252';
    DROP DATABASE floristeria;
                postgres    false            �            1259    400713    arreglo    TABLE     �   CREATE TABLE public.arreglo (
    sku integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(500) NOT NULL,
    precio double precision NOT NULL,
    id_categoria integer NOT NULL
);
    DROP TABLE public.arreglo;
       public         heap    postgres    false            �            1259    400712    arreglo_sku_seq    SEQUENCE     �   CREATE SEQUENCE public.arreglo_sku_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.arreglo_sku_seq;
       public          postgres    false    221            *           0    0    arreglo_sku_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.arreglo_sku_seq OWNED BY public.arreglo.sku;
          public          postgres    false    220            �            1259    400660 	   categoria    TABLE     p   CREATE TABLE public.categoria (
    id_categoria integer NOT NULL,
    nombre character varying(50) NOT NULL
);
    DROP TABLE public.categoria;
       public         heap    postgres    false            �            1259    400659    categoria_id_categoria_seq    SEQUENCE     �   CREATE SEQUENCE public.categoria_id_categoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.categoria_id_categoria_seq;
       public          postgres    false    215            +           0    0    categoria_id_categoria_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.categoria_id_categoria_seq OWNED BY public.categoria.id_categoria;
          public          postgres    false    214            �            1259    400667 	   cllientes    TABLE     K  CREATE TABLE public.cllientes (
    id_cliente integer NOT NULL,
    nombre character varying(50) NOT NULL,
    nit character varying(50) NOT NULL,
    direccion character varying(50) NOT NULL,
    telefono character varying(50) NOT NULL,
    correo character varying(50) NOT NULL,
    cod_postal character varying(50) NOT NULL
);
    DROP TABLE public.cllientes;
       public         heap    postgres    false            �            1259    400666    cllientes_id_cliente_seq    SEQUENCE     �   CREATE SEQUENCE public.cllientes_id_cliente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.cllientes_id_cliente_seq;
       public          postgres    false    217            ,           0    0    cllientes_id_cliente_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE public.cllientes_id_cliente_seq OWNED BY public.cllientes.id_cliente;
          public          postgres    false    216            �            1259    400684    orden    TABLE     �   CREATE TABLE public.orden (
    id_orden integer NOT NULL,
    fecha date NOT NULL,
    id_cliente integer NOT NULL,
    subtotal double precision NOT NULL,
    envio double precision NOT NULL,
    total double precision NOT NULL
);
    DROP TABLE public.orden;
       public         heap    postgres    false            �            1259    400683    orden_id_orden_seq    SEQUENCE     �   CREATE SEQUENCE public.orden_id_orden_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.orden_id_orden_seq;
       public          postgres    false    219            -           0    0    orden_id_orden_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.orden_id_orden_seq OWNED BY public.orden.id_orden;
          public          postgres    false    218            �            1259    400725    ordendetalle    TABLE     �   CREATE TABLE public.ordendetalle (
    id_orden_detalle integer NOT NULL,
    id_orden integer NOT NULL,
    sku integer NOT NULL,
    cantidad integer NOT NULL,
    precio double precision NOT NULL
);
     DROP TABLE public.ordendetalle;
       public         heap    postgres    false            �            1259    400724 !   ordendetalle_id_orden_detalle_seq    SEQUENCE     �   CREATE SEQUENCE public.ordendetalle_id_orden_detalle_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.ordendetalle_id_orden_detalle_seq;
       public          postgres    false    223            .           0    0 !   ordendetalle_id_orden_detalle_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.ordendetalle_id_orden_detalle_seq OWNED BY public.ordendetalle.id_orden_detalle;
          public          postgres    false    222            |           2604    400716    arreglo sku    DEFAULT     j   ALTER TABLE ONLY public.arreglo ALTER COLUMN sku SET DEFAULT nextval('public.arreglo_sku_seq'::regclass);
 :   ALTER TABLE public.arreglo ALTER COLUMN sku DROP DEFAULT;
       public          postgres    false    221    220    221            y           2604    400663    categoria id_categoria    DEFAULT     �   ALTER TABLE ONLY public.categoria ALTER COLUMN id_categoria SET DEFAULT nextval('public.categoria_id_categoria_seq'::regclass);
 E   ALTER TABLE public.categoria ALTER COLUMN id_categoria DROP DEFAULT;
       public          postgres    false    215    214    215            z           2604    400670    cllientes id_cliente    DEFAULT     |   ALTER TABLE ONLY public.cllientes ALTER COLUMN id_cliente SET DEFAULT nextval('public.cllientes_id_cliente_seq'::regclass);
 C   ALTER TABLE public.cllientes ALTER COLUMN id_cliente DROP DEFAULT;
       public          postgres    false    216    217    217            {           2604    400687    orden id_orden    DEFAULT     p   ALTER TABLE ONLY public.orden ALTER COLUMN id_orden SET DEFAULT nextval('public.orden_id_orden_seq'::regclass);
 =   ALTER TABLE public.orden ALTER COLUMN id_orden DROP DEFAULT;
       public          postgres    false    218    219    219            }           2604    400728    ordendetalle id_orden_detalle    DEFAULT     �   ALTER TABLE ONLY public.ordendetalle ALTER COLUMN id_orden_detalle SET DEFAULT nextval('public.ordendetalle_id_orden_detalle_seq'::regclass);
 L   ALTER TABLE public.ordendetalle ALTER COLUMN id_orden_detalle DROP DEFAULT;
       public          postgres    false    223    222    223            !          0    400713    arreglo 
   TABLE DATA           Q   COPY public.arreglo (sku, nombre, descripcion, precio, id_categoria) FROM stdin;
    public          postgres    false    221   w2                 0    400660 	   categoria 
   TABLE DATA           9   COPY public.categoria (id_categoria, nombre) FROM stdin;
    public          postgres    false    215   �6                 0    400667 	   cllientes 
   TABLE DATA           e   COPY public.cllientes (id_cliente, nombre, nit, direccion, telefono, correo, cod_postal) FROM stdin;
    public          postgres    false    217    7                 0    400684    orden 
   TABLE DATA           T   COPY public.orden (id_orden, fecha, id_cliente, subtotal, envio, total) FROM stdin;
    public          postgres    false    219   �7       #          0    400725    ordendetalle 
   TABLE DATA           Y   COPY public.ordendetalle (id_orden_detalle, id_orden, sku, cantidad, precio) FROM stdin;
    public          postgres    false    223   W8       /           0    0    arreglo_sku_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.arreglo_sku_seq', 37, true);
          public          postgres    false    220            0           0    0    categoria_id_categoria_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.categoria_id_categoria_seq', 5, true);
          public          postgres    false    214            1           0    0    cllientes_id_cliente_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.cllientes_id_cliente_seq', 5, true);
          public          postgres    false    216            2           0    0    orden_id_orden_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.orden_id_orden_seq', 10, true);
          public          postgres    false    218            3           0    0 !   ordendetalle_id_orden_detalle_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.ordendetalle_id_orden_detalle_seq', 10, true);
          public          postgres    false    222            �           2606    400718    arreglo arreglo_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.arreglo
    ADD CONSTRAINT arreglo_pkey PRIMARY KEY (sku);
 >   ALTER TABLE ONLY public.arreglo DROP CONSTRAINT arreglo_pkey;
       public            postgres    false    221                       2606    400665    categoria categoria_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.categoria
    ADD CONSTRAINT categoria_pkey PRIMARY KEY (id_categoria);
 B   ALTER TABLE ONLY public.categoria DROP CONSTRAINT categoria_pkey;
       public            postgres    false    215            �           2606    400672    cllientes cllientes_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.cllientes
    ADD CONSTRAINT cllientes_pkey PRIMARY KEY (id_cliente);
 B   ALTER TABLE ONLY public.cllientes DROP CONSTRAINT cllientes_pkey;
       public            postgres    false    217            �           2606    400689    orden orden_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.orden
    ADD CONSTRAINT orden_pkey PRIMARY KEY (id_orden);
 :   ALTER TABLE ONLY public.orden DROP CONSTRAINT orden_pkey;
       public            postgres    false    219            �           2606    400730    ordendetalle ordendetalle_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.ordendetalle
    ADD CONSTRAINT ordendetalle_pkey PRIMARY KEY (id_orden_detalle);
 H   ALTER TABLE ONLY public.ordendetalle DROP CONSTRAINT ordendetalle_pkey;
       public            postgres    false    223            �           2606    400719 !   arreglo arreglo_id_categoria_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.arreglo
    ADD CONSTRAINT arreglo_id_categoria_fkey FOREIGN KEY (id_categoria) REFERENCES public.categoria(id_categoria);
 K   ALTER TABLE ONLY public.arreglo DROP CONSTRAINT arreglo_id_categoria_fkey;
       public          postgres    false    221    215    3199            �           2606    400690    orden orden_id_cliente_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orden
    ADD CONSTRAINT orden_id_cliente_fkey FOREIGN KEY (id_cliente) REFERENCES public.cllientes(id_cliente);
 E   ALTER TABLE ONLY public.orden DROP CONSTRAINT orden_id_cliente_fkey;
       public          postgres    false    219    3201    217            �           2606    400731 '   ordendetalle ordendetalle_id_orden_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordendetalle
    ADD CONSTRAINT ordendetalle_id_orden_fkey FOREIGN KEY (id_orden) REFERENCES public.orden(id_orden);
 Q   ALTER TABLE ONLY public.ordendetalle DROP CONSTRAINT ordendetalle_id_orden_fkey;
       public          postgres    false    3203    223    219            �           2606    400736 "   ordendetalle ordendetalle_sku_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.ordendetalle
    ADD CONSTRAINT ordendetalle_sku_fkey FOREIGN KEY (sku) REFERENCES public.arreglo(sku);
 L   ALTER TABLE ONLY public.ordendetalle DROP CONSTRAINT ordendetalle_sku_fkey;
       public          postgres    false    3205    223    221            !      x��V�n�6}���`�d��[�E�(v��X`_��ئW"]RJ��M?`�~�����(�v�Р/�C�gf�93d"���w��˼��%��/��x}[�n.s�eє9;��FK|��{òP9�q�� "Y,D2K�`�8rrklE%?�?�DL�(�6����H�dκƪ�W1\�4D��[S���?��o4 �@R��c�"r$Qs�7�N5�m88fM�g+E�0�l)>pY���4K���������icȍ�q(�W�ȭ5�f$x�._�3�]���V���%�r�,9p8�a{F���Z�;**���K�J��4v�z��:�#ݡ"����d��U>P'�Z�ٓ.��!���M��,���}>�{�*(����Ə`Ǳ2b����
ͨݍK9�u���ru�[�Ji*���,t�+��x��0�eq��Rק�Z�k�]Β�W
QQ_��9�S|�~��;ϥ�$�C1l���3�;9��3h�:�݈U�J�;U׭|o�y�˞ZB��9��Qm`�u���mc�Ͳ2���$�"&��m��~)tK:K��i��8��	9pe
�[g4z���V��<v�"�~����
(s)����)�>���5�S+K �
���`n-ކ�Z��D/�k�8�B���k�s����1K�n�=k���r�.�SS����Z����&0�t����g���!I�h/ֆ��|O��O+�4uM,���^�]�9�i|5���fi����t9.�~���Y6����	��;Ea�1�M~H��ױ�2��jUM��=�6,�(`�*E��{~�ء`���J�T�"��_T�U��e�TV'V�
��O��ck�/��e9�i_��)�;�u.k����Fã��N���Y3Xg.��{V�A����:3_�Q�U��^�$���{�od"�aD��KD����O�o�c�L�8:6��p�J��+�� @������e�C�01���a��h�t ��F��F�z���5CG;�����u�ţ������6g��^�|����&���B��B�מΏ���Pɺ=         I   x�3�t,*JM��/VH��/J�I-�2�t��O�/�2�tN�K,.ITHIU �J*�2A��0�����qqq �@�         �   x�m�K�0�������Ӹ�hB���]@��<��F�ËY��&l��g�� �I9�l� ��\aá�sʗ J[��'զ�n����p�� 礍]��0}�F?
�KT�ſS�R�7zD<Ɛ�Ū&ZKu��{�#3.m�8$��(Mp�F�j)me�"`�h� ~���u�Z?����W�1�UA^�         v   x�E�K
C1Cѱ��W翗���Pc�Di���x>n��l�fe	'��i���I�F�dX�d�L2�U�h��E��K8c#�l��cݒK��\r��������Nj�_�>ޫ)�      #   >   x�M��� ��^1�!��B�u`	?��c墎�h����S?�z`ꉩ_L�a�J~ӱ���_k     