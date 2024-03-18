using Datos;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Utilitarios;

namespace LogicaDeNegocio
{
	public class LEstudiante
	{

        public async Task<List<UEstudiante>> obtenerEstudiantesEnlazados(UUser usuario)
        {
            return await new Datos.UserEstudiante().obtenerEstudiantesEnlazados(usuario);
        }

        public async Task<string> enlazarConEstudiante(string documentoEstudiante, int idUsuario, string codigoEnlacee)
        {

            UEstudiante estudiante = await new Datos.UserEstudiante().validarCodigoEnlace(documentoEstudiante, codigoEnlacee);


            if (estudiante == null)
            {
                return "codigo de enlace incorrecto";
            }else
            {
                return await new Datos.UserEstudiante().elnazarEstudiante(documentoEstudiante, idUsuario);
            }
            
        }

        /*public async Task<string> enlazarEstudianteDirecto(string documentoEstudiante, string documentUsuario)
        {
            UUser usuarioEstudiante = new UUser();
            usuarioEstudiante.Documento = documentoEstudiante; ;
            return await new Datos.UserEstudiante().elnazarEstudiante(usuarioEstudiante, documentUsuario);

        }*/

        public async Task<string> eliminarEnlace(string documentoEstudiante, int idUsuario)
        {
            
            return await new Datos.UserEstudiante().dehabilitarEnlaceEstudiante(documentoEstudiante, idUsuario);
       

        }


    }
}
