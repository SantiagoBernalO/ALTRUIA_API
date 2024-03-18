PGDMP             
            z            proyectoTEA    12.4    12.4 i    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    42554    proyectoTEA    DATABASE     �   CREATE DATABASE "proyectoTEA" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Colombia.1252' LC_CTYPE = 'Spanish_Colombia.1252';
    DROP DATABASE "proyectoTEA";
                postgres    false                        2615    42555    actividades    SCHEMA        CREATE SCHEMA actividades;
    DROP SCHEMA actividades;
                postgres    false            
            2615    83359    security    SCHEMA        CREATE SCHEMA security;
    DROP SCHEMA security;
                postgres    false                        2615    42557    usuarios    SCHEMA        CREATE SCHEMA usuarios;
    DROP SCHEMA usuarios;
                postgres    false            �            1255    83360    f_log_auditoria()    FUNCTION     �  CREATE FUNCTION security.f_log_auditoria() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
	 DECLARE
		_pk TEXT :='';		-- Representa la llave primaria de la tabla que esta siedno modificada.
		_sql TEXT;		-- Variable para la creacion del procedured.
		_column_guia RECORD; 	-- Variable para el FOR guarda los nombre de las columnas.
		_column_key RECORD; 	-- Variable para el FOR guarda los PK de las columnas.
		_session TEXT;	-- Almacena el usuario que genera el cambio.
		_user_db TEXT;		-- Almacena el usuario de bd que genera la transaccion.
		_control INT;		-- Variabel de control par alas llaves primarias.
		_count_key INT = 0;	-- Cantidad de columnas pertenecientes al PK.
		_sql_insert TEXT;	-- Variable para la construcción del insert del json de forma dinamica.
		_sql_delete TEXT;	-- Variable para la construcción del delete del json de forma dinamica.
		_sql_update TEXT;	-- Variable para la construcción del update del json de forma dinamica.
		_new_data RECORD; 	-- Fila que representa los campos nuevos del registro.
		_old_data RECORD;	-- Fila que representa los campos viejos del registro.

	BEGIN

			-- Se genera la evaluacion para determianr el tipo de accion sobre la tabla
		 IF (TG_OP = 'INSERT') THEN
			_new_data := NEW;
			_old_data := NEW;
		ELSEIF (TG_OP = 'UPDATE') THEN
			_new_data := NEW;
			_old_data := OLD;
		ELSE
			_new_data := OLD;
			_old_data := OLD;
		END IF;

		-- Se genera la evaluacion para determianr el tipo de accion sobre la tabla
		IF ((SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = TG_TABLE_SCHEMA AND table_name = TG_TABLE_NAME AND column_name = 'id' ) > 0) THEN
			_pk := _new_data.id;
		ELSE
			_pk := '-1';
		END IF;

		-- Se valida que exista el campo modified_by
		IF ((SELECT COUNT(*) FROM information_schema.columns WHERE table_schema = TG_TABLE_SCHEMA AND table_name = TG_TABLE_NAME AND column_name = 'session') > 0) THEN
			_session := _new_data.session;
		ELSE
			_session := '';
		END IF;

		-- Se guarda el susuario de bd que genera la transaccion
		_user_db := (SELECT CURRENT_USER);

		-- Se evalua que exista el procedimeinto adecuado
		IF (SELECT COUNT(*) FROM security.function_db_view acfdv WHERE acfdv.b_function = 'field_audit' AND acfdv.b_type_parameters = TG_TABLE_SCHEMA || '.'|| TG_TABLE_NAME || ', '|| TG_TABLE_SCHEMA || '.'|| TG_TABLE_NAME || ', character varying, character varying, character varying, text, character varying, text, text') > 0
			THEN
				-- Se realiza la invocación del procedured generado dinamivamente
				PERFORM security.field_audit(_new_data, _old_data, TG_OP, _session, _user_db , _pk, ''::text);
		ELSE
			-- Se empieza la construcción del Procedured generico
			_sql := 'CREATE OR REPLACE FUNCTION security.field_audit( _data_new '|| TG_TABLE_SCHEMA || '.'|| TG_TABLE_NAME || ', _data_old '|| TG_TABLE_SCHEMA || '.'|| TG_TABLE_NAME || ', _accion character varying, _session text, _user_db character varying, _table_pk text, _init text)'
			|| ' RETURNS TEXT AS ''
'
			|| '
'
	|| '	DECLARE
'
	|| '		_column_data TEXT;
	 	_datos jsonb;
	 	
'
	|| '	BEGIN
			_datos = ''''{}'''';
