using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Utilitarios
{
	[Serializable]
	[Table("docente", Schema ="usuarios")]
	public class UDocente
	{
		private int id;
		private String nombre;
		private String apellido;
        private String documento;
        private String nit_empresa;
		private String correo;
		private string clave;

		[Key]
		[Column("id")]
		public int Id { get => id; set => id = value; }
		[Column("nombre")]
		public string Nombre { get => nombre; set => nombre = value; }
		[Column("apellido")]
		public string Apellido { get => apellido; set => apellido = value; }
        [Column("documento")]
        public string Documento { get => documento; set => documento = value; }
        [Column("nit_empresa")]
		public string Nit_empresa { get => nit_empresa; set => nit_empresa = value; }
		[Column("correo")]
		public string Correo { get => correo; set => correo = value; }

		[NotMapped]
        public string Clave { get => clave; set => clave = value; }

    }
}
