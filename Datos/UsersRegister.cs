using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using Utilitarios;

namespace Datos
{
	public class UsersRegister
	{
		public UsersLogin UsersLogin
		{
			get => default(UsersLogin);
			set
			{
			}
		}

		public void agregarUsuario(UUser nuevoUsuario)
		{
			/*en registro el usuario sera el num de documento, luego se puede modificar*/
			using (var db = new Mapping())
			{
				db.user.Add(nuevoUsuario);
				db.SaveChanges();
			}
		}


		public void agregarAsistente(UAsistente nuevoAsistente)
		{
			using (var db = new Mapping())
			{
				db.asistente.Add(nuevoAsistente);
				db.SaveChanges();
			}
		}
		public void agregarDocente(UDocente nuevoDocente)
		{
			using (var db = new Mapping())
			{
				db.docente.Add(nuevoDocente);
				db.SaveChanges();
			}
		}

		public void agregarEstudiante(UEstudiante nuevoPaciente)
		{
			using (var db = new Mapping())
			{
				db.estudiante.Add(nuevoPaciente);
				db.SaveChanges();
			}
		}

        public async Task<List<URol>> obtenerRol(string idRol)
        {
            List<URol> rol = new List<URol>();
            rol = await new Mapping().rol.ToListAsync();
            return rol;
        }

    }
}