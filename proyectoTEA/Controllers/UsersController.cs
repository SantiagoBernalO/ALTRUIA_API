using LogicaDeNegocio;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Utilitarios;
using System.Web.Http.Cors;
using System.Threading.Tasks;

namespace proyectoTEA.Controllers
{
	[EnableCors(origins: "*", headers: "*", methods: "*")]


	[RoutePrefix("api/users")]
	public class UsersController : ApiController
    {
		
		[Route("PostRegistrarUsuario")]
		[HttpPost]
		public async Task<IHttpActionResult> PostRegistrarUsuario(URegister nuevoUsuario)
		{
            RegistroResponse response = new RegistroResponse();
            try
			{

                response = await new LUser().agregarUsuario(nuevoUsuario);
				return Ok(response);
			}
			catch (Exception ex)
			{
                return BadRequest("Error. " + ex.Message);
            }
		}

		/*
		[Route("PostRegistrarDocente")]
		[HttpPost]
		public async Task<IHttpActionResult> PostRegistrarDocente(UDocente nuevoDocente)
		{
            RegistroResponse response = new RegistroResponse();
			try
			{
 
					response = await new LUserRegistercs().agregarUsuario(nuevoDocente, 1);

					return Ok(response);
 
            }
			catch (Exception ex)
			{
                return BadRequest("Error. " + ex.Message);
            }
		}*/

		/*
		[Route("PostRegistrarEstudiante")]
		[HttpPost]
		public async Task<IHttpActionResult> GetRegistrarEstudiante(UEstudiante userEstudiante)
		{
            RegistroResponse response = new RegistroResponse();
            try
			{
                response = await new LUser().agregarUsuario(userEstudiante, 3);
				return Ok(response);

			}
			catch (Exception ex)
			{
                return BadRequest("Error. " + ex.Message);
            }
		}*/


		[Route("GetDatosAsistente/{usuarioId}")]
		[HttpGet]
		public async Task<IHttpActionResult> GetDatosAsistente(int usuarioId)
		{
            UsuarioResponse acudiente = new UsuarioResponse();

			try
			{
				acudiente = await new LUser().obtenerDatosAsistente(usuarioId);

				return Ok(acudiente);
			}
			catch (Exception ex)
			{
				return InternalServerError(ex);
			}
		}

		/*
		[Route("GetDatosDocente")]
		[HttpGet]
		public async Task<IHttpActionResult> GetDatosDocente(string cedulaE)
		{
            UsuarioResponse docente = new UsuarioResponse();

            try
			{
                docente = await new LUserRegistercs().obtenerDatosDocente(cedulaE);

				return Ok(docente);
			}
			catch (Exception ex)
			{
				return InternalServerError(ex);
			}
		}*/


		[Route("GetDatosEstudiante/{documento}")]
		[HttpGet]
		public async Task<IHttpActionResult> datosEstudiante(string documento)
		{
            UsuarioResponse estudiante = new UsuarioResponse();

            try
			{
                estudiante = await new LUser().obtenerDatosEstudiante(documento);

				return Ok(estudiante);
			}
			catch (Exception ex)
			{
				return InternalServerError(ex);
			}
		}


        [Route("GetDatosRol/{idRol}")]
        [HttpGet]
        public async Task<IHttpActionResult> datosRol(int idRol)
        {
			UsuarioResponse response = new UsuarioResponse();

            try
            {
                response = await new LUser().obtenerDatosRol(idRol);

                return Ok(response);
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }

    }
}
