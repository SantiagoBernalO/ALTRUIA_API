using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;
using Utilitarios;
using static System.Net.Mime.MediaTypeNames;

public class Mapping : DbContext
{
	public Mapping() : base("name=Conexion")
	{

	}
	public DbSet<UUser> user { get; set; }
    public DbSet<UAsistente> asistente { get; set; }
	public DbSet<UDocente> docente { get; set; }
	public DbSet<UEstudiante> estudiante { get; set; }
    public DbSet<URol> rol { get; set; }
	public DbSet<UVariableParametrica> variableParametrica { get; set; }
    public DbSet<UEnlace> enlace { get; set; }

    /*token */
    public DbSet<TokenLogin> tokenLogin { get; set; }

	/*token compra*/
	public DbSet<UTokenSeguridad> token_compra { get; set; }

	/*actividad*/
	public DbSet<UActividad> actividad { get; set; }
	public DbSet<UEvaluacionInicial> actividadEvaluacionInicial { get; set; }
	public DbSet<UEstado_actividad> uEstado_Actividad { get; set; }
	public DbSet<UResultadoEvaluacionInicial> resultadoActividadEvaluacionInicial{ get; set; }

	/*actividad PECS*/
	public DbSet<UActividadPecsCategorias> uActividadPecsCategorias { get; set; }
	public DbSet<UActividadPecs> uActividadPecs { get; set; }

	/*db test*/
	public DbSet<Utest> utest { get; set; }


    //Método para consumir el procedimiento almacenado
    public async Task<List<string>> correoAsistente(UUser user)
    {
        // Lógica para ejecutar el procedimiento almacenado y mapear los resultados
        using (var db = new Mapping())
        {
            return await db.Database.SqlQuery<string>("datosRepresentante @p0", user.Documento).ToListAsync();
        }
    }


    //Método para consumir el procedimiento almacenado
    public void guardarTokenRecuperacion(UTokenRecuperacion tokenRecuperacion)
    {
        // Lógica para ejecutar el procedimiento almacenado y mapear los resultados
        using (var db = new Mapping())
        {
            int num = db.Database.SqlQuery<int>("GuardarTokenRecuperacion @p0, @p1, @p2, @p3", tokenRecuperacion.Token, tokenRecuperacion.DocumentoUsuario, tokenRecuperacion.Correo, tokenRecuperacion.TiempoLimite).FirstOrDefault();
            num = num;
        }
    }

    //Método para consumir el procedimiento almacenado
    public string validarTokenRecuperacion(string token, string tiempoActual)
    {
        // Lógica para ejecutar el procedimiento almacenado y mapear los resultados
        using (var db = new Mapping())
        {
            return db.Database.SqlQuery<string>("ValidarTokenRecuperacion @p0, @p1", token, tiempoActual).FirstOrDefault();
        }
    }

    // Método para consumir el procedimiento almacenado
    public string actualizarCredenciales(UUser usuario)
    {
        // Lógica para ejecutar el procedimiento almacenado y mapear los resultados
        using (var db = new Mapping())
        {
            return db.Database.SqlQuery<string>("ActualizarCredenciales @p0, @p1", usuario.Documento, usuario.Clave).FirstOrDefault();
        }
    }

    // Método para consumir el procedimiento almacenado
    public async Task<string> ObtenerDatosUsuarioSegunCorreo(string correo)
    {
        // Lógica para ejecutar el procedimiento almacenado y mapear los resultados
        using (var db = new Mapping())
        {
            return await db.Database.SqlQuery<string>("ObtenerDatosUsuarioSegunCorreo @p0", correo).FirstOrDefaultAsync();
        }
    }

    // Método para consumir el procedimiento almacenado
    public async Task<List<UEstudiante>> ObtenerEstudiantesEnlazados(UUser usuario)
    {
        var test = new List<UEstudiante>();
        //var test2 = "";


        // Lógica para ejecutar el procedimiento almacenado y mapear los resultados
        using (var db = new Mapping())
        {
            test = await db.Database.SqlQuery<UEstudiante>("ObtenerEstudiantesEnlazados @p0", usuario.Id).ToListAsync();

            //test2 = db.Database.SqlQuery<string>("ObtenerActividades @p0, @p1", documentoEstudiante, documentoUsuario).FirstOrDefault();
        }

        return test;
    }

    // Método para consumir el procedimiento almacenado
    public async Task<string> EnlazarEstudiante(string documentoEstudiante, int idUsuario)
    {
        string test = "";
        //var test2 = "";


        // Lógica para ejecutar el procedimiento almacenado y mapear los resultados
        using (var db = new Mapping())
        {
            test = await db.Database.SqlQuery<string>("EnlazarEstudiante @p0, @p1", documentoEstudiante, idUsuario).FirstOrDefaultAsync();

            //test2 = db.Database.SqlQuery<string>("ObtenerActividades @p0, @p1", documentoEstudiante, documentoUsuario).FirstOrDefault();
        }

        return test;
    }

