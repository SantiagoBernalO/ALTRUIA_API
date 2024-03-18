using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net.Mail;

namespace Utilitarios
{
    public class Mail
    {
        public bool enviarMailRecuperacionPassword(UTokenRecuperacion tokenRecuperacion, string nombre, UVariableParametrica rutaRecuperacion)
        {
            try
            {
                //mail
                MailMessage mail = new MailMessage();
                SmtpClient SmtpSever = new SmtpClient("smtp.gmail.com", 587);//servidor gmail

                string linkAcceso = rutaRecuperacion.Valor+'/'+tokenRecuperacion.Token;

                mail.From = new MailAddress("autiweb.aplicacion@gmail.com", "Reestablecer contraseña");
                mail.Subject = "Reestablecer contraseña";//asunto
                mail.Body = "Hola " + nombre + ", para recuperar su contraseña debe ingresar al siguiente Link:\n Su link de acceso es: " + linkAcceso;
                mail.To.Add(tokenRecuperacion.Correo);//destino del correo

                //Configuracion del SMTP
                SmtpSever.Port = 587;
                SmtpSever.UseDefaultCredentials = false;
                SmtpSever.Credentials = new System.Net.NetworkCredential("autiweb.aplicacion@gmail.com", "iacp tqqd tgqw cepk");//correo origen, contra*
                SmtpSever.EnableSsl = true;
                SmtpSever.Send(mail);//eviar
                return true;

            }
            catch (Exception e)
            {
                return false;
            }
        }
    }
}
