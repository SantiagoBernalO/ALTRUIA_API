using LogicaDeNegocio;
using System;
using System.Web.Http.Cors;
using System.Web.Http;
using Utilitarios;
using System.Threading.Tasks;
using System.Collections.Generic;
using Newtonsoft.Json;

namespace proyectoTEA.Controllers
{
	[EnableCors(origins: "*", headers: "*", methods: "*")]

	[RoutePrefix("api/estudiante")]
	public class EstudianteController : ApiController
    {

		[Route("obtenerEstudiantesEnlazados")]
		[HttpPost]
		public async Task<IHttpActionResult> obtenerEstudiantesEnlazados(UUser usuario)
		{
			string message;
			try
			{
				return Ok(await new LEstudiante().obtenerEstudiantesEnlazados(usuario));
			}
			catch (Exception ex)
			{
				message = "Hubo un error" + ex;
				return BadRequest(message);
			}
		}

		[Route("enlazarConEstudiante/{documentoEstudiante}/{idUsuario}/{codigoEnlace}")]
		[HttpGet]
        public async Task<IHttpActionResult> EnlazarConEstudiante(string documentoEstudiante, int idUsuario, string codigoEnlace)
		{
            string message = "";

			try
			{
                message = await new LEstudiante().enlazarConEstudiante(documentoEstudiante, idUsuario, codigoEnlace);
				return Ok(message);
			}
			catch (Exception ex)
			{
				message = "Hubo un error" + ex;
				return BadRequest(message);
			}
		}

        /*[Route("enlazarEstudianteDirectoRegistro")]
        [HttpGet]
        public async Task<IHttpActionResult> enlazarEstudianteDirectoRegistro(string documentoEstudiante, string documentoUsuario)
        {
            string message = "";

            try
            {
                message = await new LEstudiante().enlazarEstudianteDirecto(documentoEstudiante, documentoUsuario);
                return Ok(message);
            }
            catch (Exception ex)
            {
                message = "Hubo un error" + ex;
                return BadRequest(message);
            }
        }*/

        [Route("eliminarEnlace/{documentoEstudiante}/{idUsuario}")]
		[HttpGet]
		public async Task<IHttpActionResult> eliminarEnlace(string documentoEstudiante, int idUsuario)
		{
			string message;
			try
			{
				message = await new LEstudiante().eliminarEnlace(documentoEstudiante, idUsuario);
				return Ok(message);
			}
			catch (Exception ex)
			{
				message = "Hubo un error" + ex;
				return BadRequest(message);
			}
		}

	}
}
