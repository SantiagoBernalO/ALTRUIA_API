using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    [Table("tokenLogin", Schema = "security")]
    public class UTokenSeguridadLogin
    {
        private int id;
        private string token;
        private string documentoUsuario;
        private DateTime fechaGenerado;
        private DateTime fechaVigencia;

        [Key]
        [Column("id")]
        public int Id { get => id; set => id = value; }
        [Column("token")]
        public string Token { get => token; set => token = value; }
        [Column("documentoUsuario")]
        public string DocumentoUsuario { get => documentoUsuario; set => documentoUsuario = value; }
        [Column("fechaGenerado")]
        public DateTime FechaGenerado { get => fechaGenerado; set => fechaGenerado = value; }
        [Column("fechaVigencia")]
        public DateTime FechaVigencia { get => fechaVigencia; set => fechaVigencia = value; }
    }

    [Table("token_login_aplicacion", Schema = "security")]
    public class UTokenSeguridad
    {
        private int id;
        private DateTime fecha_generado;
        private DateTime fecha_vigencia;
        private string token;
        private string user_id;

        [Key]
        [Column("id")]
        public int Id { get => id; set => id = value; }
        [Column("fecha_generado")]
        public DateTime Fecha_generado { get => fecha_generado; set => fecha_generado = value; }
        [Column("fecha_vigencia")]
        public DateTime Fecha_vigencia { get => fecha_vigencia; set => fecha_vigencia = value; }
        [Column("token")]
        public string Token { get => token; set => token = value; }
        [Column("user_id")]
        public string User_id { get => user_id; set => user_id = value; }
    }
}
