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
	[Table("asistente", Schema = "usuarios")]
	public class UAsistente
	{

		private int id;
		private string nombre;
		private string apellido;
        private string nit;
        private int idUsuario;


        [Key]
		[Column("id")]
		public int Id { get => id; set => id = value; }
		[Column("nombre")]
		public string Nombre { get => nombre; set => nombre = value; }
		[Column("apellido")]
		public string Apellido { get => apellido; set => apellido = value; }
		[Column("nit")]
		public string Nit { get => nit; set => nit = value; }
        [Column("idUsuario")]
        public int IdUsuario { get => idUsuario; set => idUsuario = value; }
    }
}
