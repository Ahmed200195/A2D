using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Data;
using System.Net.Sockets;
using System.IO;

namespace Hire_Me.Classes
{
    class BasicHireMe : Access_DataBase
    {
        private string msg;
        private int code;
        public string Msg { get => msg; set => msg = value; }
        public int Code { get => code; set => code = value; }
        Random random = new Random();
        //public static Regex IntegerString => new(@"^[\s\da-zA-Zء-ي]+[^\.]*$");
        //public static Regex String => new(@"^[\sa-zA-Zء-ي]*$");
        //public static Regex Email => new(@"^[\d\@\.a-z]*$");
        //public static Regex Phone => new(@"^[\d\s\(\)\-\+]+[^\.]*$");
        //public static Regex Address => new(@"^[\s\d\.\,\،\-a-zA-Zء-ي]*$");
        //public static Regex Integer => new(@"^[\d]+[^\.]*$");
        //public static Regex Double => new(@"^[\d\.]*$");

        //Ecodeing
        private static string encoding(string txt, int key)
        {
            char[] chr = txt.ToCharArray();
            char letter;
            for (int i = 0; i < chr.Length; i++)
            {
                letter = chr[i];
                letter = (char)(letter + key);
                chr[i] = letter;
            }
            return new string(chr);
        }
        public string Encrypt(string txt, int key)
        {
            return encoding(txt, key);
        }

        public string Decrypt(string txt, int key)
        {
            return encoding(txt, -key);
        }
        //Email
        public bool CheckEmail(string to, string mailbody, string msgCreate, int keyWrd)
        {
            string from = "king86370@gmail.com"; //From address
            if (IsValidEmail(to) == true)
            {
                MailMessage message = new MailMessage(from, to);
                //"<a href='https://localhost:44316/Home/SignIn.aspx?id=5'>llll</a>"
                message.Subject = msgCreate;
                if (keyWrd == 1)
                {
                    code = random.Next(123123, 999999);
                    message.Body = mailbody + "\n the code (" + code + ")";
                }
                else
                {
                    message.Body = mailbody;
                }
                message.BodyEncoding = Encoding.UTF8;
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
                NetworkCredential basicCredential1 = new
                NetworkCredential("king86370@gmail.com", "cbklxocbyvoinyct");
                client.EnableSsl = true;
                client.UseDefaultCredentials = false;
                client.Credentials = basicCredential1;
                try
                {
                    client.Send(message);
                    return true;
                }

                catch
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }
        //Validation
        bool IsValidEmail(string email)
        {
            var trimmedEmail = email.Trim();

            if (trimmedEmail.EndsWith("."))
            {
                return false; // suggested by @TK-421
            }
            try
            {
                var addr = new MailAddress(email);
                return addr.Address == trimmedEmail;
            }
            catch
            {
                return false;
            }
        }

        //Get Vacancy For Graduate
        public DataTable Get_Vac(string splz, float avg)
        {
            Access_DataBase access = new Access_DataBase();
            return access.SelectData("SELECT FULLID, FULLNAME FROM VIEW_ALL_DESIRE WHERE VACANCY_AVG <= " + avg + " AND VACANCY_NAME = '" + splz + "' ORDER BY 2");
        }

        //Graduate Sorting
        //public DataTable GraduateSorting()
        //{
            
        //}
    }
}
