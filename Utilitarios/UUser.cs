using Newtonsoft.Json.Linq;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Threading.Tasks;

namespace Utilitarios
{
    [Serializable]
    [Table("usuario", Schema = "usuarios")]
    public class UUser
	{
		private int id;
		private string documento;
        private string clave;
		private int id_rol;
		private string correo;

        public int Id { get => id; set => id = value; }
		public string Documento { get => documento; set => documento = value; }
		public string Clave { get => clave; set => clave = value; }
		public int Id_rol { get => id_rol; set => id_rol = value; }
        public string Correo { get => correo; set => correo = value; }
    }
}