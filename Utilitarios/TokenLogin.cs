using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
 
        [Serializable]//permite que se tenga relacion en cadena (volver objeto)
        [Table("tokenLogin", Schema = "security")]
        public class TokenLogin
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
    
}
