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
	[Table("estudiante", Schema ="usuarios")]
	public class UEstudiante
	{
		private int id;
		private String nombre;
		private String apellido;
		private String documento;
		private DateTime fechaNacimiento;
        private string codigoEnlace;
		private int idUsuario;


        [Key]
		[Column("id")]
		public int Id { get => id; set => id = value; }
		[Column("nombre")]
		public string Nombre { get => nombre; set => nombre = value; }
		[Column("apellido")]
		public string Apellido { get => apellido; set => apellido = value; }
		[Column("documento")]
		public string Documento { get => documento; set => documento = value; }
        [Column("fechaNacimiento")]
        public DateTime FechaNacimiento { get => fechaNacimiento; set => fechaNacimiento = value; }
        [Column("codigoEnlace")]
        public string CodigoEnlace { get => codigoEnlace; set => codigoEnlace = value; }
        [Column("idUsuario")]
        public int IdUsuario { get => idUsuario; set => idUsuario = value; }


    }
}
