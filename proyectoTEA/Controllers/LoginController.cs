using LogicaDeNegocio;
using proyectoTEA.Seguridad;
using System;
using Newtonsoft.Json.Linq;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Cors;
using Utilitarios;

namespace proyectoTEA.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]


	[RoutePrefix("api/login")]
    public class LoginController : ApiController
    {
        [HttpPost]
        [Route("PostIngresoLogin")]

		public async Task<IHttpActionResult> PostIngresoLogin(UUser usuarioE)
		{
            AuthResponse response = new AuthResponse();
            try
			{

					response = await new LIngresoLogin().ingresoLogin(usuarioE);

                    if (response.Usuario == null)
                    {
                        return Ok(response);
                    }
                    else
                    {
						response.Token = TokenGenerator.GenerateTokenJwt(response.Usuario);
						//por seguridad queda null la clave
						response.Usuario.Clave = null;
                        return Ok(response);
                    }
			}
			catch (Exception ex)
			{
				return InternalServerError(ex);
			}
		}


		[HttpPost]
		[Route("PostRecuperarClave")]
		public async Task<IHttpActionResult> GetCorreoRecuperarClave(UUser usuario)
		{
            AuthResponse response = new AuthResponse();
            try
			{
                response = await new LIngresoLogin().enviarCorreoDeRecuperacion(usuario);
				return Ok(response);
			}
			catch (Exception ex)
			{
				return InternalServerError(ex);
			}
		}

		[HttpGet]
		[Route("GetValidacionTokenRecuperacion/{token}")]
		public IHttpActionResult GetValidacionTokenRecuperacion(string token)
		{
            AuthResponse response = new AuthResponse();
            try
			{
                response = new LIngresoLogin().validarTokenRecuperar(token);

				
				return Ok(response);
				
			}
			catch (Exception ex)
			{
				return InternalServerError(ex);
			}
		}

		[HttpPost]
		[Route("PostActualizarClave")]
		public async Task<IHttpActionResult> PostActualizarClave(object credencial_correo)
		{
            AuthResponse response = new AuthResponse();

            dynamic dynamicObject = credencial_correo;

            string credencialNueva = dynamicObject.credencial;
            string correo = dynamicObject.correo;

            try
			{
                response = await new LIngresoLogin().nuevaClave(credencialNueva, correo);
				
				return Ok(response);
				
			}
			catch (Exception ex)
			{
				return InternalServerError(ex);
			}
		}
	}
}