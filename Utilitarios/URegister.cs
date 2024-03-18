using Newtonsoft.Json.Linq;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace Utilitarios
{
    public class URegister
	{
		private UUser uusuarioLogin;
		private object usuario;

        public UUser UusuarioLogin { get => uusuarioLogin; set => uusuarioLogin = value; }
        public object Usuario { get => usuario; set => usuario = value; }
    }
}