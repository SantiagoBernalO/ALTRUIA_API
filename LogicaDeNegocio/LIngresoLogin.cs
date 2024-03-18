using Datos;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Net.NetworkInformation;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using Utilitarios;

namespace LogicaDeNegocio
{
    public class LIngresoLogin
    {
        public async Task<AuthResponse> ingresoLogin(UUser usuarioE)
        {
            AuthResponse response = new AuthResponse();
            UTokenSeguridadLogin tokenLogin = new UTokenSeguridadLogin();

            try
            {
                response.Usuario = (usuarioE.Id_rol == 1 ? 
									await new Datos.UsersLogin().datosUsuarioDocumento(usuarioE) : 
									await new Datos.UsersLogin().datosUsuario(usuarioE));

                if (response.Usuario == null)    
                {    
					response.Mensaje = "Este documento no se encuentra registrado, por favor registrese.";
                    return response	;   
                }
                else
                {

					if (response.Usuario.Id_rol == 1)//rol estudiante
                    {

                        usuarioE.Clave = passwordEncrypt(usuarioE);
                        response.Usuario = await new Datos.UsersLogin().verificarLoginEstudiante(usuarioE);
					}
					else 
                    {
                        usuarioE.Clave = passwordEncrypt(usuarioE);
                        response.Usuario = await new Datos.UsersLogin().verificarLogin(usuarioE);
                    }


                    if (response.Usuario == null)
					{
						response.Mensaje = "Contraseña Incorrecta,intente nuevamente";
						return response;
					}
					else
					{
						response.Mensaje = "Ingreso exitoso";
						response.Usuario.Clave = null;
						return response;
					}
                }
                
            }
            catch (Exception e)
            {
                response.Mensaje = "error: " + e;
                return response;
            }
        }

        public void guardar_ActualizarToken(TokenLogin token)
        {
			try
			{
                TokenLogin tokenActual = new Seguridad().obtenerTokenActual(token);

                if (tokenActual != null)
                {
                    new Seguridad().actualizarTokenLogin(tokenActual, token);
                }
                else
                {
                    new Seguridad().guardarTokenLogin(token);
                }

            }
			catch (Exception ex)
			{
				var mensaje = ex.Message;
			}        
        }

 		public AuthResponse validarTokenRecuperar(string token)
		{
            AuthResponse response = new AuthResponse();
			UUser usuario = new UUser();
            try
			{
				var tiempoActual = DateTime.Now;
                string fechaFormateada = tiempoActual.ToString("dd/MM/yyyy HH:mm:ss");

                string correoUsuario_TokenRecuperacion = new UsersLogin().validarTokenRecuperarClave(token, fechaFormateada);

				if(correoUsuario_TokenRecuperacion != null)
				{
					response.Mensaje = "acceso validado";
					usuario.Correo = correoUsuario_TokenRecuperacion;
                    response.Usuario = usuario;

				}
				else
				{
                    response.Mensaje = "acceso invalido, intente nuevamente";
					response.Usuario = null;
                }

				return response;

            }
			catch (Exception ex)
			{
                response.Mensaje = "Ha surgido un error" + ex;
				return response;
			}
		}

		public async Task<AuthResponse> nuevaClave(string credencialNueva, string correo)
		{
            AuthResponse response = new AuthResponse();
			UUser user = new UUser();
            try
			{
				user.Correo = correo;
                user.Clave = credencialNueva;
                response.Usuario = await new Datos.UsersLogin().datosUsuario(user);
                //string documentoUsuarioValidado = await new UsersLogin().datosUsuarioSegunCorreo(correo);

				if (response.Usuario == null)
				{
					response.Mensaje = "acceso invalido, usario no existente";
					return response;
				}
				else
				{
                    user.Clave = passwordEncrypt(response.Usuario);

                    string msj = new UsersLogin().actualizarPassword(user);

					//inhabilitar token//

					response.Mensaje = msj;
					user.Clave = null;
					response.Usuario = user;
					return response;
				}
			}
			catch(Exception ex)
			{
                response.Mensaje = "Ha surgido un error" + ex;
				return response;
			}

		}
		public async Task<AuthResponse> enviarCorreoDeRecuperacion(UUser usuario)
		{
            AuthResponse response = new AuthResponse();

            try
			{
				var correo = usuario.Correo;
				var nombre = "";
				var documento = usuario.Documento;

                UUser datosUsuario = await new UsersLogin().datosUsuario(usuario);
                UAsistente acudiente = await new UsersLogin().datosAsistente(datosUsuario.Id);

                nombre = acudiente.Nombre;

                /*
                switch (datosUsuario.Id_rol)
				{
					case 1:
						UDocente docente = await new UsersLogin().datosDocenteUsuarioSegunDocumento(usuario.Documento);
                        correo = docente.Correo;
						nombre = docente.Nombre;
                        documento = docente.Documento;
                        break;
					case 2:
                        UAsistente acudiente = await new UsersLogin().datosAsistente(usuario.Id);
                        nombre = acudiente.Nombre;
                        break;
					case 3:
                        //UEstudiante estudiante = await new UsersLogin().datosEstudianteSegunDocumento(usuario.Documento);
                        //correo = estudiante.Correo; 
						break;
				}*/

                if (datosUsuario == null)
				{
					response.Mensaje = "usuario inexistente o no registrado";
					response.Usuario = null;

                }else if(datosUsuario != null)
				{
					UTokenRecuperacion tokenRecuperacion = new UTokenRecuperacion();
					tokenRecuperacion.Token = encriptar(JsonConvert.SerializeObject(usuario.Correo+DateTime.Now));
					tokenRecuperacion.Correo = correo;
					tokenRecuperacion.DocumentoUsuario = documento;
					tokenRecuperacion.TiempoLimite = DateTime.Now.AddHours(5);

					UVariableParametrica rutarecuperacion = await new UsersLogin().rutaRecuperacionPassword();

                    if ((new Mail().enviarMailRecuperacionPassword(tokenRecuperacion, nombre, rutarecuperacion)==true))
					{

                        new UsersLogin().guardarTokenRecuperacion(tokenRecuperacion);

                        response.Mensaje = "Por favor valide en su correo "+ correo + " los pasos para recuperar la contraseña";

                    }
				}

				return response; ;
			}
			catch (Exception ex)
			{
				response.Mensaje = "Ha surgido un error" + ex;
				return response;
			}
		}

		private string encriptar(string entrada)
		{
			SHA256CryptoServiceProvider prueba = new SHA256CryptoServiceProvider();

			entrada = entrada + ConfigurationManager.AppSettings["JWT_SECRET_KEY"];


            byte[] entradaByte = Encoding.UTF8.GetBytes(entrada);
			byte[] hashedBytes = prueba.ComputeHash(entradaByte);

			StringBuilder salida = new StringBuilder();

			for (int i = 0; i < hashedBytes.Length; i++)
			{
				salida.Append(hashedBytes[i].ToString("x2").ToLower());
			}
			return salida.ToString();
		}

        public string passwordEncrypt(UUser user)
        {
            var algoritmo = new Rfc2898DeriveBytes(user.Clave, Encoding.UTF8.GetBytes(user.Correo + "autiweb"), 10000);
            var bytesEncriptados = algoritmo.GetBytes(32);
            return Convert.ToBase64String(bytesEncriptados);
        }

    }
}