';
			-- Se evalua si hay que actualizar la pk del registro de auditoria.
			IF _pk = '-1'
				THEN
					_sql := _sql
					|| '
		_column_data := ';

					-- Se genera el update con la clave pk de la tabla
					SELECT
						COUNT(isk.column_name)
					INTO
						_control
					FROM
						information_schema.table_constraints istc JOIN information_schema.key_column_usage isk ON isk.constraint_name = istc.constraint_name
					WHERE
						istc.table_schema = TG_TABLE_SCHEMA
					 AND	istc.table_name = TG_TABLE_NAME
					 AND	istc.constraint_type ilike '%primary%';

					-- Se agregan las columnas que componen la pk de la tabla.
					FOR _column_key IN SELECT
							isk.column_name
						FROM
							information_schema.table_constraints istc JOIN information_schema.key_column_usage isk ON isk.constraint_name = istc.constraint_name
						WHERE
							istc.table_schema = TG_TABLE_SCHEMA
						 AND	istc.table_name = TG_TABLE_NAME
						 AND	istc.constraint_type ilike '%primary%'
						ORDER BY 
							isk.ordinal_position  LOOP

						_sql := _sql || ' _data_new.' || _column_key.column_name;
						
						_count_key := _count_key + 1 ;
						
						IF _count_key < _control THEN
							_sql :=	_sql || ' || ' || ''''',''''' || ' ||';
						END IF;
					END LOOP;
				_sql := _sql || ';';
			END IF;

			_sql_insert:='
		IF _accion = ''''INSERT''''
			THEN
				';
			_sql_delete:='
		ELSEIF _accion = ''''DELETE''''
			THEN
				';
			_sql_update:='
		ELSE
			';

			-- Se genera el ciclo de agregado de columnas para el nuevo procedured
			FOR _column_guia IN SELECT column_name, data_type FROM information_schema.columns WHERE table_schema = TG_TABLE_SCHEMA AND table_name = TG_TABLE_NAME
				LOOP
						
					_sql_insert:= _sql_insert || '_datos := _datos || json_build_object('''''
					|| _column_guia.column_name
					|| '_nuevo'
					|| ''''', '
					|| '_data_new.'
					|| _column_guia.column_name;

					IF _column_guia.data_type IN ('bytea', 'USER-DEFINED') THEN 
						_sql_insert:= _sql_insert
						||'::text';
					END IF;

					_sql_insert:= _sql_insert || ')::jsonb;
				';

					_sql_delete := _sql_delete || '_datos := _datos || json_build_object('''''
					|| _column_guia.column_name
					|| '_anterior'
					|| ''''', '
					|| '_data_old.'
					|| _column_guia.column_name;

					IF _column_guia.data_type IN ('bytea', 'USER-DEFINED') THEN 
						_sql_delete:= _sql_delete
						||'::text';
					END IF;

					_sql_delete:= _sql_delete || ')::jsonb;
				';

					_sql_update := _sql_update || 'IF _data_old.' || _column_guia.column_name;

					IF _column_guia.data_type IN ('bytea','USER-DEFINED') THEN 
						_sql_update:= _sql_update
						||'::text';
					END IF;

					_sql_update:= _sql_update || ' <> _data_new.' || _column_guia.column_name;

					IF _column_guia.data_type IN ('bytea','USER-DEFINED') THEN 
						_sql_update:= _sql_update
						||'::text';
					END IF;

					_sql_update:= _sql_update || '
				THEN _datos := _datos || json_build_object('''''
					|| _column_guia.column_name
					|| '_anterior'
					|| ''''', '
					|| '_data_old.'
					|| _column_guia.column_name;

					IF _column_guia.data_type IN ('bytea','USER-DEFINED') THEN 
						_sql_update:= _sql_update
						||'::text';
					END IF;

					_sql_update:= _sql_update
					|| ', '''''
					|| _column_guia.column_name
					|| '_nuevo'
					|| ''''', _data_new.'
					|| _column_guia.column_name;

					IF _column_guia.data_type IN ('bytea', 'USER-DEFINED') THEN 
						_sql_update:= _sql_update
						||'::text';
					END IF;

					_sql_update:= _sql_update
					|| ')::jsonb;
			END IF;
			';
			END LOOP;

			-- Se le agrega la parte final del procedured generico
			
			_sql:= _sql || _sql_insert || _sql_delete || _sql_update
			|| ' 
		END IF;

		INSERT INTO security.auditoria
		(
			fecha,
			accion,
			schema,
			tabla,
			pk,
			session,
			user_bd,
			data
		)
		VALUES
		(
			CURRENT_TIMESTAMP,
			_accion,
			''''' || TG_TABLE_SCHEMA || ''''',
			''''' || TG_TABLE_NAME || ''''',
			_table_pk,
			_session,
			_user_db,
			_datos::jsonb
			);

		RETURN NULL; 
	END;'''
|| '
LANGUAGE plpgsql;';

			-- Se genera la ejecución de _sql, es decir se crea el nuevo procedured de forma generica.
			EXECUTE _sql;

		-- Se realiza la invocación del procedured generado dinamivamente
			PERFORM security.field_audit(_new_data, _old_data, TG_OP::character varying, _session, _user_db, _pk, ''::text);

		END IF;

		RETURN NULL;

END;
$$;
 *   DROP FUNCTION security.f_log_auditoria();
       security          postgres    false    10            �            1259    42558 	   actividad    TABLE       CREATE TABLE actividades.actividad (
    id_actividad integer NOT NULL,
    nombre_actividad text NOT NULL,
    descripcion text NOT NULL,
    docente_creador text NOT NULL,
    contenido_actividad text NOT NULL,
    tipo_actividad integer NOT NULL,
    estudiantes text
);
 "   DROP TABLE actividades.actividad;
       actividades         heap    postgres    false    7            �            1255    83420 q   field_audit(actividades.actividad, actividades.actividad, character varying, text, character varying, text, text)    FUNCTION     �  CREATE FUNCTION security.field_audit(_data_new actividades.actividad, _data_old actividades.actividad, _accion character varying, _session text, _user_db character varying, _table_pk text, _init text) RETURNS text
    LANGUAGE plpgsql
    AS $$

	DECLARE
		_column_data TEXT;
	 	_datos jsonb;
	 	
	BEGIN
			_datos = '{}';

		_column_data :=  _data_new.id_actividad;
		IF _accion = 'INSERT'
			THEN
				_datos := _datos || json_build_object('id_actividad_nuevo', _data_new.id_actividad)::jsonb;
				_datos := _datos || json_build_object('nombre_actividad_nuevo', _data_new.nombre_actividad)::jsonb;
				_datos := _datos || json_build_object('descripcion_nuevo', _data_new.descripcion)::jsonb;
				_datos := _datos || json_build_object('docente_creador_nuevo', _data_new.docente_creador)::jsonb;
				_datos := _datos || json_build_object('contenido_actividad_nuevo', _data_new.contenido_actividad)::jsonb;
				_datos := _datos || json_build_object('tipo_actividad_nuevo', _data_new.tipo_actividad)::jsonb;
				_datos := _datos || json_build_object('estudiantes_nuevo', _data_new.estudiantes)::jsonb;
				
		ELSEIF _accion = 'DELETE'
			THEN
				_datos := _datos || json_build_object('id_actividad_anterior', _data_old.id_actividad)::jsonb;
				_datos := _datos || json_build_object('nombre_actividad_anterior', _data_old.nombre_actividad)::jsonb;
				_datos := _datos || json_build_object('descripcion_anterior', _data_old.descripcion)::jsonb;
				_datos := _datos || json_build_object('docente_creador_anterior', _data_old.docente_creador)::jsonb;
				_datos := _datos || json_build_object('contenido_actividad_anterior', _data_old.contenido_actividad)::jsonb;
				_datos := _datos || json_build_object('tipo_actividad_anterior', _data_old.tipo_actividad)::jsonb;
				_datos := _datos || json_build_object('estudiantes_anterior', _data_old.estudiantes)::jsonb;
				
		ELSE
			IF _data_old.id_actividad <> _data_new.id_actividad
				THEN _datos := _datos || json_build_object('id_actividad_anterior', _data_old.id_actividad, 'id_actividad_nuevo', _data_new.id_actividad)::jsonb;
			END IF;
			IF _data_old.nombre_actividad <> _data_new.nombre_actividad
				THEN _datos := _datos || json_build_object('nombre_actividad_anterior', _data_old.nombre_actividad, 'nombre_actividad_nuevo', _data_new.nombre_actividad)::jsonb;
			END IF;
			IF _data_old.descripcion <> _data_new.descripcion
				THEN _datos := _datos || json_build_object('descripcion_anterior', _data_old.descripcion, 'descripcion_nuevo', _data_new.descripcion)::jsonb;
			END IF;
			IF _data_old.docente_creador <> _data_new.docente_creador
				THEN _datos := _datos || json_build_object('docente_creador_anterior', _data_old.docente_creador, 'docente_creador_nuevo', _data_new.docente_creador)::jsonb;
			END IF;
			IF _data_old.contenido_actividad <> _data_new.contenido_actividad
				THEN _datos := _datos || json_build_object('contenido_actividad_anterior', _data_old.contenido_actividad, 'contenido_actividad_nuevo', _data_new.contenido_actividad)::jsonb;
			END IF;
			IF _data_old.tipo_actividad <> _data_new.tipo_actividad
				THEN _datos := _datos || json_build_object('tipo_actividad_anterior', _data_old.tipo_actividad, 'tipo_actividad_nuevo', _data_new.tipo_actividad)::jsonb;
			END IF;
			IF _data_old.estudiantes <> _data_new.estudiantes
				THEN _datos := _datos || json_build_object('estudiantes_anterior', _data_old.estudiantes, 'estudiantes_nuevo', _data_new.estudiantes)::jsonb;
			END IF;
			 
		END IF;

		INSERT INTO security.auditoria
		(
			fecha,
			accion,
			schema,
			tabla,
			pk,
			session,
			user_bd,
			data
		)
		VALUES
		(
			CURRENT_TIMESTAMP,
			_accion,
			'actividades',
			'actividad',
			_table_pk,
			_session,
			_user_db,
			_datos::jsonb
			);

		RETURN NULL; 
	END;$$;
 �   DROP FUNCTION security.field_audit(_data_new actividades.actividad, _data_old actividades.actividad, _accion character varying, _session text, _user_db character varying, _table_pk text, _init text);
       security          postgres    false    205    205    10            �            1259    42606    paciente    TABLE     I  CREATE TABLE usuarios.paciente (
    id_paciente integer NOT NULL,
    nombre_paciente text NOT NULL,
    apellido_paciente text NOT NULL,
    numero_documento text NOT NULL,
    grado_autismo integer NOT NULL,
    edad integer NOT NULL,
    cedula_docente text,
    cedula_acudiente text,
    id_institucion integer NOT NULL
);
    DROP TABLE usuarios.paciente;
       usuarios         heap    postgres    false    4            �            1255    83418 i   field_audit(usuarios.paciente, usuarios.paciente, character varying, text, character varying, text, text)    FUNCTION     �  CREATE FUNCTION security.field_audit(_data_new usuarios.paciente, _data_old usuarios.paciente, _accion character varying, _session text, _user_db character varying, _table_pk text, _init text) RETURNS text
    LANGUAGE plpgsql
    AS $$

	DECLARE
		_column_data TEXT;
	 	_datos jsonb;
	 	
	BEGIN
			_datos = '{}';

		_column_data :=  _data_new.id_paciente;
		IF _accion = 'INSERT'
			THEN
				_datos := _datos || json_build_object('id_paciente_nuevo', _data_new.id_paciente)::jsonb;
				_datos := _datos || json_build_object('nombre_paciente_nuevo', _data_new.nombre_paciente)::jsonb;
				_datos := _datos || json_build_object('apellido_paciente_nuevo', _data_new.apellido_paciente)::jsonb;
				_datos := _datos || json_build_object('numero_documento_nuevo', _data_new.numero_documento)::jsonb;
				_datos := _datos || json_build_object('grado_autismo_nuevo', _data_new.grado_autismo)::jsonb;
				_datos := _datos || json_build_object('edad_nuevo', _data_new.edad)::jsonb;
				_datos := _datos || json_build_object('cedula_docente_nuevo', _data_new.cedula_docente)::jsonb;
				_datos := _datos || json_build_object('cedula_acudiente_nuevo', _data_new.cedula_acudiente)::jsonb;
				_datos := _datos || json_build_object('id_institucion_nuevo', _data_new.id_institucion)::jsonb;
				
		ELSEIF _accion = 'DELETE'
			THEN
				_datos := _datos || json_build_object('id_paciente_anterior', _data_old.id_paciente)::jsonb;
				_datos := _datos || json_build_object('nombre_paciente_anterior', _data_old.nombre_paciente)::jsonb;
				_datos := _datos || json_build_object('apellido_paciente_anterior', _data_old.apellido_paciente)::jsonb;
				_datos := _datos || json_build_object('numero_documento_anterior', _data_old.numero_documento)::jsonb;
				_datos := _datos || json_build_object('grado_autismo_anterior', _data_old.grado_autismo)::jsonb;
				_datos := _datos || json_build_object('edad_anterior', _data_old.edad)::jsonb;
				_datos := _datos || json_build_object('cedula_docente_anterior', _data_old.cedula_docente)::jsonb;
				_datos := _datos || json_build_object('cedula_acudiente_anterior', _data_old.cedula_acudiente)::jsonb;
				_datos := _datos || json_build_object('id_institucion_anterior', _data_old.id_institucion)::jsonb;
				
		ELSE
			IF _data_old.id_paciente <> _data_new.id_paciente
				THEN _datos := _datos || json_build_object('id_paciente_anterior', _data_old.id_paciente, 'id_paciente_nuevo', _data_new.id_paciente)::jsonb;
			END IF;
			IF _data_old.nombre_paciente <> _data_new.nombre_paciente
				THEN _datos := _datos || json_build_object('nombre_paciente_anterior', _data_old.nombre_paciente, 'nombre_paciente_nuevo', _data_new.nombre_paciente)::jsonb;
			END IF;
			IF _data_old.apellido_paciente <> _data_new.apellido_paciente
				THEN _datos := _datos || json_build_object('apellido_paciente_anterior', _data_old.apellido_paciente, 'apellido_paciente_nuevo', _data_new.apellido_paciente)::jsonb;
			END IF;
			IF _data_old.numero_documento <> _data_new.numero_documento
				THEN _datos := _datos || json_build_object('numero_documento_anterior', _data_old.numero_documento, 'numero_documento_nuevo', _data_new.numero_documento)::jsonb;
			END IF;
			IF _data_old.grado_autismo <> _data_new.grado_autismo
				THEN _datos := _datos || json_build_object('grado_autismo_anterior', _data_old.grado_autismo, 'grado_autismo_nuevo', _data_new.grado_autismo)::jsonb;
			END IF;
			IF _data_old.edad <> _data_new.edad
				THEN _datos := _datos || json_build_object('edad_anterior', _data_old.edad, 'edad_nuevo', _data_new.edad)::jsonb;
			END IF;
			IF _data_old.cedula_docente <> _data_new.cedula_docente
				THEN _datos := _datos || json_build_object('cedula_docente_anterior', _data_old.cedula_docente, 'cedula_docente_nuevo', _data_new.cedula_docente)::jsonb;
			END IF;
			IF _data_old.cedula_acudiente <> _data_new.cedula_acudiente
				THEN _datos := _datos || json_build_object('cedula_acudiente_anterior', _data_old.cedula_acudiente, 'cedula_acudiente_nuevo', _data_new.cedula_acudiente)::jsonb;
			END IF;
			IF _data_old.id_institucion <> _data_new.id_institucion
				THEN _datos := _datos || json_build_object('id_institucion_anterior', _data_old.id_institucion, 'id_institucion_nuevo', _data_new.id_institucion)::jsonb;
			END IF;
			 
		END IF;

		INSERT INTO security.auditoria
		(
			fecha,
			accion,
			schema,
			tabla,
			pk,
			session,
			user_bd,
			data
		)
		VALUES
		(
			CURRENT_TIMESTAMP,
			_accion,
			'usuarios',
			'paciente',
			_table_pk,
			_session,
			_user_db,
			_datos::jsonb
			);

		RETURN NULL; 
	END;$$;
 �   DROP FUNCTION security.field_audit(_data_new usuarios.paciente, _data_old usuarios.paciente, _accion character varying, _session text, _user_db character varying, _table_pk text, _init text);
       security          postgres    false    10    213    213            �            1259    42614    usuario    TABLE     �   CREATE TABLE usuarios.usuario (
    id_usuario integer NOT NULL,
    numero_documento text NOT NULL,
    clave_usuario text NOT NULL,
    tipo_usuario_id integer NOT NULL
);
    DROP TABLE usuarios.usuario;
       usuarios         heap    postgres    false    4            �            1255    83362 g   field_audit(usuarios.usuario, usuarios.usuario, character varying, text, character varying, text, text)    FUNCTION     �	  CREATE FUNCTION security.field_audit(_data_new usuarios.usuario, _data_old usuarios.usuario, _accion character varying, _session text, _user_db character varying, _table_pk text, _init text) RETURNS text
    LANGUAGE plpgsql
    AS $$

	DECLARE
		_column_data TEXT;
	 	_datos jsonb;
	 	
	BEGIN
			_datos = '{}';

		_column_data :=  _data_new.id_usuario;
		IF _accion = 'INSERT'
			THEN
				_datos := _datos || json_build_object('id_usuario_nuevo', _data_new.id_usuario)::jsonb;
				_datos := _datos || json_build_object('numero_documento_nuevo', _data_new.numero_documento)::jsonb;
				_datos := _datos || json_build_object('clave_usuario_nuevo', _data_new.clave_usuario)::jsonb;
				_datos := _datos || json_build_object('tipo_usuario_id_nuevo', _data_new.tipo_usuario_id)::jsonb;
				
		ELSEIF _accion = 'DELETE'
			THEN
				_datos := _datos || json_build_object('id_usuario_anterior', _data_old.id_usuario)::jsonb;
				_datos := _datos || json_build_object('numero_documento_anterior', _data_old.numero_documento)::jsonb;
				_datos := _datos || json_build_object('clave_usuario_anterior', _data_old.clave_usuario)::jsonb;
				_datos := _datos || json_build_object('tipo_usuario_id_anterior', _data_old.tipo_usuario_id)::jsonb;
				
		ELSE
			IF _data_old.id_usuario <> _data_new.id_usuario
				THEN _datos := _datos || json_build_object('id_usuario_anterior', _data_old.id_usuario, 'id_usuario_nuevo', _data_new.id_usuario)::jsonb;
			END IF;
			IF _data_old.numero_documento <> _data_new.numero_documento
				THEN _datos := _datos || json_build_object('numero_documento_anterior', _data_old.numero_documento, 'numero_documento_nuevo', _data_new.numero_documento)::jsonb;
			END IF;
			IF _data_old.clave_usuario <> _data_new.clave_usuario
				THEN _datos := _datos || json_build_object('clave_usuario_anterior', _data_old.clave_usuario, 'clave_usuario_nuevo', _data_new.clave_usuario)::jsonb;
			END IF;
			IF _data_old.tipo_usuario_id <> _data_new.tipo_usuario_id
				THEN _datos := _datos || json_build_object('tipo_usuario_id_anterior', _data_old.tipo_usuario_id, 'tipo_usuario_id_nuevo', _data_new.tipo_usuario_id)::jsonb;
			END IF;
			 
		END IF;

		INSERT INTO security.auditoria
		(
			fecha,
			accion,
			schema,
			tabla,
			pk,
			session,
			user_bd,
			data
		)
		VALUES
		(
			CURRENT_TIMESTAMP,
			_accion,
			'usuarios',
			'usuario',
			_table_pk,
			_session,
			_user_db,
			_datos::jsonb
			);

		RETURN NULL; 
	END;$$;
 �   DROP FUNCTION security.field_audit(_data_new usuarios.usuario, _data_old usuarios.usuario, _accion character varying, _session text, _user_db character varying, _table_pk text, _init text);
       security          postgres    false    215    10    215            �            1259    42564    Acticidad_id_actividad_seq    SEQUENCE     �   CREATE SEQUENCE actividades."Acticidad_id_actividad_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE actividades."Acticidad_id_actividad_seq";
       actividades          postgres    false    205    7            �           0    0    Acticidad_id_actividad_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE actividades."Acticidad_id_actividad_seq" OWNED BY actividades.actividad.id_actividad;
          actividades          postgres    false    206            �            1259    66946    tp_actividad    TABLE     m   CREATE TABLE actividades.tp_actividad (
    tp_actividad_id integer NOT NULL,
    actividad text NOT NULL
);
 %   DROP TABLE actividades.tp_actividad;
       actividades         heap    postgres    false    7            �            1259    66944     tp_actividad_tp_actividad_id_seq    SEQUENCE     �   CREATE SEQUENCE actividades.tp_actividad_tp_actividad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE actividades.tp_actividad_tp_actividad_id_seq;
       actividades          postgres    false    218    7            �           0    0     tp_actividad_tp_actividad_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE actividades.tp_actividad_tp_actividad_id_seq OWNED BY actividades.tp_actividad.tp_actividad_id;
          actividades          postgres    false    217            �            1259    83395    acceso    TABLE     �   CREATE TABLE security.acceso (
    id_acceso integer NOT NULL,
    sesion text NOT NULL,
    "fecha_inicioSesion" timestamp without time zone,
    "fecha_finSesion" timestamp without time zone,
    id_usuario integer NOT NULL
);
    DROP TABLE security.acceso;
       security         heap    postgres    false    10            �            1259    83401    acceso_id_acceso_seq    SEQUENCE     �   CREATE SEQUENCE security.acceso_id_acceso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE security.acceso_id_acceso_seq;
       security          postgres    false    224    10            �           0    0    acceso_id_acceso_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE security.acceso_id_acceso_seq OWNED BY security.acceso.id_acceso;
          security          postgres    false    225            �            1259    83363 	   auditoria    TABLE     K  CREATE TABLE security.auditoria (
    id bigint NOT NULL,
    fecha timestamp without time zone NOT NULL,
    accion character varying(100),
    schema character varying(200) NOT NULL,
    tabla character varying(200),
    session text,
    user_bd character varying(100) NOT NULL,
    data jsonb NOT NULL,
    pk text NOT NULL
);
    DROP TABLE security.auditoria;
       security         heap    postgres    false    10            �           0    0    TABLE auditoria    COMMENT     a   COMMENT ON TABLE security.auditoria IS 'Tabla que almacena la trazabilidad de la informaicón.';
          security          postgres    false    219            �           0    0    COLUMN auditoria.id    COMMENT     D   COMMENT ON COLUMN security.auditoria.id IS 'campo pk de la tabla ';
          security          postgres    false    219            �           0    0    COLUMN auditoria.fecha    COMMENT     Z   COMMENT ON COLUMN security.auditoria.fecha IS 'ALmacen ala la fecha de la modificación';
          security          postgres    false    219            �           0    0    COLUMN auditoria.accion    COMMENT     f   COMMENT ON COLUMN security.auditoria.accion IS 'Almacena la accion que se ejecuto sobre el registro';
          security          postgres    false    219            �           0    0    COLUMN auditoria.schema    COMMENT     m   COMMENT ON COLUMN security.auditoria.schema IS 'Almanena el nomnbre del schema de la tabla que se modifico';
          security          postgres    false    219            �           0    0    COLUMN auditoria.tabla    COMMENT     `   COMMENT ON COLUMN security.auditoria.tabla IS 'Almacena el nombre de la tabla que se modifico';
          security          postgres    false    219            �           0    0    COLUMN auditoria.session    COMMENT     p   COMMENT ON COLUMN security.auditoria.session IS 'Campo que almacena el id de la session que generó el cambio';
          security          postgres    false    219            �           0    0    COLUMN auditoria.user_bd    COMMENT     �   COMMENT ON COLUMN security.auditoria.user_bd IS 'Campo que almacena el user que se autentico en el motor para generar el cmabio';
          security          postgres    false    219            �           0    0    COLUMN auditoria.data    COMMENT     d   COMMENT ON COLUMN security.auditoria.data IS 'campo que almacena la modificaicón que se realizó';
          security          postgres    false    219            �           0    0    COLUMN auditoria.pk    COMMENT     W   COMMENT ON COLUMN security.auditoria.pk IS 'Campo que identifica el id del registro.';
          security          postgres    false    219            �            1259    83369    auditoria_id_seq    SEQUENCE     {   CREATE SEQUENCE security.auditoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE security.auditoria_id_seq;
       security          postgres    false    219    10            �           0    0    auditoria_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE security.auditoria_id_seq OWNED BY security.auditoria.id;
          security          postgres    false    220            �            1259    83371    autenticacion    TABLE     #  CREATE TABLE security.autenticacion (
    id integer NOT NULL,
    user_id integer NOT NULL,
    ip character varying(100) NOT NULL,
    mac character varying(100) NOT NULL,
    fec_inicio timestamp with time zone NOT NULL,
    session text NOT NULL,
    fec_fin timestamp with time zone
);
 #   DROP TABLE security.autenticacion;
       security         heap    postgres    false    10            �            1259    83377    autenticacion_id_seq    SEQUENCE     �   CREATE SEQUENCE security.autenticacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE security.autenticacion_id_seq;
       security          postgres    false    10    221            �           0    0    autenticacion_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE security.autenticacion_id_seq OWNED BY security.autenticacion.id;
          security          postgres    false    222            �            1259    83379    function_db_view    VIEW     �  CREATE VIEW security.function_db_view AS
 SELECT pp.proname AS b_function,
    oidvectortypes(pp.proargtypes) AS b_type_parameters
   FROM (pg_proc pp
     JOIN pg_namespace pn ON ((pn.oid = pp.pronamespace)))
  WHERE ((pn.nspname)::text <> ALL (ARRAY[('pg_catalog'::character varying)::text, ('information_schema'::character varying)::text, ('admin_control'::character varying)::text, ('vial'::character varying)::text]));
 %   DROP VIEW security.function_db_view;
       security          postgres    false    10            �            1259    83403    token_login_aplicacion    TABLE     �   CREATE TABLE security.token_login_aplicacion (
    id integer NOT NULL,
    user_id numeric NOT NULL,
    fecha_generado time with time zone NOT NULL,
    fecha_vigencia time with time zone NOT NULL,
    token text NOT NULL
);
 ,   DROP TABLE security.token_login_aplicacion;
       security         heap    postgres    false    10            �            1259    83409    token_login_aplicacion_id_seq    SEQUENCE     �   CREATE SEQUENCE security.token_login_aplicacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE security.token_login_aplicacion_id_seq;
       security          postgres    false    10    226            �           0    0    token_login_aplicacion_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE security.token_login_aplicacion_id_seq OWNED BY security.token_login_aplicacion.id;
          security          postgres    false    227            �            1259    42582 	   acudiente    TABLE     �   CREATE TABLE usuarios.acudiente (
    id_acudiente integer NOT NULL,
    nombre_acudiente text NOT NULL,
    apellido_acudiente text NOT NULL,
    cedula text NOT NULL,
    correo text NOT NULL
);
    DROP TABLE usuarios.acudiente;
       usuarios         heap    postgres    false    4            �            1259    42588    acudiente_id_acudiente_seq    SEQUENCE     �   CREATE SEQUENCE usuarios.acudiente_id_acudiente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE usuarios.acudiente_id_acudiente_seq;
       usuarios          postgres    false    207    4            �           0    0    acudiente_id_acudiente_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE usuarios.acudiente_id_acudiente_seq OWNED BY usuarios.acudiente.id_acudiente;
          usuarios          postgres    false    208            �            1259    42590    docente    TABLE     �   CREATE TABLE usuarios.docente (
    id_docente integer NOT NULL,
    nombre_docente text NOT NULL,
    apellido_docente text NOT NULL,
    nit text NOT NULL,
    id_institucion integer NOT NULL,
    correo text NOT NULL,
    cedula text NOT NULL
);
    DROP TABLE usuarios.docente;
       usuarios         heap    postgres    false    4            �            1259    42596    docente_id_docente_seq    SEQUENCE     �   CREATE SEQUENCE usuarios.docente_id_docente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE usuarios.docente_id_docente_seq;
       usuarios          postgres    false    209    4            �           0    0    docente_id_docente_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE usuarios.docente_id_docente_seq OWNED BY usuarios.docente.id_docente;
          usuarios          postgres    false    210            �            1259    42598    institucion    TABLE     q   CREATE TABLE usuarios.institucion (
    id_institucion integer NOT NULL,
    nombre_institucion text NOT NULL
);
 !   DROP TABLE usuarios.institucion;
       usuarios         heap    postgres    false    4            �            1259    42604    institucion_id_institucion_seq    SEQUENCE     �   CREATE SEQUENCE usuarios.institucion_id_institucion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE usuarios.institucion_id_institucion_seq;
       usuarios          postgres    false    4    211            �           0    0    institucion_id_institucion_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE usuarios.institucion_id_institucion_seq OWNED BY usuarios.institucion.id_institucion;
          usuarios          postgres    false    212            �            1259    42612    paciente_id_paciente_seq    SEQUENCE     �   CREATE SEQUENCE usuarios.paciente_id_paciente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE usuarios.paciente_id_paciente_seq;
       usuarios          postgres    false    4    213            �           0    0    paciente_id_paciente_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE usuarios.paciente_id_paciente_seq OWNED BY usuarios.paciente.id_paciente;
          usuarios          postgres    false    214            �            1259    42620    usuario_id_usuario_seq    SEQUENCE     �   CREATE SEQUENCE usuarios.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE usuarios.usuario_id_usuario_seq;
       usuarios          postgres    false    4    215            �           0    0    usuario_id_usuario_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE usuarios.usuario_id_usuario_seq OWNED BY usuarios.usuario.id_usuario;
          usuarios          postgres    false    216            �
           2604    42622    actividad id_actividad    DEFAULT     �   ALTER TABLE ONLY actividades.actividad ALTER COLUMN id_actividad SET DEFAULT nextval('actividades."Acticidad_id_actividad_seq"'::regclass);
 J   ALTER TABLE actividades.actividad ALTER COLUMN id_actividad DROP DEFAULT;
       actividades          postgres    false    206    205            �
           2604    66949    tp_actividad tp_actividad_id    DEFAULT     �   ALTER TABLE ONLY actividades.tp_actividad ALTER COLUMN tp_actividad_id SET DEFAULT nextval('actividades.tp_actividad_tp_actividad_id_seq'::regclass);
 P   ALTER TABLE actividades.tp_actividad ALTER COLUMN tp_actividad_id DROP DEFAULT;
       actividades          postgres    false    218    217    218            �
           2604    83411    acceso id_acceso    DEFAULT     x   ALTER TABLE ONLY security.acceso ALTER COLUMN id_acceso SET DEFAULT nextval('security.acceso_id_acceso_seq'::regclass);
 A   ALTER TABLE security.acceso ALTER COLUMN id_acceso DROP DEFAULT;
       security          postgres    false    225    224            �
           2604    83393    auditoria id    DEFAULT     p   ALTER TABLE ONLY security.auditoria ALTER COLUMN id SET DEFAULT nextval('security.auditoria_id_seq'::regclass);
 =   ALTER TABLE security.auditoria ALTER COLUMN id DROP DEFAULT;
       security          postgres    false    220    219            �
           2604    83394    autenticacion id    DEFAULT     x   ALTER TABLE ONLY security.autenticacion ALTER COLUMN id SET DEFAULT nextval('security.autenticacion_id_seq'::regclass);
 A   ALTER TABLE security.autenticacion ALTER COLUMN id DROP DEFAULT;
       security          postgres    false    222    221            �
           2604    83412    token_login_aplicacion id    DEFAULT     �   ALTER TABLE ONLY security.token_login_aplicacion ALTER COLUMN id SET DEFAULT nextval('security.token_login_aplicacion_id_seq'::regclass);
 J   ALTER TABLE security.token_login_aplicacion ALTER COLUMN id DROP DEFAULT;
       security          postgres    false    227    226            �
           2604    42625    acudiente id_acudiente    DEFAULT     �   ALTER TABLE ONLY usuarios.acudiente ALTER COLUMN id_acudiente SET DEFAULT nextval('usuarios.acudiente_id_acudiente_seq'::regclass);
 G   ALTER TABLE usuarios.acudiente ALTER COLUMN id_acudiente DROP DEFAULT;
       usuarios          postgres    false    208    207            �
           2604    42626    docente id_docente    DEFAULT     |   ALTER TABLE ONLY usuarios.docente ALTER COLUMN id_docente SET DEFAULT nextval('usuarios.docente_id_docente_seq'::regclass);
 C   ALTER TABLE usuarios.docente ALTER COLUMN id_docente DROP DEFAULT;
       usuarios          postgres    false    210    209            �
           2604    42627    institucion id_institucion    DEFAULT     �   ALTER TABLE ONLY usuarios.institucion ALTER COLUMN id_institucion SET DEFAULT nextval('usuarios.institucion_id_institucion_seq'::regclass);
 K   ALTER TABLE usuarios.institucion ALTER COLUMN id_institucion DROP DEFAULT;
       usuarios          postgres    false    212    211            �
           2604    42628    paciente id_paciente    DEFAULT     �   ALTER TABLE ONLY usuarios.paciente ALTER COLUMN id_paciente SET DEFAULT nextval('usuarios.paciente_id_paciente_seq'::regclass);
 E   ALTER TABLE usuarios.paciente ALTER COLUMN id_paciente DROP DEFAULT;
       usuarios          postgres    false    214    213            �
           2604    42629    usuario id_usuario    DEFAULT     |   ALTER TABLE ONLY usuarios.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('usuarios.usuario_id_usuario_seq'::regclass);
 C   ALTER TABLE usuarios.usuario ALTER COLUMN id_usuario DROP DEFAULT;
       usuarios          postgres    false    216    215            w          0    42558 	   actividad 
   TABLE DATA           �   COPY actividades.actividad (id_actividad, nombre_actividad, descripcion, docente_creador, contenido_actividad, tipo_actividad, estudiantes) FROM stdin;
    actividades          postgres    false    205   ��       �          0    66946    tp_actividad 
   TABLE DATA           G   COPY actividades.tp_actividad (tp_actividad_id, actividad) FROM stdin;
    actividades          postgres    false    218   r�       �          0    83395    acceso 
   TABLE DATA           j   COPY security.acceso (id_acceso, sesion, "fecha_inicioSesion", "fecha_finSesion", id_usuario) FROM stdin;
    security          postgres    false    224   ��       �          0    83363 	   auditoria 
   TABLE DATA           c   COPY security.auditoria (id, fecha, accion, schema, tabla, session, user_bd, data, pk) FROM stdin;
    security          postgres    false    219   ��       �          0    83371    autenticacion 
   TABLE DATA           ]   COPY security.autenticacion (id, user_id, ip, mac, fec_inicio, session, fec_fin) FROM stdin;
    security          postgres    false    221   g�       �          0    83403    token_login_aplicacion 
   TABLE DATA           f   COPY security.token_login_aplicacion (id, user_id, fecha_generado, fecha_vigencia, token) FROM stdin;
    security          postgres    false    226   NF      y          0    42582 	   acudiente 
   TABLE DATA           i   COPY usuarios.acudiente (id_acudiente, nombre_acudiente, apellido_acudiente, cedula, correo) FROM stdin;
    usuarios          postgres    false    207   kF      {          0    42590    docente 
   TABLE DATA           v   COPY usuarios.docente (id_docente, nombre_docente, apellido_docente, nit, id_institucion, correo, cedula) FROM stdin;
    usuarios          postgres    false    209   �F      }          0    42598    institucion 
   TABLE DATA           K   COPY usuarios.institucion (id_institucion, nombre_institucion) FROM stdin;
    usuarios          postgres    false    211   G                0    42606    paciente 
   TABLE DATA           �   COPY usuarios.paciente (id_paciente, nombre_paciente, apellido_paciente, numero_documento, grado_autismo, edad, cedula_docente, cedula_acudiente, id_institucion) FROM stdin;
    usuarios          postgres    false    213   :G      �          0    42614    usuario 
   TABLE DATA           a   COPY usuarios.usuario (id_usuario, numero_documento, clave_usuario, tipo_usuario_id) FROM stdin;
    usuarios          postgres    false    215   �G      �           0    0    Acticidad_id_actividad_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('actividades."Acticidad_id_actividad_seq"', 26, true);
          actividades          postgres    false    206            �           0    0     tp_actividad_tp_actividad_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('actividades.tp_actividad_tp_actividad_id_seq', 1, false);
          actividades          postgres    false    217            �           0    0    acceso_id_acceso_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('security.acceso_id_acceso_seq', 319, true);
          security          postgres    false    225            �           0    0    auditoria_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('security.auditoria_id_seq', 7, true);
          security          postgres    false    220            �           0    0    autenticacion_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('security.autenticacion_id_seq', 1340, true);
          security          postgres    false    222            �           0    0    token_login_aplicacion_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('security.token_login_aplicacion_id_seq', 1, false);
          security          postgres    false    227            �           0    0    acudiente_id_acudiente_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('usuarios.acudiente_id_acudiente_seq', 4, true);
          usuarios          postgres    false    208            �           0    0    docente_id_docente_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('usuarios.docente_id_docente_seq', 15, true);
          usuarios          postgres    false    210            �           0    0    institucion_id_institucion_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('usuarios.institucion_id_institucion_seq', 1, true);
          usuarios          postgres    false    212            �           0    0    paciente_id_paciente_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('usuarios.paciente_id_paciente_seq', 20, true);
          usuarios          postgres    false    214            �           0    0    usuario_id_usuario_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('usuarios.usuario_id_usuario_seq', 88, true);
          usuarios          postgres    false    216            �
           2606    42631    actividad Acticidad_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY actividades.actividad
    ADD CONSTRAINT "Acticidad_pkey" PRIMARY KEY (id_actividad);
 I   ALTER TABLE ONLY actividades.actividad DROP CONSTRAINT "Acticidad_pkey";
       actividades            postgres    false    205            �
           2606    66954 (   tp_actividad pk_actividades_tp_actividad 
   CONSTRAINT     x   ALTER TABLE ONLY actividades.tp_actividad
    ADD CONSTRAINT pk_actividades_tp_actividad PRIMARY KEY (tp_actividad_id);
 W   ALTER TABLE ONLY actividades.tp_actividad DROP CONSTRAINT pk_actividades_tp_actividad;
       actividades            postgres    false    218            �
           2606    83414    acceso acceso_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY security.acceso
    ADD CONSTRAINT acceso_pkey PRIMARY KEY (id_acceso);
 >   ALTER TABLE ONLY security.acceso DROP CONSTRAINT acceso_pkey;
       security            postgres    false    224            �
           2606    83387    auditoria pk_security_auditoria 
   CONSTRAINT     _   ALTER TABLE ONLY security.auditoria
    ADD CONSTRAINT pk_security_auditoria PRIMARY KEY (id);
 K   ALTER TABLE ONLY security.auditoria DROP CONSTRAINT pk_security_auditoria;
       security            postgres    false    219            �
           2606    83389 (   autenticacion pk_seguridad_autenticacion 
   CONSTRAINT     h   ALTER TABLE ONLY security.autenticacion
    ADD CONSTRAINT pk_seguridad_autenticacion PRIMARY KEY (id);
 T   ALTER TABLE ONLY security.autenticacion DROP CONSTRAINT pk_seguridad_autenticacion;
       security            postgres    false    221            �
           2606    83416 2   token_login_aplicacion token_login_aplicacion_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY security.token_login_aplicacion
    ADD CONSTRAINT token_login_aplicacion_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY security.token_login_aplicacion DROP CONSTRAINT token_login_aplicacion_pkey;
       security            postgres    false    226            �
           2606    42637 "   institucion pk_usuario_institucion 
   CONSTRAINT     �   ALTER TABLE ONLY usuarios.institucion
    ADD CONSTRAINT pk_usuario_institucion PRIMARY KEY (id_institucion, nombre_institucion);
 N   ALTER TABLE ONLY usuarios.institucion DROP CONSTRAINT pk_usuario_institucion;
       usuarios            postgres    false    211    211            �
           2606    42639    paciente pk_usuario_paciente 
   CONSTRAINT     e   ALTER TABLE ONLY usuarios.paciente
    ADD CONSTRAINT pk_usuario_paciente PRIMARY KEY (id_paciente);
 H   ALTER TABLE ONLY usuarios.paciente DROP CONSTRAINT pk_usuario_paciente;
       usuarios            postgres    false    213            �
           2606    42641    acudiente pk_usuarios_acudiente 
   CONSTRAINT     i   ALTER TABLE ONLY usuarios.acudiente
    ADD CONSTRAINT pk_usuarios_acudiente PRIMARY KEY (id_acudiente);
 K   ALTER TABLE ONLY usuarios.acudiente DROP CONSTRAINT pk_usuarios_acudiente;
       usuarios            postgres    false    207            �
           2606    42643    docente pk_usuarios_docente 
   CONSTRAINT     c   ALTER TABLE ONLY usuarios.docente
    ADD CONSTRAINT pk_usuarios_docente PRIMARY KEY (id_docente);
 G   ALTER TABLE ONLY usuarios.docente DROP CONSTRAINT pk_usuarios_docente;
       usuarios            postgres    false    209            �
           2606    42645    usuario pk_ususario_usuario 
   CONSTRAINT     c   ALTER TABLE ONLY usuarios.usuario
    ADD CONSTRAINT pk_ususario_usuario PRIMARY KEY (id_usuario);
 G   ALTER TABLE ONLY usuarios.usuario DROP CONSTRAINT pk_ususario_usuario;
       usuarios            postgres    false    215            �
           2620    83426 "   actividad tg_actividades_actividad    TRIGGER     �   CREATE TRIGGER tg_actividades_actividad AFTER INSERT OR DELETE OR UPDATE ON actividades.actividad FOR EACH ROW EXECUTE FUNCTION security.f_log_auditoria();
 @   DROP TRIGGER tg_actividades_actividad ON actividades.actividad;
       actividades          postgres    false    205    228            �
           2620    83427 (   tp_actividad tg_actividades_tp_actividad    TRIGGER     �   CREATE TRIGGER tg_actividades_tp_actividad AFTER INSERT OR DELETE OR UPDATE ON actividades.tp_actividad FOR EACH ROW EXECUTE FUNCTION security.f_log_auditoria();
 F   DROP TRIGGER tg_actividades_tp_actividad ON actividades.tp_actividad;
       actividades          postgres    false    228    218            �
           2620    83425    acudiente tg_usuarios_acudiente    TRIGGER     �   CREATE TRIGGER tg_usuarios_acudiente AFTER INSERT OR DELETE OR UPDATE ON usuarios.acudiente FOR EACH ROW EXECUTE FUNCTION security.f_log_auditoria();
 :   DROP TRIGGER tg_usuarios_acudiente ON usuarios.acudiente;
       usuarios          postgres    false    228    207            �
           2620    83424    docente tg_usuarios_docente    TRIGGER     �   CREATE TRIGGER tg_usuarios_docente AFTER INSERT OR DELETE OR UPDATE ON usuarios.docente FOR EACH ROW EXECUTE FUNCTION security.f_log_auditoria();
 6   DROP TRIGGER tg_usuarios_docente ON usuarios.docente;
       usuarios          postgres    false    228    209            �
           2620    83417    paciente tg_usuarios_paciente    TRIGGER     �   CREATE TRIGGER tg_usuarios_paciente AFTER INSERT OR DELETE OR UPDATE ON usuarios.paciente FOR EACH ROW EXECUTE FUNCTION security.f_log_auditoria();
 8   DROP TRIGGER tg_usuarios_paciente ON usuarios.paciente;
       usuarios          postgres    false    213    228            �
           2620    83422    usuario tg_usuarios_usuario    TRIGGER     �   CREATE TRIGGER tg_usuarios_usuario AFTER INSERT OR DELETE OR UPDATE ON usuarios.usuario FOR EACH ROW EXECUTE FUNCTION security.f_log_auditoria();
 6   DROP TRIGGER tg_usuarios_usuario ON usuarios.usuario;
       usuarios          postgres    false    215    228            w   �   x�M��j1E�/_��!yj��]A���t�<�h#cR�B�������{�Ü���d�?�� �w����c5ҥ԰Yi�jP��= 43�(��r�	u�w{�rJ���3�
�Mj��'8�h�GNqN�wt���uQ���\���۷�ә�r��K���@�ؗþĥ*끮ո��p%���߬)cw��E       �   4   x�3����,IL�<�9O�,�()1�ˈ�%�8�(� "������������ �W�      �   (   x�343�L,N"�?23�260�,NI+NC��qqq �r
+      �   i  x��R�k�0?ǿB<����۠����J�aδF�����L�f>r��^�G>0�x��	��B�)�8xؽ��{КVօ6C ;pҦy����Q��:V��� �,���ȏ}�X��R^Ԭ���[o���v�Ёm�j?T����lP5��k�6�#I%�J���>m���\�+h#N9��ȪQvQ=!C�d(��$"`�>��qlt ��X4�iZ��]ҋ�d��F�B̡��Ꙭ��A�_�ľ��C?�q�S�<!<�<����$�®R�ȫ\ހ����P�!�@l}
)Â�HfMq)�]<ƿ�2m�VEn?c��t��/�7]��62�?-���8f�ޏC�y�7bSA%      �      x���ɺ��%:N?�_��c��Y�U���	�D������ ��?�������-����" ���#�����	L�W������C0����C����O���Cx����iZG�GM��C�X�+SI{�����q���Oa�&������B�$���?x�6��?Y�P>�P�z��q`�����B��$ 1�x�����W?A=������.��,��s������o>?�\L�id�:y�r�e`.r��8��o'�Sy� �A �wr����;�E.���;��_ǎ��)�_�Gv�P�a�O)�x\y�FVNS���!������ߣ�O���J�8�����a�����{� �Ly��6��-�ə�ٖүv�n��zH�?9t9��(��p05�5��K!^�[���?����_�b�IN#�?�x��^�tف�Ҟ�G���n�pdڛ�3�x� eV��(�T�,����8���B��,e��

���Aʗk��'#(�� ���vm~��p�mM�+�_�]އ�6����� �Bfٹ�{2)9\e
G��k�M��~�wyoG��'��.|����]����A��̬/^��.������@�0x9�7#�G���'O�}����񘝿 ��[��z9���IF�:򻬷#��o}��_�]
ّ�B��Y��z9���G =��/Gv`�g�<����kÁ�f� m�p�5O����m��Y�˵��)���D^� 80Ќlv^�0;�_~gp� kz8��\���A3��q�|��7;p�G{f�A �����A3��G>�i�}����5r`�������e��_���������kd������O��88r1���&:�ym��k�!�#�Ξ!������V����<K�>=*���I��e�2Y5Eޫ1i�>��1�h&dB~�K����z�s�0��U�ġ����š��AG�!}O��#�š_#۹�����#�š_#�~�~o|��8D#[�3��! Y�r�8�52ne`�^������>�52�C��΂��5��ǾF�D��pi��ӑ���������X����o�c�F�$M������ǾV�� �S�y�������������Ŀ@��`**�x�b`�XV��������<x�'�8��Sd��e1�������a_�
0��9*�8T��y�}��
?�	sos��{�����d��<��=��#fuO1q�.��cZ��;��t��a`3��+��_�b����/��N����Ll������^̔�����^�gkI�X��Ʋ 90{`��0���O������߳ѯ����zn�)s��<�ę��أH�X��K���ā}��)xz:0�=0�	��8��ˁ�{����'<�2��ɴ]WY���g��.]D[�梷{���[f3^\)k�~��8���k}nM���9��,���.�7B	N���|�Nsz��E��K�؁��q)?x(CA����&�R��d�ժ涅��/���kh�$����ا����wHK=�%�Z��8x�y4��ޓ�P�$+��J�f��N�<;�q���M���&BU��d����j�Ĝ�yq5�,����o2�l>��ԙ	�(:�Uvm���	R�9^X<ہ�d,�>������Y�cr�l����x�%�����<;��$�#dA��`�i�Ϣx���bʢ��� ���1����W�ẓx��ݦ�.��ʚr�r��ÐW���>������� ��e�>;��0
��p�9��ʧnގ��ӬPm�h���6'8���4�ܖ����s��=�{���}�`6~��"�|��ǉ��7���HK"�ʛC�L�"�BD{ �*=��<N��3W��lͺ�(�2����= ��W!�=����)�~KvѥR��5��]�q���^@�eH�Ҍ�㈢y�f��D����+���^���Mf��<�����oZWeST�>g���|�|�R�!�o*䝩��W�j�b���S'��u"ڸ����/~���T�+۱G˦����ζ��<��n���l�_9`��/~�:�  w��t��������x|��ן�}�HLE�3ܥ_lL��ȊۣP�z9r��"1�a�Tf��-~�=6q)L�����ע2zI(���U���e���2�e��d�K�L��w6��g�\����ϑ�P���@/���WV�a"cդ��m�'��\9��2������/��ix�­7?��A�<&���}�v�6����ׯ�>�l0���u���}�y6(�{����}�f�@=�����?ȸd�]��Qb����z�:x�`V������C���{ln���9��z�7���0��p���[*�uj�x1�,3��������@Ǯ��D�C@�����،���N
�I�q�]u&q:F���6�(��0�1P(� s�|`�)H ���'n��_~{*@#f�{)�`�~�h������,fm?��?~�Y��e�,W��x@���)߬`Cu���k̬��Dr縏cN�f/�>V��ǃ|i"b�7�������G����� P���ì�@���3���yf	�ܘK�\�����<�%k���@p3 7��)��O�s��A��G�2O�_"H�,��uI̗<Gp�����(��kwJK�O[�K�� �)���A� |�+�S3�h�|��5�;�mP�v5�7�� 1���ay.��)��ff��L�1������&�׶[�S~�a?��{m4��ҀU�<��-��� �룚�!`A��;�S�px%I����wJ�@�C��A8p�4`z�Ć�p,x�+�Sp��&$�0;���Ӏ'w�=�A��7Q��Әj���%|�=�'�6�.Wf�;��Ni��ʪ�d�^#(wJ���Ϳ_O�r��=6A���ڲ*GF�c��㹌�DX�.�f}I�A4��Jݶq䛰�`>܂e�� ��K���6�y���}�ǑoO����^q���j�*:�nfC]�e�WB�|#+�1d�%e��f책YJ�o��#�,��N��h�{�	Gxo�}1��|G����D%>Gp$!�x�!�{���8� ��ah�:�� �M���+{4i��(E�|pp\a2�3���D�V��1S�DH��*�O֮]'
�,�zN��4P�0td����'�Ǥ��#�,��7��+����,��qT߸y�+�YF�j�x�_��`�$�_�T�}���^#8�L��m0��9т9:��6v<xP��$���I
�G��̃z��η�"f�̦C�����E��p+f��wp�th��f��XK����A���Δ6��Y�>����ܙ҈`�=��L�^�ܙ��܄��ө�sgN��b�}_�;ΜF� � X�A�1Μ6xG��7^��ҸGK�HA���Oz��Li�1�iO@�}������*�𤎽a�ψ׫|H��oL�;��ų�P�0`�\�xA*�J�~�둏E %��W���� @����<���y������=��[�� �{�Z�1�̿�-a?|N���=0�mE� �5�s��Op<DB)nh`�
��KH�mK ^�q_���0�.�c̸�Vg�=�@�V�0�ʔ���'8��-t�X�|R(�ho��i��s��ώj��<?$i�w������.�}���7���CGL�1����0<?��gG���/�J�8�Yػ�!���أ�V���0�����4͋������3��ss�ۋ�Arϣ)��_<�e���	�~/�����HG!����6ƀ�.�2£+��=�@���f�A�"��Op��� ������4�{����g���VH���q��J~�F�w�ߠCL��L(���{�A�1U�E�~ot��u�=���;`�%�ZW�����
𒔽��C�̄ooR�M�o~v~� �2����{�o,0��B��Z�¸��$�Yྙ�;�~7�z۰{;@    �X������nb|T�۽I�/����쒣���&�61�L�U3�`a\�������`?v��'��"�ȘcT�HĽ��9n�d����|��
�Y&
 ��xS��$2�lu0�������$��I�m	�m�3L2彻�~�5���o����\^/����|���=�Rx�-o7=t7+�/zfc/2���`���H[c��w�_}�s�kҸ��os30�r��Q�b�K1�p�ζ���,�'"�)�ވ�ݳ-�=�Op������U.�
�����q��|��y/ �z:0���D��$y� ����8�C�M��"Ĩ/��.����Dy� |�b�\0��PS�=��=Af�!��7>�_v���Ṃ��m�^5��>�^�=.!���Te��kqu\,	߳i���b5ķ�x	a+]���ξ���/!|t=$wM�����W�]ɇ��C���
��/�0�2�Y��A���/_0������|��eu� P_�J�����[V>�P�P��^���u�w!�e�+I�ָw_:��b�p?4��DO)ߞC|@|���Ǆ�o���B�BC��%_C|`[|[�/U@u�����p����2���U趈�^���ƅ�|���4}`[�W.�P����K���}� ���k�f����%�J����ߞ9�)��{�%>0-��@��@�x�->0-��;bF��פ�� �Xe�0������Ӛ��^���{�%>�,��6/q�`?���xaA=Bϰ������+�B64�<xm<�?�x	!1�Jo8&�P=��,,���9��n��ao@|@m{�
��S�5������H/�}��x�+�_Bث�`��7���%¯ L�n���s���������	?��	G3�ڛ�^%��{�0>��ػ03n`@�>F<�9ޯ��K��,IUVT�Xȷ�~Da�_��N��|��� X���+L��� ���T�*��`fQߗ��LIul۔g�xu��H����0}"Gۍe�(.�r��)ZϨ�
��7D`S��ӵ��,���|��F�ѹ����Hq���O!2�]�|����[Wd�|���\�#�	�*j@pW�_8��s�&�OI�K^O�T82Pf/~b�$��Ve��FQO{"7u~�7�#�o,&�Z���t_�yWL��.�|�"��sm�48��7�fC@^H�dt[&��\W��lW����� P�G[R�����*:T�VM�c1�i��s����}C��m��~�ÙOQu�8΋dm��Z��1̴Q�'n�y�fм��b}��f�~vGJ�+ÓG���&�� �5Y��)Su��4_�|L�ø����疯Х-+h�vAE�T���v�����Γ����^���4�*�/��֖%Ϸ���l�\�ej��o�����4Y�>~�#���9�t�M#�ƨnhS������q���%��:�{u��Vt�66s�OA|D|b�Wz���Mݭ��Z�G���˯d�����G��f)�d�ufP�!�uzX���BGZ�v���%���f[򪯡��i�u��Yf��C6�G�[�͓~@��:u]�0]�Ya���;A|D|��G�3NIx/P�I������}A+����W
U�n����tN����9�x����>"7�+�Y}���@?��m��M��Z6��#r+{M�X��X&��ʶ��~��}]��c�l@nu��P���[@V����c+�*�sPYuIN�!�_;z��_���gC��0������yR�с�v�r��w�Hgb���C��g#�d�d�&lZ��L�f%��x�¶󍉢�y� ֹӨ��N�]����r+��2�.C�ػ�q[���!޹�G�WTBX~��%D@u
���e��q���#�w�6Sq6������}�(8�S�m���ݮQ��\�*�]}V��Q\n5J���G,�}Q�`v�|�T��E�Z����������f��or]���k��5Q���:ύ> �B)�XӣJ~?F��8��>�]�6�fY��G��ʟk
�$���d3�M���Ʀ��}[�� > �m؊e��#f�]k$�%�&V��c.d'	�n��#
k�Po��a�U�Zoiݎ���y�-����#��(�K��S��t�!Ӧ̗!I�3�SAP۷]������6�ժ���"1���,�b����
Bخn<0��.�k�gٯ&��u(#5�S/b���w�^AH��xd^g�e��+�1�m;�e'����hp��������^��t-�7K�3������א^AP�iXA-<�qN㢟{�'k32��bi���ܦ6���%0�xz�A��M���p5�}�A|���n��:��S�n��M��0>���Z�)A|�� 5ƒ? �BOf�O�&iה�<�����z���M�� �� M�좬܆�Ixw��5s1/ļ�"=�@�T�Bq�zb��^Pwl���*E��$����BYA�a�CڙlŰT�X�e�󾿌�
��m�E���uڛj�h*�,Q��E������w�7���1d�xqٵS�H�Ȕ/z{!���%	>$f�,-�F�׾�	[ˣ�������,ѕ��I���Σ�v��>�S%�d��zK�R/�^Q��&e�Ӛ���d���\�Z5�ve锭�0A��[`%{f�IH߼�x�J�/� �����ɬz�/e�%g?�c������uo�!�-���6�a��F\Q��bN��V�>S���^�����/}��a6�����}6RɪlrA��^��B�\7�,xtV�$"��<��%�X-GU��P�+�-���&�/Y�S˯m��6-�-aZW�Q�|����9��]D$jfݧ߻��En���X�k��|&wvS�o�̊R$	�Q贗�6��X���Jӎ�s���;7<J)���$�-�s��nX�S�������Qe�0���<Qw�f�ػ#����U���o��0W��A�ܻ��xLő�Y~EK�s��8�zv�����g��Q�O)������:}eg{ʨ�i u�����r�{�]2N�HwgZ�m�W����u���U=wC(���xܤ�0�]��6?QG���c� �U=wC��^3�-�ۂ�Y_�Gm^�m��� >����i���*V��,�1�3Qer�ҹi��U=�Ba�Q�;)8��펤I�k,��?�RM;M��z�&��N������dJ���G}����n��̡2�0��1����^�dK�������U=Gxi�7�5U��E{�N��������}�-�W�b6v۲�X�M�G#�t��?\�k��b�!�Y����:n�x��t/�^Q�j$��؍�MD̿
U�"߲Z�s^,[�D�6'�����~(�L(I���<��]���(�UD�~Q��U�&�^�-��}�)�\U�Gqz25霩Qv6M"��؃8��Jج�:�u��c����cc�.~�����P��'V`��>t]��&�.�M���t��s�����YT_	���3��&O�"�2V]We��HW��*�'��o!ͪ�T�Q�u$ѐv�l$Q�U�&�]}
�Ma�(;�\��bɪK~��0/����~��b��Dz���ƨ2��� Ic���R�XTJ��3�J��\�����e,�i�-�.9:!L [��r�_�G!�b�J�gW��u;�ۺ�=�WE[���M�rl�cެYO1JЊQ�l=cv�*�UV������U�vC�"��K5M��5��J�6���MvRp�*a#n{{��w���Г��7�xvl�&�hܶԋ=�7���H�H�:y�%y�3u���)�v����3k�ڂ��xK�o�Cl���K��YKA���� u�E�"�u�`;�nJkQB�NyY5�xC���և�=�CN���*�hm�[�-�&Έ�Iщ�tU����3���S�^)2�A�+�ku�����þ��ו�'��sܲtfW:HVqZ��q�
�Zrc����J��\��/�ص�Z�iKJ2��^B`��Uݛ����S�W�������b�
~/_{	a{	�nVć8�Z�E��g9e �7ZҖ��x����� 0O��d��ؚ�b    ����?Xv:�q��}�D��U�i�fd���쬢�g	f{���w֮���&q~�!*U.be�b���J��I)Zg�گʚ+.�[�9�q�:ӣo
��R��\|�mEUXxW�?�q_$�,2S��Хq�S�_�]�2����{��=բ/Q���1/i�N���x���m[�b3���T/**���ƺ��q���X���4����5��,0v�� E���tMƍ��hH77'?)�]#��1P�`1\ˊv+�"9�,4��e,�� \�-����7� �k���p�8[n6=%[��$��	:k�$�Rt��<
%��|��,kY�T��>Dw��Y�&1	� i!���,m�O嶌CwԐql|�3! Wj[ :1�[+�ߌ*k����2�X_��YS����Jm��$pN%��6;�+M�y�����|Sd=��i�[q���=w�' P�}=��8+?2r���i�`��o�iZ$ggsq4��1�箐7+\�-��,�&�P!J�S��X��x|�� �z#Մ�<� +�����i���,&��Y�&��9�ߧ�`:i��5��5!E��n���<gy��P�2�/A
���uV�EkR�McNv�Y�&m�e[ɇ���j��z�h�kV�"�����4�m?)��NY��7QmEy����aK�=#
-��i���[��Y�����x�׮����:9�{���Mx�
�d�`�j�z�#���8ˌ�R���O#@���>/uUyZ&�fr8J󙲈|g}A�x�<)E��t=vEj��h�8���C}�ny_]1��pQ�1�+����Y��h�ガ��<��JX��(�\�:ʭh徔{4��e�kI���4y_1P����$���y����ꤚr���/'��m�&a����%�Y˅�Y�ĸ5��m9/�`� >"7؋���Ƃ���y+��>z���6Y�ѷA|@n쿅�cTxWL.t��y��-.�vR׺[�Ԅ����RT&66��>b\��:ve���{�/;�� >�6`"����o�y|6oY�䱐CR���p��t�Ȼ����V��c6AϮ1�[|4�r���M�WP� ��w���`멓�PY4�kb�Mp��候���]~�k�Ƨ,ߎA�L�-o�r[I6�W Tt>,����Q:6}��q���o!�j�>��xc]�=�t�-��F˰�{Ǌ���r��C�~x�]�`��-��km���S5_���&��m���r_֌�݄]c~nc��c�VY�k%	�#jc�3�hO�s��d^�S��̫c[�}rV�ɻ1�0�J���^i6�W��תXTۜ9A|@m+ȶM�����6T�(�x��~��j%��={F%���-��M]Q��zES;��YK�u��j{����fAUŌ�&�)K�%�Y�3=�{�?�vh�a��{Aǖ*Q�2ں&Ry�T;���mz%�l�u��&K]G&�3k_���=It�Y�F`���f���1�uD��>/|�v�Es����C�Y|�jHb�q
�#�DQFc�+!|@���,��ю�f׾���~��d/ʾY�l?	�n�6GdL o-�>Υ.zCY���μ�=gu��-8Zp���6�徵ɼ%}ϢD�Ӑ�=A���-8`ω�nuPK��2�K�c�_۹�	�w;f��8U���Ց�ze�\�ڵ�"J"��:� ��	��?T¶�s�7�d���e�g�p����dܝ���8�(�	b����ֲ2�B���s�b� 4k��bn˺�V��\�k�����:� �t�|EE�M��ɋ��Q���i����Y�&�¶ ���O�f�c1�O[�MW�������鎙��[㯢�iNq��o�{�Ϲ.2
-��i�>�c@�o@��z/�cO�SK�ek��Y_�����N���]]詻E�.��C5�:�}���L
'3�N��xɘAvHW]�z8�PO�9��J�Ξ�gu��+W�6 �ëOH�q�Gjv�����R����i_(�o6=ug����٨�J���+�9�K�����V@��� 7ꈗ��T�����X{eǽ�>`��b$C=��g�����Ÿ�*�K��u/��i��.�-+RrA�`�h]�u�Rī<�m���(��+�	³���gfv.
S����(���]˘>��>� l�Z�x���s^��Y�כ`}U���r��,O�xs����-�`i��M6E[�mk�V�W�M�+��.�a���[:��!��t�`l����yQ��4�j��<Ц��5��«��Mv�Z	Ynw��,O���9*}�I;]�i��̳b�I�&E�]�� ��Y�_Q�������+�S=$�lt��UWpC��x�w��aY�\gZ�LK��v��/�p%7�e��D����[���Φ~i��ώt�}Ԧ���Y�F��
���\y�6|h�6�-�6�*;�ngy����:�ِ$U��=���ɰU���~:(�s��Vo|�R܅ݧM�-��#?EV�,J�gy�������!%��a��=>�d��b�3��ƍ"�ȭ��B�L�2��g׶ik��ʛ-���Ӟ�NSx&���U(��kY�A����6-�:t��B�O6�h��@���p����q��^¸���������9��v
����ٚw�V�U���J�S���qt4�ؖ��3�W)ߖn2��eb�4/���j��c���>�&��j~����}A��+8���{��W��3�c���hk|�66kf{���ɍmPge�� �J �[R��������	��.#����H�l�&K����[B̋K�fMZ���Ƈ<�H����l#K�m���,l�&IVE��Ƴ(;�,l#J��h��q��v�ms5�uq^�� >��6��m{��ҳ���:T3������EO����� ���qUH~t�|���g�Q�W|Q��Yצ��j�{����hrF1S���$��'C�R*�Y�F^=�=�s�(c��;Q�}�V�Īa'7�Y�f!��e�Jf�Bsi�9�Q-{�j��e�m�qp���Rċ���>ϣ>��Tg��5��+E[����  �cŔGs�'�0�����YZ�:*S
B��m�Y���%���;?����IS�6�ۓ�gaA`��g,,�4�{+�K�K�԰��'�,l���M*�3̍,��QӱDmfB,c�h�:��J��>%%-�4J�;d��N��`Z�[^�������.W����qʄ�u��gK������m�^㴕O���aW�_��eTVU�&�j'�㟏a!R���,z�5����L=E�/�N������ %~AGPk�g��[�&��C|�ן�a,_)�a�z8��râ
���+:���� ��G�@P��g��꾌�1J���}�z�7g=A���m���-�u����<�	��T������M�2v�<�)�7|�R�Jt��\��}?�n8+�B�$a(%C�+Ja?7��CSd�p%�A��Yg!�4�<�l�~`�%Y���������>�t�謈#,�h��nw<C1�q�U"݆!fUw���q≴�.��-�",/�\TB'e�&����#�K�ɯ��n<]Eq2v�Q��|*j�t����p�0�$@]��Y,�5VC����):���X�B(\o&2�����(3�4kx.�q�H��
���X� lF���{ʷ.ߋl�ɜ֪Ϣ�h4�o���� �(�/�j�z6�Ťu�.K����X� �@�A��R�2�Nh��7�ڍ����"Ig�A�à�]>U�1\����X���-��s�)�#��-�(8�Z'�H����WVr��ҚR��b9��q<L&�����F.3�HA�L�5)<�Y,g!�qo�%#�@<�O�5?�����Z�K{��r�����T|�ц�kZ�<��!�s�50]�t ��rPav'c�rn�6(�	[���!��z��Y,g!��l�Υw'�⌭0��Jb^$C�5�%n��M�/<������
�K��W~��5�c�xi6�4"��m!��M�&[�Tm����
�59r��wT�b9�PVc�E'Z�m�t2+�3�c: ��I�����BkR@L�u�dW�9?�c���:��#r    S�]fBl:�K�2�X�-uR��N7��tQ9��,���������+2c�@v�:��`Ir�� >"7sc�������p,m)���oI�5+A|�nq_���_�mɺ��_�}�G1�TNy��{�~�n���ގ>'^g;,g� ��~�}W]��#)g����5� �.�Y��K��}̯�����M��l;����������C4s�"��uI�!�
����Ծ��"�w���(E|� ώ�ۛ#�*q��H9���'h�۫KOK��x�s�J�1�iA9�� P��K�w�eY�{��������W��A|@nۅ��vʜN���&Jþ8z����V�|��rۿ�ò�j�Ř���R�}��}N��nV���E��[_���L�u����N6s_�'���ܘ.��V�Ր�y�NSw°��6WW��y�[ݕ�m��l�5⥉f�cL��;'V-��r�	����>�nQ�s?�f>`9%&զu�A|@n��fC~I�i��IǚM�ɦle~4q��cX�Y`��a3����§��?��%�M�QkCwO�#;O^�l����رog��c�6<H��T�L���7��]+�(@ml��2�;u7h��"2 �'[��s��lH˩m���*"-�r�ة�}�	�0 �E~v���&��(��*^�A��	��!�O�P-�5;"�E���t����)A�T�ن��y�ʙ��|=��<y��N�{����nB��Dw큾������嬬e�F1]�W�;uiP�|�0�,D��	Z5�Ű�ѱ\T��d�5v{,cn�nb�3�xIE5Wc}�yJ&>-8K��]{ K��p���b���5��,��~��a$m��;���z̣+�}��fS�Y��z%�xf�&V8+����|��q��y����3o�y;G�p�M1��,���(�2_t�y������EM[������Ccz�ٲ }�m!�6�~>�tl�|O�G�{��3�'MĪL�nW=.�N�M���	gy��k�)��oI�?���:T=�k{y�{��nU��:u�te����7T�^�:��z��w�]�^9���]w �Ӄ�LT�*�:�Yjm|�&�֔��Y]��$Ŏf5�$Wyum|��t�u�^M�&�����iBO;kW�b�˼]�:Y�s<zeL A|@l~W�/P�N�N�5�uR_l�c7�J�s��Dh/�0�P�XcƮ��>UŬ�j��)��u��kb�8��Г��z금A'z�d�ވ� >�6o��&,��~�*5��=��L|;��2�kD1���� ��b C��(ME:�Y'�%M�Fdk��TZ9��,��Un�3R �PK�]4m��I�6N�t@n��}��Ǿ|��Qe��e�V�,Y�붬*2���:A>���$���~�k�U�Ң:�5�4��:��A:7 �.�<����8|".���"W�Y^G�(f>%}F�p�W��c��VgI�E��
�Q)�{w�fKý�����J�Cw��-���s��84�y>�ij�-��iK��V	y������̻�6���Wۤ�2�W]��-XE��s�7��k�x��Ӛ=���tֈ�W���$_X�Ed�����$��.����c~�r��V�;�9!|�mJ�����G���c��2�I��}wM��=pu���x��~'��^�pB��&��-�))(��\�� l�"��=LY�&dͫ��"���UU	�yH�M��6��KR�'��g�:(y4�4�z�R�u��D�G��	�M�CqŞ��8�m���ڳ.e<�/�?>��	[V�!W��0�6�j[�<�l�E�GMKk��BX��	s=Nb�a]��X�xh�V�r�+��W�@#g��(c�x������hݧ�8����Op�%'��H��������u�i��V�u���P�"Y��H����N�=���VeY�ئW}]O��Ok�x��!�btd~-�N�B��١����J:�V�䬦�����l�*����F��?����)]r��Erޝ�����T�k�d(k�Gc�������ӜErB�:�'��N����5gK|�eV�5�5!�9���ְ�ͿHJ�:��h.��<���<k��y�"9�.裼�2.5�j����m�~�8JXT�jڸ�5rcUe֓�:a��x��F�������g�A���~W"Z�=f.5�RC���U�>&�CH���tW��0n�Ah�'��W)���`̋Y
�i���+�-���@���x�Y�(�a���\�(��*�Y#G&��,��֥9��p�z>�K f>L����'{!�/����9N�
�^�(��b�V����p_��cPIF�MI��]+�r�iYV�x�,��le'��`���\�k=W����m7�uw&�&q�r�y_���1����S� �Ej��,�:KU�R�W�,�#�6�	�����v!���}��ЪF�w� > >�}�ʗwI�-��R�Ht��d1��8OF+�YGf��N-�����Zvm�	%��l�1���)�����ps�f.����$Ҭ�`��ZӴ�=o�{*> �-���+N)$�UQ����8tΎ匛�j�(gAذ�K�*� 6��t�� N��*Y��3q�}A��I�:	�ˈ����m>�>�JI;��� <�)x�%*����$Yԍ�<�:O��#�I+ك ����%�e�2IξZ2��5�
g!�wW�©`2 o��R�긮G��|�|/ْ�T8Ѿ �τ�Ź�m\��	��>bK9�u�8�,س�����)�F�ueK�WXK�P��W���� �ד�2#�D#��O�d�E|��:���眤
l�����%����j�ή��}��C1$������F$`xj�g�w���0�a({���,�ZxۧGQ/um�����ۡ�膧��/� �+�o���x�/o������N;��Ѹ����~`u�]]'d�� �Ax�*<�n������o��I����	�x�-��*��
� |ڌ��D���~I2]����Y�y������ͳ�)�ǣ�Ǯ��z��������8���t��sV����Q�B���y;����~�����~�,�g�	���WRI��4���cz)56�e��ͳUc|��Q�xO�z�:�`�ǒ�P��=�X6�-���k���>�LR�wy>�E��`�m��5s��t�6�y����0���rY�� >`7��DuA�#Y��ﳳ·#�FPC�\-A|�n�Hd�\q`�h�������"^���+��I~���#[�L��Ū��x��Ӽ.�Y�I�-�A��B��~X�4S���d^�a�D-�$���exA�} �*��*�2%�t����	�#rcE�m);�e)�BT{-�6[ƽ��l��� >"7�����+��Y��1R��1֧Z�����M�q&H֙[�S5�"���%��s����<����u<������Ϡ�Nd��B����q&�a����@ϻ;�2,9w���WW^�y�Қ�Zq��EM�>�7��_���å;���ٞ}��صU^iV���g6Qp��E��d���!ڊA���j=g�A�Bm��}$.z��T�S�+��G�D�%A�zڮ��E��&����s|Z�b��kƃ�� >�}�gl�ʹ"�l�+���`*W������X�,�#�bKhA�'fB��`�dmY�e~,Qv�X鬵#���,���q5�x�L̶vT�����-> ~h��a��d��s���U�Z�cWG|��؍71�{�S�͢6Z꣨��S�bN�D��N;���γj;�s�c�,:�h��h�=>級���k�M��v�]�˼� 'W�Xခ���@�R����K���9��,��bߗ���f۴�Y��<~�eG�I5�=g��w�4�흭��aq����n)�Fd"K�8�������������l?TS�{'�6��!���2����{�r;�l�J��8��1�=K���.�-�?�+�-�eX�_�W��j`c�5{���gDa���.����
I��䠶�HE��P�m��Ag����.�����}�SL{�Y&��k����i���T��� ��d��=�    v�:��+�Ҫsլ���"!Wv[�����={C��X�k`Z�]V�c�f
�%w�=P�z���&�P�oά���^��[�|L��"���8��/i�%�]q���6��J��>��F����t�<�t����(���D� g9^p��0+���C��A����`0��qm��	�x��
�Q+L���F@zl}e&�5v���1�W��/�
Ǡ���F�``2�:)�^�a��ҭf��k1�v����X|Ϳ�%<�p�	���Y����S���o�%��#�5�cA��� ��5-���Sw�`%�6�j������h�ڼ��++�f%��YX�˓�F�% ��]�^�V	d��7��W���T�.�d�?̼�&��R�1��K����}�L�����ãFN�!>0	e��r�O\-}n[�Uc�_׺]uC��\��fy{%A���k�(�i�kWN~A�[&|�ӵf!\9i!$�)pT�T�Tsd<�t�E]��=���贽�ޭ�*΁M[ˡo[��{ZoC��?��"���+.��F�fY�{O��[��c��D����]Jх_�	�PI�"��sM�h�ڔ��A�ln�|��1�d`P�l�r��w�1/M7ۦ�D鴒E�g��)������������⪤���`pM��x�v�Yi"��f!>��-��}-��f��6E]��u�JL�z��vM�ig5����-ΟC�����ўc�¿o���ʮ��j�Z���,5�����$��]p�i�B=;�ј/�q2�s)�rʒ<a�u�z
��z��D���}iD7]���~�m�ƪ<����S�32���rg_x_2�K���%�j����ѷ,��-������1n���`�7u��\@uo�M����Q7�%I�j2���O���1��S·�s���k�T3�S�ÿ���J�³��}<L��07e�5y>�Eͯ�8��ewQ"�U�wC �,H�R�cs�"��ec�]I2D�(I��c����X뻝y�­��#�q��iڮF(����QF�C$��1�Ev���vWY ���.k�y�`�ҳ-�N&CV��JK��Sv�N�=W��/��aE�<fx��#��*J��a�G
F���/��˃��V�#��x4ys�N�f��������������߾oc2�h�~��G	~������*U$e�����%^�.��C�]˼*+�QT�~�n&��|�n�*�{je!$Uy�E3��V$m��k5�~�S]�ߟ�X��d�]��f�c�-Q�r��VY]C�-U|U�:����>�-I��U�H�p��W� �,Ju4<e�0ɼɲ��MM��S�U�Hfd毸d䤱|,��I�~<��ҩS]T��ܿo{�����Tg[D����Pn3��n�*��ǤU������q�< �&�f>�lV���T�h�{��)w�)�s�E�Zo_rN��Q'&݌��d����.�����ie�5�s���IF)\k>�wb|[�#���W+2�������P�������3q�,o�h��,���gj�t7���=WiAX����f@��w����֕�ɵ�+���}8T��7]��4����"U?7^��/k��Yv\|���*���&�m��zDy���]���4�j��,�}��=���c6I(��:�R�����O���~4��A܍ݼ�Ą�En2�/�FZ�?�]4�0nM��M��w�<��-��1�k%=F`<7�?�1�5���N�ݾ�����G�P����W���8A�/��̢m�
��X\�R���2ͪ��M��ydW�5ɟO� ^)r|�����(x��T@j��φ���Te˙�'_�[p��	'�b�7�b@g�U������<]���͞g�n��_�c諻qȚ7C;%��~5�teQ�v� '3�"����%��e�4���ÕY����:~{J1�Z�Rٔ����6N�L���?/��}@q�u��Y�@Zv�u�/gs\�؏$��,O��c�9��;����`�t�0�k%��<Ƕ��*Mӵ�� ����1���!,7��l���):�($?�s3N�x�U_u����T�@�B@.��;�_؆����?�1��q�(��Z�Ǳ�E#x��s�.kͮ�>7���^`H�\��m���������h��!{c��l��0<��@��|�/Lz��E��)�k}=� ����w�%ɮ㼚��V�6P���Ϫ�ZEM�K�-�Qg���>y�>�De�Q�!`�$z|P8��<�Z'��^!������J���4��:�c��J?�4�p����'�d��K�AK�\b�� �r�?��0Ȭ14���䡵�QU�xv�?:�'�c�$��jb��ҡK�kqת�ө��O�ӌ5O�r�5������z�ǧ���}X�#�.Y���˪ ��3�T��ST�r����[!%л2�����T@��t�< :i��_~Zd?�(b���r}��iQ�j��g�_�w�J���O���2Z��G��ae;0{P�Fw��;��D�W��wc��5��|��X���p�jW������YkV��������"��#Iѥo�śDZ##�}pE�;���y����& U���[TuyNG(��RK$�R��P�:|%/����:��ȿYSk�a�=Y�`��˷t��Ҿ
c"��N�-/�F^i,�d�G+�l�� �jnV�Fe�>��k&&���=-L`��Вiכ����5��� �#�7\L�Gk���ߪ�W�)���Z����R�i�+��t� ^��`��|(�����)h����&�ƁV2{�F����y�n|���0q��#��\=
�;�׊�V4%خ6��~��i\�e�?_��-#n���0 ���� �ɂua���sh۵]�[�C�8��g={�~B�&TV} "1�K�Cq�CA,�ŝ�,B��Ƶ�|��\Y�s#�GL2�f��7`�k�:�u�����;�
���r�9�7�`�< �X����@A�f��H�G�Z[������2� 	.���ws���oGV0m0b? 4~?�a�Q{]�a{7V��V��~���q���.�>`4~=q�0\ݽ�ߊ����Y�J��" Ǩ}��� d�9����Z,?d �Cr�A�|@�\��������CQ�׻ <8֧3kym؇����cn-�-�i�x��	�1aԺ��P���3a����7�"
O������9�&Z�*O�x,�TQ��:���xX��ĺ=�	D�.�v�����y�,yk�BEԊ)�<<�
?�a(p�w��� ��hsah�|&o�x� 8xx�n�Q� ��(%6��~������\�|�3��.諮
Q ��Ӽ�0t(yQ��ݠG��H��\�ϲpÃ�M���r2�W�G�G^C�Y(�-Q�%��<B�"u=��2s��Kް��D}��#O��90������ȓ�M�aF����<���Cb�GA��:�'!3�DT­� �_�a��mO �`�GR�C����5�+-�'ڰE������6�v#�����%���O��h���C��*{�m�I��'4�}�r��)_��.������,C�
>&�e.�07P�ٺH������C3����`-qC�J�K"�iW�u������>�|��j������eJ3�qw�r�G�Ø��Փ绝1��֠�n۞�W��F�C鐠��b:�;�,/�F�	��iL^�X���D�oQ�#��O2�*pK�I����j��y��%�?��}�U]"D��z�e:2�]E�>����z8uYW�θ(n�����e֊5ֲ�n�u�D��`��eN-�}��Kӊv�c��mik%��e��M%��1س�P=Y��k��j�y�ϗyb�U5K��E�������-H��Q\I����|-�N�3��sU��t�����j�V�����=�ŉ ����J.�G�V�Elk�����Gk�n�����2�	iC�)�"�!��M�4�C���    Y��s
��ʈ������}4��[���"�@�A麸�S�i~-���u;
�mp�D4.��5�g�ˆ���X�q'������eЍb��r�!��5"�5�걏�q�;��	��P�IJ�CŏZ�Z��Y�_��'N,vHVdC9D�I�|d�LB��%}C?ο�����<�s;s��)������q��%}_��C`T$I��!t��	�k�@��]CVve�Ԣn|���q�/� �֜�'#?��2��@�ᐍ�#~d�L�{ގI�,�w��"W���x�>��fJ�\����L$J���5/d���m�
�[�q��K2��{{�p��p�����9��ٟ�;��t,ޗ�T�HN.�~��A�5��eh�ű�L��ŵ?�*�5����2�j�\8)s?�KF�
E�#�hA���o�*o����x�/��Ye�Z�OK���C�&����0�ٜ��M��-�Y��)+�3�dE~X�?,��P���d����62T8��r���0�(!Ӥ��4�^
��B�E�Ǫ/��j��2�h�C�!�,?��'�	��	���Mv*��5�է�m��2;�r,s���$�����~Y��u�M�[=���V�����^.�R��Ј���֠A�������g8eź��$<N�]��3���X�A,��>�@�����~d��� ����c�48G�V��-ԘV�|�>��e�nEγ�E��2e���\�!C����4�q�.�������L>��1���u�$��]SD���C�^��A���ty׌j�xfݙ[~���2��q4@�rߊZ� �L�����v�T�/�]�3���q뚪:U�R[ѧ��A-�(��>������M�|��C��81[؃��K�NV}�2+�$-��Q�'=�/S��6d��a�j�U�S�a�/��:�����I��2w�rl��eV>���ܳ�}E���B
`��ɳ����Vͼix#Y2���:��¬��t�� �Ƞ�'��*$�#��Pۇ��d�IXA�/��!�� 쓅�j(�#)1����̇��EqN�}9Ϻ�e���4��F~ذ����|e���C�Ac�,R�Zv��n��}��/E[�0���e�9��J"w{|�Г�5��2�5��;*J�OH�2 � �>�r�oM\4�|��Z��j��f��El���?@ٟF�!d�� q���Β�E�V��L��B������Â�y���2@g7���}�<$��v��p�}��zK��׬a�x�t/KA��"?TĿ��nP*��|<A`���!�6/l�uc��\�dɳ,����&����U�:O\����C��!�)&��q�R��KA�
�>T)(�g���P"�pg2�N�-gq����J3y'~_���2�p�FJ�K��L���t�ʡk�,ղ/�]���� ㇥�d�E�2E0p�Q&� �����~ϻ%����s���}^_@d$�5�Q��G�A_9�ܠ�6.�#�7nP#��ԣn��
�'eu�=?R�q�(/�f��榪k*�B֯� �� M0r%�Sď��d�^�8�Ʊ{dӑ�mz������U�d?�8��"l��]7%�*��WSss��<������τ�W�M����*~�(T�?d`"��BME���Wo:m�өl�1n�|mc�����?O��vNN(��8N� &���>�È/�ܺ�UVq+��F~���`Gnĕ-6��c��h����/y��������z2�ލߐ���� ��yy⨆󘥹>�"�.�R���uY�a$�����'����ۿś����ik��N�GU\oC�_��ˬSFF�]�7X��(�V1 ޣ���T�`�T�4+���ry⧗eмd�sP��}G`QC�,D���V_�������t;]�_�{���"`n�@�7��I��,�s���3q���8����e�e�q�e�[I,pX�[��OЍr�]�͹8�w���m,/eU_��e���JF"?�ݟ���Ɍdj}�M�p���k:��U��M�PY#���l�_d��^ ��W��y���ڠ�16v��� �qB>BpU���1Y��@��/�rKG�O�}�GqQK��,SXUƹU�Nl�Y[� �R�X�$�*d��沪��X��釜����]B\j�Y�,C@Hm���0{�d4v�[�YQ��tO��RX������r�d���jg��Y�����������Kk�{:ݙ���,�.γF0}���u���A�F~��?TBD�B�A�?�)I��8iy�E�c��?��m� b�2�T���_2�r�0ʇb)z�|)��hO���y7N�d��e0�U��C��K�Ih Ѯ�|.�R�u܌ݜ���ƹU�c�LCG�Շ$���v�������O}=-J�-+�K���Ć��t�}��:��C���`�ɐ�?r�'���dC mm+ʲ�;'.��U򦻉�cH^�,�W�z�'�Cd�}�sA�`m����>�D5��Y�UQN� I��Y�*�u����#��e�w�2�~0�?	l��a�5t�Nw=Ej��)UY��Zޓ��~p��t�1�"X��p������1k�����t���D=��v��.��<NZ�UGٰz�~kYf�m�BW^�w���n�����n�P�3�:�R�u�6���Zd$�N���e7��Uݺ����k��2q 4��޸��s��E�:�$\Q��̖e(��N]G����o��|�bPn��}e�,�N�[��2�C�n��+Y�EUη�o��8��)����*�Z:�g���~ʤ3c�(p�i�r=�b�9�m�,�4���$t{���c�7��������ل�/2r������x��}��s���<��!�r�X0 RnL�Goˠ��:%?��'0�䁇O-�r�ե�o�a���׌W�,�ވ�8��8�'��dwAJh+w��=@À�n�כ;Eq�a�尦�0���y����늋s��#kBE�sx�ݏ;GM �ֳ���>D1���y�'=��>*��2{,���]�⎅Xa���B�1�U���zɫ���q��p{b�{��;�JjF�G���u �W놺���MM��u�j����C,"�!NJ���%��B���T?��X�g~���:���
*�C��:��q�l��;�:��vi�I4�����;ev�K�S�/w��^1!���Sw��r��\�hъ���.Ӡ(�qT�a�k�5v�3:�T���ܶVF�|��G��8ﯷ�uz������W�!��/������r�,�xJ�|Y��W��	�2����#2��j�6$��"�X�>���ԣN�\�e�ߗIH�iA��a����`�Ch��½���Nmߏ�M���y�����LC=�UA���:$��b��d��=��{ŋ�z�t��u����k��}M�'�]觍��;��#�c�|E�ƌ
�^X/D�>��>gE���d���,�R%g��L�n��׏f����cᕵ�%�m��(���v������)y]fp@T����+��>c�@�!�W��y��>�:���G}����2l�	��+��װ�O���⡛?�<tq|�Yr�S�u=�]�I(�w�/𝬇��)����2�ޅ�
ƨ���]�/�ck
WLyox��S��qȋrP}�.�%]Fp�RP���C�a� �������۬��d�Ԫ=��V�9�w����/��ٕ�9`��ʥ��#+�i�/�H�)��k��2�H����;���0�4d�����
�����@�!������?�ᠱ)<:�;HY�?���%��ri�a�sqc���G,��N �>�xq�IƄ����ďĤ�}RU?4u�ˮ+�{~�5��X�į� 	�W����5��d4��^%�f8��^ď��\Nq�`3r��j�c�q@����q�_�c+u���-]���#���æ�ԉ�����p�Nr��{&b��|����	]�K��D�,7��#��ehkE�Su��K ����1�y1=Ƹ=V1���Ήn�M{)�-*R��6ޕ���{ �gM/�	�N�%�D6���Ȭn��U|y]�x�R:p�w�,�q9��5�u    }��\�jj����<�2k�:�;�N��:����i�Js����t��Iy=]9�z:;4w�����+�C��.`�DU�~d����
k��r�q@d��'��op�� ����lPQ��m����`�O��U�;6"���>UVe�N�ꩤK���Z�x�ʘ�BV�wW�$��Ժ��i�������o�6�C��/@������(z]p=��8�f���y*���s��.�|d�J�A�I�l�'�0�uJ�&\�?�0��y.����.5���V�)��]éh�nh����rK%?��-��t���Z�.�����0!�6�끀~�J�U?�	��8t�ZJ��z��1��fN�ŕ�E}:>�����#��~�R4Ĳ'v��36���<d��{3���1/����e�Bb��;��������u���	Oa�2��Ҳ���Q;D��n�Uy�*PX����Q;��� nPQR�#w|6;D�����Tl�}�P}��G1j��B� À3Wڙ���i�rq9ˤHX2���}����WS�}�o�}����e|��Kz��5�" �	Y���F��ֶ7���ƻf�@����GkIU>���t�Ф�:�����ǹH��e�,B�t�wl�W�(�ȟ�ښ�˼��u<g�����%F��"`n��*�wlɗVVƕ�f��ϏS~��:֓u{ocui��2iK)	�^����p�n� ��%��:IX��Y�����I�b��p���ݞ����'>�q_	uk�s6��,2�C���r@M�p{��J�Mqcm������q��;��\��ށ�z�wH�&a�%����7��+2P�p�\����fϳ,9�^���9VG���/�7����T8|]���5��71E���$��Y"��-�ٔuM��Q/�8��b�Ik�?��<eޜ�PJ,cs���~zTY���J�2����.�B�)S�������"�Qs�#���<�LƩK�eNo��_�,���\P.�;\.���`*��w�K�h��AZ���{_��f�Y#��ĎEn��S��.���
hg����1�"|��;np���qq���))�����e�)n���V�t�˲�Jc\�5�aY!�p�.e>r���j
�<�n>��uw�Xa��iV�&���eYA�H�������&��+wܠ���i��?�=\����9+�檋�T��r}]fHGZ^�	�KGFf,�r����X@�S�`�E���#��t��W����ើ/�v7�]61�1�
̩qE�����_9!�۷$��܊*��Օ�S�8��lz�y_�i��_�9������W�^&�׵�W��EM�g��]�M:+>�&��y|�%}�ۥ{_&���^�3�C�0`���k*B��%�ʫ|�}=_�Q�U���; F��������ԚE)j��u�e��i����*��>>]�W��(��ʜ�����u@P���Vk������?��o&=������"�gKgi��y��1�ʿ2�'Uk"�)_��ж-��� ߗ��/��.��/�}P�ũ��������g	%ɛ��� �L$TH���e��VT	��s���5W	����k��FW��g�����Աob�� }�k�Ua�؆v�r�iy���#��)��[I+�0���5�lݐA�!
��㥠w{��2 �mc�����拊s}t�S+^ܕ��=b�����O�cs~�����t!�1E��]r �����9.jhO�Q+���>t���L* 
�y`�<�d,)�����OSP�hX��UDf�6��g����O��I��'�u�C�-"H	�L��y)�ݺC���BP���o�ny��&̈́�lۡ����i�00w�֤�q��t�I���Z��csIoQ�9�1�ȃ6t[Q O�b�#��$,ՃK��vK��%�!z4�,���i�����4�i�ܖ~�����Ԃ�[�ܬ��9���g3��A�8n�:��c|��= �Z��LcB�-�M\	�߷$<�$�RWXsS��"[�b�] �0zw��*��
�����@Co�I!�iU����ܺ�I~�5`*\��1o�C�A!(��}����C�d� ���w|�i�~�(��2�"$�}�^��f3A�(	���p�v�L>��ӔLW���}��� th������;?m�P�h���ե ���z����H�#
��'D��?�b������!��*�ظIA�ZEO���@DH�x�t��M
�/�7	�[E=�r�lR�2sPj��M�~���C��X��A}o��
��C]����1$S�D���c���0y3���=�G6�Vo�!�Ma)���`�|ݽ�81�lآ��z�m�����]��]�~��Ѱ;�0561�9Q`��q�7�%�C�����n�S�|�JBt�֨� �Wc�J0m�!{���e�i��I��Ҕ)I�c�`_`��sҐ��\=�ƃU���m�ٴ�!�'e�(�.u���tR%/����8�|�_��h5�\7���Fq���B� `WL�=jE5���qhk_ИBܙ����j�0�hZlQo��9�h�0�RΏ�G�/��]�К*O~����~��ȟ[2^[
!�f��o�y���U�VSu��:�Ӗ��p�m����eO�1�Nֳ�ں�E&�s���}.��v��B��� ���������σ��SP��e��DH6~S���p�M?�f��s�ˡO^/�B\h+��|�������+R��|5"��<}o��������-���P���$���P��q�"��`��5~��t;����ZD�
����z�v�\$߀��р�mu�ц-�>�S(��.�K��Z>j���"�4iϊ��O��g~PD�z�X`�(��G��%�5�����r�FڭHR͎Y��I�����7�B�R���˓84��=�n��YD�g3��uY��Y(Da�N���ِ�z{�!�-}���e�Cp�.���Y��$��1+p�*J�qk�$F�+������S]����ʚ.O?��ڮO�`��A |
�*�[�,Guk��Țd��,���'�[t�tf�����c�с� �Ȟ�m��!(8�!�}�T�������L�B�|��(�$^%Jg(�0�:E6�Q:B�#
�S���"����-E�U]���r:�먪c�bPW�_�B�@p��n�ǟ�p,�>؇a�X���x�+,maE�3���� ���V�:��r����*��s������ll|�l��w=�7)�6�w%bA��F��:�Kwo�b��#�����N >+�h%È9e�şm.��D@�Xii%��|����(��g��O���!VmE����O����&�K�B8r������K"nVȲ^�|z\q߷`ύ! �� JQ���Q[d)Y׼N.M�T�_��,�e�Nٗ �(׾��B𦥠|�G����{��K�tU��05Y5�cZ%�)��\��}t_�7�;1R��mf��=j''~��sY<��4��.s�L�j!P`3,��v�C>1y�m��h� ���=3��^$���Ǩ@'�YR>�i�/��\��\���D{|c�pJ8�	f���B(4ɐ֭�բ=�y��,�����ju�r���a
3�P|�
o7�Ҏ ��Ų��~~A��D��X5\��:�,�U�W,g��R�%��wW'�"MhB��{��K�8�Ѹ���/	%&�`,�sx?����a���xm����Ƨ��'"��n�.�DD�GNe�B�I�C�۪���<<���J���;�]�"$�GvC�f�My+n��p^���ds%��'��o�)�`3��"�ǝ�%�ܦ��q#K��1ܱG�����T�����Y͡�Ӯ���hw;�h�[��m����	DQ`���+��3����5��e����������*�k�g`*��2�o��<�٢�I+���&$@��$��x�i������v��E8iW�P��=�-��0��g��`Ւ`�o�nr�����ƫ��m���:�ǝ��aVlܤ��U`�u�0�'ۀ��O���	?�Vz �  �40	�%������tL��ľ�`Ý��;Twf�(������:��4����Y7�R�6���80�"���{r�MjF���������7��A0&��Z�L���K~�b�N�x;�rx�/ 	fM���>"��w���Ȟn�>[x��-i�IP
#�V ����Q pN�z'��r����'�C�Q�q�@d��w&o�MC��rO5�#
rR`8���)d���4i�)���n#���IM>=d�]Ut�!i�<�����˽�I�i��"R�D_�����&]���D{��S�I�����!D�5=CMf�%���p�"�[��e��z�厄t�a���N�t��N��`�Gn��%�N�$�����PI*���ߧ� v���2�~|��{LZ�����po`�C {$J?k�V��[��s�v�դ�l��$&��ց�Za�GI"����-�GI����P;�&{,`�n���@<�?.�-���)n:�6�r:叙�x�N;i�X:����<
1�����\�|V��{��-���W��{�ؓg�ڳm��0�g�)Ls�^��L�������nr�0 B�+�6\<��N�l{\ZR��~�΢���d���.�����ܾ(X@}N���}r@x�vf�ЏW����-��ٽ�)s����0�*�ט��;���Z0ק�j_A՝�cU�����d(���c1F8���dz�����	��Bw'�kc�!D(�s��I�ONA
��wB�~��rJ�S��l��D�
�*� Tdb�ܻ}60	`��G�T�G��o���򏂈x�9�a-E��Dr÷"([i�`�
/��U8m�	�ףȜ y��0bbO=�bs{���LC���F�7�H��d����&_�P����@����Mot�F�̄�^��v|�u�Ur�$s)�ύڢ9���69����� ��^�n\�y�xY�Mh�+��	|}���yY�RG���y�tY����W��a�l���O���g]w�r`����Dh���MR��	I"��Pߙ��6	�6�зӚr�Dp�Иh�+'��I�����(1�u�!��Ķ���!Y8�\�ȏ?"p���3���q:ԝ��E�`3L�+k�o<!xÐX�l'x�َ����7���&�u:51��'I_rO��ck��pg.o��!?�r�6��� �LH�M+��a�aj��X��N����8�w�e�ܻb�X�!��W��4�io牛��Vb��%&b��';�w��?�U}A�my]{<�ȡ"iPf��nȚ���"h��;YI��=o�P`>�����a)
�dVe^l~B�+0�z�'��?t�^�����	T)Y���澛���+!q'v#b�3��b�����#7�h��%�L�����ޠ��ˠ�}Aa�j6�;���H�Z�����и�+�hϝ� &X��ث��0���S�g�sU�#!�+M��u	S�o��G�gJ�����F��ܯ�P�%Oe��y��Sr�;�҇��	��mPvx�v�E�Z|Le�@;�N�^��C��i���J[�q`�}��7<}�ӈ�$\�5�ʇ��J3��,���^YA���Z��q�
 D��F��i�g��U��2�.�5�g�� �3l��ц���7Җ�h07wm������`?wl��z���"0��Yn~������Q]�<�G~�%��^��'��AM@\��4{���ЏÒ��M/��2�L_;G�U~���OZ�'���ڇ���vV���
�Ї�¸�]l�l|(CA̭N�}�m^����d0ʝ�~�_H�p"kȇ�m:G��l��0Y�D��~��gc�h�Z�6[~�y%_hG���B�f}��^/�Q�f�y ��w�����e`���x�d� �Z���?�#�nI2Q fh#%׏B��� � ���(��,�l�,�/
}t�~U���Fi ���?�ԁ^TRM��!�*�܇s3T�.>W'�i������JJɢ�7
G��X�r퍒��1���Fho�4��o�U�E4;=��]��=��~��S��>�퍒hS��Y!b�i��g��%>k+��[�Ҹ�u&���f������m�FKd�=*��C����
9�u�܆�P֎��'�5į��B8I+�7>yG�Cx$8��>y�)j�h��
m�Q|m�ú�R!i�����p&8jR}��1��I�Mb��5�J�q��B������8� :��1�~B{�G�wAS�l�Z8SQ���Q��d�z�\_�
�$��D4<�2f���r}�[���a��11q��_o�w�/.��&�f�t�M���y�ǧ=�R�����[~w��R.�Ä�z��xD�F�}4rK��,���!�ѿ?+��q���$�_Y�4�B��,)�E�1G�a�́1l�%	=R�x���پB[��a�c�C�y�)�q�!XK�w���p��V�=zN[BD=W���h��C�H��[h{�� E�o��WB�j��uuy+�=b�t���djm�� �-B�Xn��Jl`�Y�7 �FkA*�����.�s��x�H{�� 33M�7D�G�ʫpH�іh<�u!��b�MA5�ԅfApѥ}:�y��!B,��A����C�|]c�X�ޒy���!�
�����x��زmd$��YJ��Ggx���Hi���[��{QLQ�C@=�o��GSLD����Z����B� �.��[bP�p>c Pq�x��-xWBl��K��~�D�M�t>+��Ʒ�Gg8xQ@~sK��#��(�����؂��oa�8�V7P�v���oaǬF$Y���GxK�+�B�a�Ж� .6���L:���ׄ�&֬g,4����&0L*���h{\�ؤa)��-�7&\~�#P�e/aq~��<� �_-6���w������"��      �      x������ � �      y   :   x�3�t�K)J-�,��+I-��4400745�00�LI,�LqH�M���K������� �a�      {   P   x�34�tI,�L�,��+I-��4400224214614�4�LI�B��r�s���s3s���sA��M�,̸b���� �.D      }      x�3�,,O-a�=... +]k         7   x�34��*M�SpI,�L���/H��4400745�0��4�4Ep�8c�8�b���� �hI      �   <   x�E��	  C�o3�������s����P��,�aS�1_@-^�Z�NvD���1���K�     