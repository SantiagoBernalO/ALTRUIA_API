using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilitarios;

namespace Datos
{
    public class UsersLogin
    {

        public async Task<UUser> datosUsuario(UUser usuarioE)
        {
            return await new Mapping().user.Where(x => (x.Correo.Equals(usuarioE.Correo))).FirstOrDefaultAsync();
        }
        public async Task<UUser> datosUsuarioDocumento(UUser usuarioE)
        {
            return await new Mapping().user.Where(x => (x.Documento.Equals(usuarioE.Documento))).FirstOrDefaultAsync();
        }

        public async Task<UUser> verificarLogin(UUser usuarioE)
        {
            return await new Mapping().user.Where(x => (x.Correo.Equals(usuarioE.Correo)) && (x.Clave.Equals(usuarioE.Clave))).FirstOrDefaultAsync();
        }

        public async Task<UUser> verificarLoginEstudiante(UUser usuarioE)
        {
            UUser query = new UUser();

            using (var db = new Mapping())
            {
                return await (from user in db.user
                              join enlace in db.enlace on user.Documento equals enlace.DocumentoEstudiante
                              where user.Clave == usuarioE.Clave && user.Documento == usuarioE.Documento
                              select user).FirstOrDefaultAsync();
            }
        }
        /*
        public async Task<List<string>> datosCorreoAsistente(UUser usuarioE)
        {
            return await new Mapping().correoAsistente(usuarioE);
        }*/

        public async Task<UAsistente> datosAsistente(int idUsuario)
        {
            UAsistente acudiente = new UAsistente();
            acudiente = await new Mapping().asistente.Where(x => x.Id.Equals(idUsuario)).FirstOrDefaultAsync();
            return acudiente;
        }

        public async Task<UEstudiante> datosEstudianteSegunDocumento(string cedulaE)
        {
            UEstudiante usuario = new UEstudiante();
            usuario = await new Mapping().estudiante.Where(x => (x.Documento.Equals(cedulaE))).FirstOrDefaultAsync();
            return usuario;
        }
        /*
        public async Task<UDocente> datosDocenteUsuarioSegunDocumento(string cedulaE)
        {
            UDocente usuario = new UDocente();
            usuario = await new Mapping().docente.Where(x => (x.Documento.Equals(cedulaE))).FirstOrDefaultAsync();
            return usuario;
        }*/

        public async Task<UVariableParametrica> rutaRecuperacionPassword()
        {
            UVariableParametrica rutaRecuperacion = await new Mapping().variableParametrica.Where(x => (x.Clave.Equals("rutaRecuperacion"))).FirstOrDefaultAsync();
            return rutaRecuperacion;
        }
        /*
        public async Task<string> datosUsuarioSegunCorreo(string correo)
        {
            //en registro el usuario sera el num de documento, luego se puede modificar
            using (var db = new Mapping())
            {
                return await db.ObtenerDatosUsuarioSegunCorreo(correo);
            }

        }*/

        public async Task<URol> obtenerRol(int idRol)
        {
            URol rol = new URol();
            rol = await new Mapping().rol.Where(x => (x.Id.Equals(idRol))).FirstOrDefaultAsync();
            return rol;
        }

        public void guardarTokenRecuperacion(UTokenRecuperacion tokenrecuperacion)
        {
            /*en registro el usuario sera el num de documento, luego se puede modificar*/
            using (var db = new Mapping())
            {
                db.guardarTokenRecuperacion(tokenrecuperacion);
            }

        }

        public string validarTokenRecuperarClave(string token, string tiempoActual)
		{
			using (var db = new Mapping())
			{
				return db.validarTokenRecuperacion(token, tiempoActual);
            }
		}

        public string actualizarPassword(UUser usuario)
        {
            using (var db = new Mapping())
            {
                return db.actualizarCredenciales(usuario);
            }
        }
    }
}
