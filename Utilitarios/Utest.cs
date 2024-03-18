using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    [Serializable]
    [Table("testt", Schema = "dbo")]
    public class Utest
    {
        private int id;
        private int numero;

        [Column("id")]
        public int Id { get => id; set => id = value; }
        [Column("numero")]
        public int Inumerod { get => numero; set => numero = value; }

    }
}
