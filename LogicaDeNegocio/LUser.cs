using Datos;
using System;
using System.Threading.Tasks;
using Utilitarios;
using System.Security.Cryptography;
using System.Text;
using System.Linq;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace LogicaDeNegocio
{
	public class LUser
	{

		public async Task<RegistroResponse> agregarUsuario(URegister nuevoUsuario)
		{
            RegistroResponse response = new RegistroResponse();
            try
			{
                UAsistente asistente = new UAsistente(); 
                UEstudiante estudiante = new UEstudiante();
                UUser userValidacion = new UUser();

                var jObject = JObject.Parse(nuevoUsuario.Usuario.ToString());

                //asigna datos usuario
                if (nuevoUsuario.UusuarioLogin.Id_rol == 1)//rol estudante
                {
                    estudiante = JsonConvert.DeserializeObject<Utilitarios.UEstudiante>(jObject.ToString());
                    //genera codigo enlace 
                    estudiante.CodigoEnlace = generadorEnlace();
                    //valida exitencia del usuario
                    userValidacion = await new Datos.UsersLogin().datosUsuarioDocumento(nuevoUsuario.UusuarioLogin);
                }
                else
                {
                    asistente = JsonConvert.DeserializeObject<Utilitarios.UAsistente>(jObject.ToString());
                    //valida exitencia del usuario
                    userValidacion = await new Datos.UsersLogin().datosUsuario(nuevoUsuario.UusuarioLogin);
                }

                
                
                if (userValidacion == null)
				{
                    nuevoUsuario.UusuarioLogin.Clave = passwordEncrypt(nuevoUsuario.UusuarioLogin);
                    new Datos.UsersRegister().agregarUsuario(nuevoUsuario.UusuarioLogin);

                    if (nuevoUsuario.UusuarioLogin.Id_rol == 1)
                    {
                        estudiante.IdUsuario = nuevoUsuario.UusuarioLogin.Id;
                        new Datos.UsersRegister().agregarEstudiante(estudiante);
                        
                        response.Usuario = estudiante;
                    }
                    else
                    {
                        asistente.IdUsuario = nuevoUsuario.UusuarioLogin.Id;
                        new Datos.UsersRegister().agregarAsistente(asistente);
                    }
                    response.Mensaje = "Registrado con exito";
					response.ValidacionExistenciaUsuario = false;

					return response;
				}
				else 
				{
					response.Mensaje = "Este correo ya se encuentra registrado";
					response.ValidacionExistenciaUsuario = true;

                    return response;
				}
			}
			catch (Exception e)
			{
				response.Mensaje = "Error. " + e.Message;

				return response;

            }
		}

		public async Task<UsuarioResponse> obtenerDatosAsistente(int usuarioId)
        {
            UsuarioResponse response = new UsuarioResponse();

            UAsistente asistente = await new Datos.UsersLogin().datosAsistente(usuarioId);

            if (asistente != null)
            {
				response.Usuario = asistente;
				response.Mensaje = "datos de usuario obteidos";
            }
            else
            {
                response.Usuario = null;
                response.Mensaje = "usuario inexistente";
            }
			return response;

		}
        /*
		public async Task<UsuarioResponse> obtenerDatosDocente(string cedulaE)
		{
            UsuarioResponse response = new UsuarioResponse();

            UDocente docente = await new Datos.UsersLogin().datosDocenteUsuarioSegunDocumento(cedulaE);

            if (docente != null)
            {
                response.Usuario = docente;
                response.Mensaje = "usuario existente";
            }
            else
            {
                response.Usuario = null;
                response.Mensaje = "usuario inexistente";
            }

            return response;

        }*/

		public async Task<UsuarioResponse> obtenerDatosEstudiante(string cedulaE)
		{

            UsuarioResponse response = new UsuarioResponse();

            UEstudiante estudiante = await new Datos.UsersLogin().datosEstudianteSegunDocumento(cedulaE);


            if (estudiante != null)
            {
                response.Usuario = estudiante;
                response.Mensaje = "usuario existente";
            }
            else
            {
                response.Usuario = null;
                response.Mensaje = "usuario inexistente";
            }

            return response;

        }

        public async Task<UsuarioResponse> obtenerDatosRol(int idRol)
        {

            UsuarioResponse response = new UsuarioResponse();
            URol rol = new URol();

            rol = await new Datos.UsersLogin().obtenerRol(idRol);


            if (rol != null)
            {
                response.Usuario = rol;
                response.Mensaje = "rol existente";
            }
            else
            {
                response.Usuario = null;
                response.Mensaje = "rol inexistente";
            }

            return response;

        }

        public string passwordEncrypt(UUser user)
		{
            var algoritmo = new Rfc2898DeriveBytes(user.Clave, Encoding.UTF8.GetBytes(user.Correo + "autiweb"), 10000);

            var bytesEncriptados = algoritmo.GetBytes(32);
            return Convert.ToBase64String(bytesEncriptados);
        }

        public string generadorEnlace()
        {
            // Longitud del código alfanumérico
            int longitud = 8;

            // Caracteres alfanuméricos válidos
            const string caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";

            // Creamos un objeto Random
            Random random = new Random();

            // Generamos una secuencia de caracteres alfanuméricos aleatorios de la longitud especificada
            string codigo = new string(Enumerable.Repeat(caracteres, longitud)
                                                  .Select(s => s[random.Next(s.Length)])
                                                  .ToArray());

            return codigo;
        }

    }
}
