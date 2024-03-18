using LogicaDeNegocio;
using System;
using System.Collections.Generic;
using System.Web.Http;
using System.Web.Http.Cors;
using Utilitarios;

namespace proyectoTEA.Controllers
{
	[EnableCors(origins: "*", headers: "*", methods: "*")]

	[RoutePrefix("api/actividades")]
	public class ActividadController : ApiController
	{

        [HttpPost]
        [Route("PostActividades")]
        public IHttpActionResult postActividades(UUser user)
        {
            try
            {
                return Ok(new LActividad().getActividades(user));
            }
            catch (NullReferenceException ex)
            {
                return BadRequest("No existen actividades disponibles");
            }
            catch (Exception ex)
            {
                return BadRequest("surgio el siguente error: " + ex.Message.ToString());
            }
        }

        [HttpGet]
        [Route("GetModulosActividad/{idEstudiante}/{actividadSeleccionadaId}")]
        public IHttpActionResult getModulosActividad(string idEstudiante, int actividadSeleccionadaId)
        {
            try
            {
                return Ok(new LActividad().getModulosActividad(idEstudiante, actividadSeleccionadaId));
            }
            catch (NullReferenceException ex)
            {
                return BadRequest("No existen modulos disponibles");
            }
            catch (Exception ex)
            {
                return BadRequest("surgio el siguente error: " + ex.Message.ToString());
            }
        }

        //test

        [HttpGet]
        [Route("GetActividadTestIndividual/{idActividad}/{idModulo}")]
        public IHttpActionResult getActividadTestIndividual(int idActividad, int idModulo)
        {
            try
            {
                return Ok(new LActividad().getActividadTestIndividual(idActividad, idModulo));
            }
            catch (NullReferenceException ex)
            {
                return BadRequest("No se encontro el test");
            }
            catch (Exception ex)
            {
                return BadRequest("surgio el siguente error: " + ex.Message.ToString());
            }
        }

        [HttpGet]
        [Route("GetActividadTestIndividualAudios/{idTest}")]
        public IHttpActionResult getActividadTestIndividualAudios(int idTest)
        {
            try
            {
                return Ok(new LActividad().getActividadTestIndividualAudios(idTest));
            }
            catch (NullReferenceException ex)
            {
                return BadRequest("No se encontro el test");
            }
            catch (Exception ex)
            {
                return BadRequest("surgio el siguente error: " + ex.Message.ToString());
            }
        }

        [HttpGet]
        [Route("GetActividadTestIndividualRespuestas/{idTest}")]
        public IHttpActionResult getActividadTestIndividualRespuestas(int idTest)
        {
            try
            {
                return Ok(new LActividad().getActividadTestIndividualRespuestas(idTest));
            }
            catch (NullReferenceException ex)
            {
                return BadRequest("No se encontro el test");
            }
            catch (Exception ex)
            {
                return BadRequest("surgio el siguente error: " + ex.Message.ToString());
            }
        }

        [Route("PostActualizar_NombreModulo_Test_Audios_Respuestas")]
        [HttpPost]
        public IHttpActionResult PostActualizar_NombreModulo_Test_Audios_Respuestas(UActivityTestBody body)
        {
			UActivityTest test = body.Test;
			UActivityTestAudio testAudio = body.TestAudio;
			UActivityTestRespuesta testRespuesta = body.TestRespuesta;
            string message;

            try
            {
                message = new LActividad().postActualizar_NombreModulo_Test_Audios_Respuestas(test, testAudio, testRespuesta);
                return Ok(message);
            }
            catch (Exception ex)
            {
                return BadRequest("surgio el siguente error: " + ex.Message.ToString());
            }
        }

        //pecs



    }
}