    // Método para consumir el procedimiento almacenado
    public async Task<string> DehabilitarEnlaceEstudiante(string documentoEstudiante, int idUsuario)
    {
        string test = "";
        //var test2 = "";


        // Lógica para ejecutar el procedimiento almacenado y mapear los resultados
        using (var db = new Mapping())
        {
            test = await db.Database.SqlQuery<string>("DehabilitarEnlaceEstudiante @p0, @p1", documentoEstudiante, idUsuario).FirstOrDefaultAsync();

            //test2 = db.Database.SqlQuery<string>("ObtenerActividades @p0, @p1", documentoEstudiante, documentoUsuario).FirstOrDefault();
        }

        return test;
    }


    // Método para consumir el procedimiento almacenado
    public List<UActivity> ObtenerActividades(UUser usuario)
	{
		var test = new List<UActivity>();
		//var test2 = "";


        // Lógica para ejecutar el procedimiento almacenado y mapear los resultados
        using (var db = new Mapping())
        {
            test = db.Database.SqlQuery<UActivity>("ObtenerActividades @p0, @p1", usuario.Id, usuario.Id_rol).ToList();

            //test2 = db.Database.SqlQuery<string>("ObtenerActividades @p0, @p1", documentoEstudiante, documentoUsuario).FirstOrDefault();
        }

        return test;
    }

    // Método para consumir el procedimiento almacenado
    public List<UModulo> ObtenerModulos(string documentoEstudiante, int actividadSeleccionadaId)
    {
        var test = new List<UModulo>();
        //var test2 = "";


        // Lógica para ejecutar el procedimiento almacenado y mapear los resultados
        using (var db = new Mapping())
        {
            test = db.Database.SqlQuery<UModulo>("ObtenerModulos @p0, @p1", documentoEstudiante, actividadSeleccionadaId).ToList();

            //test2 = db.Database.SqlQuery<string>("ObtenerActividades @p0, @p1", documentoEstudiante, documentoUsuario).FirstOrDefault();
        }

        return test;
    }

    // Método para consumir el procedimiento almacenado
    public UActivityTest ObtenerTestIndividual(int idActividad, int idModulo)
    {
        var test = new UActivityTest();
        //var test2 = "";


        // Lógica para ejecutar el procedimiento almacenado y mapear los resultados
        using (var db = new Mapping())
        {
            test = db.Database.SqlQuery<UActivityTest>("ObtenerTestIndividual @p0, @p1", idActividad, idModulo).FirstOrDefault();

            //test2 = db.Database.SqlQuery<string>("ObtenerActividades @p0, @p1", documentoEstudiante, documentoUsuario).FirstOrDefault();
        }

        return test;
    }

    // Método para consumir el procedimiento almacenado
    public UActivityTestAudio ObtenerTestIndividualAudios(int idTest)
    {
        var test = new UActivityTestAudio();
        //var test2 = "";


        // Lógica para ejecutar el procedimiento almacenado y mapear los resultados
        using (var db = new Mapping())
        {
            test = db.Database.SqlQuery<UActivityTestAudio>("ObtenerTestIndividualAudios @p0", idTest).FirstOrDefault();

            //test2 = db.Database.SqlQuery<string>("ObtenerActividades @p0, @p1", documentoEstudiante, documentoUsuario).FirstOrDefault();
        }

        return test;
    }

    // Método para consumir el procedimiento almacenado
    public UActivityTestRespuesta ObtenerTestIndividualRespuestas(int idTest)
    {
        var test = new UActivityTestRespuesta();
        //var test2 = "";


        // Lógica para ejecutar el procedimiento almacenado y mapear los resultados
        using (var db = new Mapping())
        {
            test = db.Database.SqlQuery<UActivityTestRespuesta>("ObtenerTestIndividualRespuestas @p0", idTest).FirstOrDefault();

            //test2 = db.Database.SqlQuery<string>("ObtenerActividades @p0, @p1", documentoEstudiante, documentoUsuario).FirstOrDefault();
        }

        return test;
    }

    // Método para consumir el procedimiento almacenado
    public string ActualizarNombreModuloTestAudiosRespuestas(UActivityTest test, UActivityTestAudio testAudio, UActivityTestRespuesta testRespuesta)
    {
        var respuesta = "";


        // Lógica para ejecutar el procedimiento almacenado y mapear los resultados
        using (var db = new Mapping())
        {
            respuesta = db.Database.SqlQuery<string>(
                "ActualizarNombreModuloTestAudiosRespuestas @p0,@p1,@p2,@p3,@p4,@p5,@p6,@p7,@p8 ,@p9,@p10,@p11,@p12,@p13, @p14,@p15,@p16,@p17,@p18,@p19",
                test.Id,
                test.IdActividad,
                test.IdModulo,
                test.NombreModulo,
                test.Imagen,
                test.Video,
                test.Pregunta,
                test.IdAudios,
                test.IdOpcionesRespuesta,

                testAudio.Id,
                testAudio.IdTest,
                testAudio.AudioA,
                testAudio.AudioB,
                testAudio.AudioC,

                testRespuesta.Id,
                testRespuesta.IdTest,
                testRespuesta.RespuestaA,
                testRespuesta.RespuestaB,
                testRespuesta.RespuestaC,
                testRespuesta.Correcta


                ).FirstOrDefault();

        }

        return respuesta;
    }
}