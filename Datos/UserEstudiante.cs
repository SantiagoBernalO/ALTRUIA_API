using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using Utilitarios;

namespace Datos
{
    public class UserEstudiante : Mapping
    {

        public async Task<List<UEstudiante>> obtenerEstudiantesEnlazados(UUser usuario)
        {
            using (var db = new Mapping())
            {
                return await db.ObtenerEstudiantesEnlazados(usuario);
            }
        }

        public async Task<UEstudiante> validarCodigoEnlace(string documentoEstudiante, string codigoEnlacee)
        {
            using (var db = new Mapping())
            {

                return await db.estudiante.Where(x => x.Documento.Equals(documentoEstudiante) && x.CodigoEnlace.Equals(codigoEnlacee)).FirstOrDefaultAsync();

            }
        }

        public async Task<string> elnazarEstudiante(string documentoEstudiante, int idUsuario)
        {
            using (var db = new Mapping())
            {
                return await db.EnlazarEstudiante(documentoEstudiante, idUsuario);
            }
        }

        public async Task<string> dehabilitarEnlaceEstudiante(string documentoEstudiante, int idUsuario)
        {
            using (var db = new Mapping())
            {
                return await db.DehabilitarEnlaceEstudiante(documentoEstudiante, idUsuario);
            }
        }
    }
}