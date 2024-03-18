using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class UActivity
    {
        private int id;
        private string nombre;
        private string imagen;
        private string rutaAcceso;
        private string origenId;

        public int Id { get => id; set => id = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string Imagen { get => imagen; set => imagen = value; }
        public string RutaAcceso { get => rutaAcceso; set => rutaAcceso = value; }
        public string OrigenId { get => origenId; set => origenId = value; }
    }

    public class UModulo
    {
        private int id;
        private int idActividad;
        private string nombre;
        private string origenId;
        private bool estado;
        private string estudianteId;

        public int Id { get => id; set => id = value; }
        public int IdActividad { get => idActividad; set => idActividad = value; }
        public string Nombre { get => nombre; set => nombre = value; }
        public string OrigenId { get => origenId; set => origenId = value; }
        public bool Estado { get => estado; set => estado = value; }
        public string EstudianteId { get => estudianteId; set => estudianteId = value; }
    }

    public class UActivityTest
    {
        private int id;
        private int idActividad;
        private int idModulo;
        private string nombreModulo;
        private string imagen;
        private string video;
        private string pregunta;
        private int? idAudios;
        private int idOpcionesRespuesta;

        public int Id { get => id; set => id = value; }
        public int IdActividad { get => idActividad; set => idActividad = value; }
        public int IdModulo { get => idModulo; set => idModulo = value; }
        public string NombreModulo { get => nombreModulo; set => nombreModulo = value; }
        public string Imagen { get => imagen; set => imagen = value; }
        public string Video { get => video; set => video = value; }
        public string Pregunta { get => pregunta; set => pregunta = value; }
        public int? IdAudios { get => idAudios; set => idAudios = value; }
        public int IdOpcionesRespuesta { get => idOpcionesRespuesta; set => idOpcionesRespuesta = value; }
    }

    public class UActivityTestAudio
    {
        private int id;
        private int idTest;
        private string audioA;
        private string audioB;
        private string audioC;

        public int Id { get => id; set => id = value; }
        public int IdTest { get => idTest; set => idTest = value; }
        public string AudioA { get => audioA; set => audioA = value; }
        public string AudioB { get => audioB; set => audioB = value; }
        public string AudioC { get => audioC; set => audioC = value; }
    }

    public class UActivityTestRespuesta
    {
        private int id;
        private int idTest;
        private string respuestaA;
        private string respuestaB;
        private string respuestaC;
        private string correcta;

        public int Id { get => id; set => id = value; }
        public int IdTest { get => idTest; set => idTest = value; }
        public string RespuestaA { get => respuestaA; set => respuestaA = value; }
        public string RespuestaB { get => respuestaB; set => respuestaB = value; }
        public string RespuestaC { get => respuestaC; set => respuestaC = value; }
        public string Correcta { get => correcta; set => correcta = value; }

    }

    public class UActivityTestBody
    {
        private UActivityTest test;
        private UActivityTestAudio testAudio;
        private UActivityTestRespuesta testRespuesta;

        public UActivityTest Test { get => test; set => test = value; }
        public UActivityTestAudio TestAudio { get => testAudio; set => testAudio = value; }
        public UActivityTestRespuesta TestRespuesta { get => testRespuesta; set => testRespuesta = value; }
    }

}
