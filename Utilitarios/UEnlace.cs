using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{

    [Serializable]
    [Table("enlace", Schema = "dbo")]
    public class UEnlace
    {
        private int id;
        private string documentoEstudiante;
        private bool estado;
        private int idUsuario;

        [Key]
        [Column("id")]
        public int Id { get => id; set => id = value; }
        [Column("documentoEstudiante")]
        public string DocumentoEstudiante { get => documentoEstudiante; set => documentoEstudiante = value; }
        [Column("estado")]
        public bool Estado { get => estado; set => estado = value; }
        [Column("idUsuario")]
        public int IdUsuario { get => idUsuario; set => idUsuario = value; }

    }
}
