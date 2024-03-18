using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utilitarios;

namespace Datos
{
    public class Seguridad : Mapping
    {
        public UsersLogin UsersLogin
        {
            get => default(UsersLogin);
            set
            {
            }
        }

        public TokenLogin obtenerTokenActual(TokenLogin token)
        {
            TokenLogin tokenActual = new Mapping().tokenLogin.Where(x => (x.DocumentoUsuario.Equals(token.DocumentoUsuario))).FirstOrDefault();
            return tokenActual;
        } 

        public void actualizarTokenLogin(TokenLogin tokenActual, TokenLogin tokenNuevo)
        {
            using (var db = new Mapping())
            {
                var enty = db.Entry(tokenActual);
                //actualiza el elemento
                enty.Property(x => x.Token).CurrentValue = tokenNuevo.Token;
                enty.Property(x=>x.FechaGenerado).CurrentValue = tokenNuevo.FechaGenerado;
                enty.Property(x => x.FechaVigencia).CurrentValue = tokenNuevo.FechaVigencia;

                enty.State = EntityState.Modified;
                db.SaveChanges();
            }
        }

        public void guardarTokenLogin(TokenLogin token)
        {
            using (var db = new Mapping())
            {
                db.tokenLogin.Add(token);
                db.SaveChanges();
            }
        }

    }
}
