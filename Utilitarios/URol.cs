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
    [Table("rol", Schema = "usuarios")]
    public class URol
    {
        private int id;
        private string rol;


        [Key]
        [Column("id")]
        public int Id { get => id; set => id = value; }
        [Column("rol")]
        public string Rol { get => rol; set => rol = value; }
    }
}
