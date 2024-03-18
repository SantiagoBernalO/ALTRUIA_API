using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class UTokenRecuperacion
    {
        private int id;
        private string token;
        private string documentoUsuario;
        private string correo;
        private DateTime tiempoLimite;

        public int Id { get => id; set => id = value; }
        public string Token { get => token; set => token = value; }
        public string DocumentoUsuario { get => documentoUsuario; set => documentoUsuario = value; }
        public string Correo { get => correo; set => correo = value; }
        public DateTime TiempoLimite { get => tiempoLimite; set => tiempoLimite = value; }

    }
}
