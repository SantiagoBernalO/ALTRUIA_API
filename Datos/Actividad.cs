using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using Utilitarios;

namespace Datos
{
    public class Actividad : Mapping
    {
		public List<Utest> enteros()
		{
			return new Mapping().utest.ToList();
		}
        public int verificarCantidadMaximaActividadesPorDocente(UActividad actividadE)
        {
            return new Mapping().actividad.Where(x => (x.Docente_creador.Equals(actividadE.Docente_creador))).Count();
        }
        public void agregarActividad(UActividad actividadE)
        {

            using (var db = new Mapping())
            {
                db.actividad.Add(actividadE);
                db.SaveChanges();
            }
        }

		public string desactivivarOActivarActividad(int actividad_id)
		{
			using (var db = new Mapping())
			{

				UActividad actividadAActualizar = db.actividad.Where(x => x.Id_actividad.Equals(actividad_id)).FirstOrDefault();
				string respuesta = "Se activo actividad con exito";
				actividadAActualizar.Estado_id = actividadAActualizar.Estado_id == 1 ? 2 : 1;

				respuesta = actividadAActualizar.Estado_id == 1 ? respuesta: "Se desactivo actividad con exito";

				var enty = db.Entry(actividadAActualizar);
				enty.State = EntityState.Modified;
				db.SaveChanges();

				return respuesta;
			}
		}

		public string desactivivar_ActivarCategoria(int actividad_id)
		{
			using (var db = new Mapping())
			{

				UActividadPecsCategorias categoriaAActualizar = db.uActividadPecsCategorias.Where(x => x.Id.Equals(actividad_id)).FirstOrDefault();
				string respuesta = "Se activo actividad con exito";
				categoriaAActualizar.Estado_id = categoriaAActualizar.Estado_id == 1 ? 2 : 1;

				respuesta = categoriaAActualizar.Estado_id == 1 ? respuesta : "Se desactivo actividad con exito";

				var enty = db.Entry(categoriaAActualizar);
				enty.State = EntityState.Modified;
				db.SaveChanges();

				return respuesta;
			}
		}


		public UActividad getActivityId(int activity_id)
		{
			using (var db = new Mapping())
			{

				return db.actividad.Where(x => x.Id_actividad.Equals(activity_id)).FirstOrDefault();

			}
		}

        public List<UActivity> getListaActividades(UUser usuario)
        {
            using (var db = new Mapping())
            {

				return db.ObtenerActividades(usuario);
            }
        }

        public List<UModulo> getListaModulos(string idEstudiante, int actividadSeleccionadaId)
        {
            using (var db = new Mapping())
            {

                return db.ObtenerModulos(idEstudiante, actividadSeleccionadaId);
            }
        }

        public UActivityTest getTestIndividual(int idActividad, int idModulo)
        {
            using (var db = new Mapping())
            {

                return db.ObtenerTestIndividual(idActividad, idModulo);
            }
        }

        public UActivityTestAudio getTestIndividualAudios(int idTest)
        {
            using (var db = new Mapping())
            {

                return db.ObtenerTestIndividualAudios(idTest);
            }
        }

        public UActivityTestRespuesta getTestIndividualRespuestas(int idTest)
        {
            using (var db = new Mapping())
            {

                return db.ObtenerTestIndividualRespuestas(idTest);
            }
        }

		public string postActualizar_NombreModulo_Test_Audios_Respuestas(UActivityTest test, UActivityTestAudio testAudio, UActivityTestRespuesta testResúesta)
		{
            using (var db = new Mapping())
            {

                return db.ActualizarNombreModuloTestAudiosRespuestas(test, testAudio, testResúesta);
            }
        }
    }
}