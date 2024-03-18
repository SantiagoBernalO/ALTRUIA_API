using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;


namespace Utilitarios
{
	[Table("tp_actividad", Schema = "actividades")]
	public class UTipoActividad
	{
		private int id_tp_actividad;
		private string actividadNombre;
		private string descipcion;

		[Key]
		[Column("tp_actividad_id")]
		public int Id_tp_actividad { get => id_tp_actividad; set => id_tp_actividad = value; }
		[Column("actividad")]
		public string ActividadNombre { get => actividadNombre; set => actividadNombre = value; }
        [Column("descripcion")]
        public string Descripcion { get => descipcion; set => descipcion = value; }
    }
}
