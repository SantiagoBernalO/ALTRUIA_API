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
    [Table("variableParametrica", Schema = "dbo")]
    public class UVariableParametrica
    {
        private int id;
        private string clave;
        private string valor;

        [Key]
        [Column("id")]
        public int Id { get => id; set => id = value; }
        [Column("clave")]
        public string Clave { get => clave; set => clave = value; }
        [Column("valor")]
        public string Valor { get => valor; set => valor = value; }
    }
}
