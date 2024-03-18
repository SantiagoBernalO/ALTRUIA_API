using Datos;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Threading.Tasks;
using Utilitarios;

namespace LogicaDeNegocio
{
    public class LActividad
    {
		public List<Utest> listaEnteros()
		{
			return new Datos.Actividad().enteros();
        }

        public List<UActivity> getActividades(UUser usuario)
        {
            return new Actividad().getListaActividades(usuario);
        }

        public List<UModulo> getModulosActividad(string idEstudiante, int actividadSeleccionadaId)
        {
            return new Actividad().getListaModulos(idEstudiante, actividadSeleccionadaId);
        }

        public UActivityTest getActividadTestIndividual(int idActividad, int idModulo)
        {
            return new Actividad().getTestIndividual(idActividad, idModulo);
        }

        public UActivityTestAudio getActividadTestIndividualAudios(int idTest)
        {
            return new Actividad().getTestIndividualAudios(idTest);
        }

        public UActivityTestRespuesta getActividadTestIndividualRespuestas(int idTest)
        {
            return new Actividad().getTestIndividualRespuestas(idTest);
        }

		public string postActualizar_NombreModulo_Test_Audios_Respuestas(UActivityTest test, UActivityTestAudio testAudio, UActivityTestRespuesta testResúesta)
		{
			//valida cuando no existen audios en el test 
			if(testAudio == null)
			{
				testAudio = new UActivityTestAudio();

                testAudio.Id = 0;
				testAudio.AudioA = "";
				testAudio.AudioB = "";
				testAudio.AudioC = "";

            }
            return new Actividad().postActualizar_NombreModulo_Test_Audios_Respuestas(test, testAudio, testResúesta);
        }

    }
}
