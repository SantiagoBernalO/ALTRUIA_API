using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Utilitarios
{
    public class Wraper
    {
        private string mensaje;
        private UUser wraperUsuario;
        private string token;

        public string Mensaje { get => mensaje; set => mensaje = value; }
        public UUser WraperUsuario { get => wraperUsuario; set => wraperUsuario = value; }

        public string Token { get => token; set => token = value; }
    }

    public class AuthResponse
    {
        private string mensaje;
        private UUser usuario;
        private string token;

        public string Mensaje { get => mensaje; set => mensaje = value; }
        public UUser Usuario { get => usuario; set => usuario = value; }
        public string Token { get => token; set => token = value; }
    }

    public class RegistroResponse
    {
        private string mensaje;
        private bool validacionExistenciaUsuario;
        private object usuario;

        public string Mensaje { get => mensaje; set => mensaje = value; }
        public bool ValidacionExistenciaUsuario { get => validacionExistenciaUsuario; set => validacionExistenciaUsuario = value; }
        public object Usuario { get => usuario; set => usuario = value; }

    }

    public class UsuarioResponse
    {
        private string mensaje;
        private object usuario;

        public string Mensaje { get => mensaje; set => mensaje = value; }
        public object Usuario { get => usuario; set => usuario = value; }

    }

    public class ActividadResponse
    {
        private string mensaje;
        private Object actividad;

        public string Mensaje { get => mensaje; set => mensaje = value; }
        public Object Actividad { get => actividad; set => actividad = value; }

    }
}
