using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Net.Sockets;
using System.IO;

namespace Hire_Me.Classes
{
    enum KeyWrd
    {
        Code
    }
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
        public bool CheckEmail(string to, string msgCreate, int keyWrd)
        {
            string from = "king86370@gmail.com"; //From address
            if (IsValidEmail(to) == true)
            {
                //nslookup -type=MX gmail.com
                //TcpClient tClient = new TcpClient("mail.parktons.com", 10);
                MailMessage message = new MailMessage(from, to);
                string mailbody = "<h1>In this article you will learn how to send a email using Asp.Net & C#</h1>";
                   //"<a href='https://localhost:44316/Home/SignIn.aspx?id=5'>llll</a>"
                message.Subject = msgCreate;
                if (keyWrd == 1)
                {
                    code = random.Next(123123, 999999);
                    message.Body = mailbody + "\n the code " + code;
                }
                else
                {
                    message.Body = mailbody;
                }
                message.BodyEncoding = Encoding.UTF8;
                message.IsBodyHtml = true;
                SmtpClient client = new SmtpClient("smtp.gmail.com", 587); //Gmail smtp    
                NetworkCredential basicCredential1 = new
                NetworkCredential("king86370@gmail.com", "hcctilztojhzzpgn");
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
        public bool Existing_data(string str, string field, string table)
        {
            int zero = 0;
            if (field == "PHONE")
            {
                    for (int i = 0; i < str.Length; i++)
                    {
                        if (str[i] == '0')
                        {
                            zero++;
                        }
                    }
                if (zero > 5)
                {
                    msg = "Error There are many zero";
                    return true;
                }
                else
                {
                    try
                    {
                        if (str[0] == '0' && str[1] == '9' || str[0] == '0' && str[1] == '1' && str[2] == '1')
                        {
                            goto Complete;
                        }
                        else
                        {
                            msg = "It must contain the phone number '09 or 011'";
                            return true;
                        }
                    }
                    catch
                    {
                        msg = "Try It must contain the phone number '09 or 011'";
                        return true;
                    }
                }
            }
            else if(field == "EMAIL")
            {
                for (var i = 0; i < str.Length; i++)
                {
                    if (str[i] == '@')
                    {
                        try
                        {
                            if (str[i + 1] == 'g' && str[i + 2] == 'm'
                            && str[i + 3] == 'a' && str[i + 4] == 'i' && str[i + 5] == 'l'
                            && str[i + 6] == '.' && str[i + 7] == 'c' && str[i + 8] == 'o'
                            && str[i + 9] == 'm')
                            {
                                goto Complete;
                            }
                            else
                            {
                                msg = "must contain @gmail.com only";
                                return true;
                            }
                        }
                        catch
                        {
                            msg = "Error must contain @gmail.com only";
                            return true;
                        }
                    }
                }  
            }
            Complete:
            Read_Data(field, table);
            string f;
            while (dataReader.Read())
            {
                f = (string)dataReader[field];
                if (str == f)
                {
                    msg = "Pre-existing";
                    return true;
                }
            }
            return false;
        }
    }
}
