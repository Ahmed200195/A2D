using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace Hire_Me.Classes
{
    enum KeyWrd
    {
        idNum, Name, Avg, Phone, Email, Pswrd
    }
    class BasicHireMe : Access_DataBase
    {
        private string msg;
        private int code;
        public string Msg { get => msg; set => msg = value; }
        public int Code { get => code; set => code = value; }
        Random random = new Random();

        //Email
        public bool CheckEmail(string to, string msgCreate)
        {
            string from = "king86370@gmail.com"; //From address    
            MailMessage message = new MailMessage(from, to);
            code = random.Next(123123, 999999);
            
            string mailbody = "In this article you will learn how to send a email using Asp.Net & C#";
            message.Subject = msgCreate;
            message.Body = mailbody + "\n the code " + code;
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
        //Validation
        public bool CheckTop(string txt, KeyWrd key)
        {
            if (string.IsNullOrEmpty(txt))
            {
                msg = "Input value is empty...";
                return true;
            }
            else
            {
                return Check(txt, key);
            }
        }
        private bool Check(string str, KeyWrd key)
        {
            for (int i = 0; i < str.Length; i++)
            {
                if (str[i] == '/' || str[i] == ',' || str[i] == '>'|| str[i] == '<' 
                || str[i] == '*' || str[i] == '+' || str[i] == '-' || str[i] == '=' 
                || str[i] == '_')
                {
                    msg = "Additional codes cannot be entered ...";
                    return true;
                }
                if(key == KeyWrd.Name || key == KeyWrd.Phone 
                || key == KeyWrd.Pswrd)
                {
                    if(str[i] == '.')
                    {
                        msg = "Additional codes cannot be entered ...";
                        return true;
                    }
                }
            }
            if(key == KeyWrd.Name)
            {
                return NoNum(str);
            }
            else if(key == KeyWrd.idNum || key == KeyWrd.Phone || key == KeyWrd.Avg)
            {
                return NoStr(str, key);
            }
            else if (key == KeyWrd.Email)
            {
                int at = 0;
                for (int i = 0; i < str.Length; i++)
                {
                    if(str[i] == '@')
                    {
                        at++;
                    }
                }
                if(at == 1)
                {
                    for (var i = 0; i < str.Length; i++)
                    {
                        if(str[i] == '@')
                        {
                            try
                            {
                                if (str[i] == '@' && str[i + 1] == 'g' && str[i + 2] == 'm'
                                && str[i + 3] == 'a' && str[i + 4] == 'i' && str[i + 5] == 'l'
                                && str[i + 6] == '.' && str[i + 7] == 'c' && str[i + 8] == 'o'
                                && str[i + 9] == 'm')
                                {
                                    Read_Data("EMAIL", "EMAILPHONE");
                                    string field = "";
                                    while (dataReader.Read())
                                    {
                                        field = (string)dataReader["EMAIL"];
                                        if (str == field)
                                        {
                                            msg = "Pre-existing Email";
                                            return true;
                                        }
                                    }
                                    return false;
                                }
                                else
                                {
                                    msg = "must contain @gmail.com only";
                                    return true;
                                }
                            }
                            catch
                            {
                                msg = "must contain @gmail.com only";
                                return true;
                            }
                        }
                    }
                }
                else
                {
                    return true;
                }
            }
            return false;
        }
        private bool NoNum(string str)
        {
            for (int i = 0; i < str.Length; i++)
            {
                if (str[i] >= '1' && str[i] <= '9' || str[i] == '0')
                {
                    msg = "Name cannot contain numbers";
                    return true;
                }
            }
            return false;
        }
        private bool NoStr(string str, KeyWrd key)
        {
            int zero = 0;
            for (int i = 0; i < str.Length; i++)
            {
                if(str[i] >= 'A' && str[i] <= 'Z' || str[i] >= 'a' && str[i] <= 'z')
                {
                    msg = "It cannot contain letters ...";
                    return true;
                }
            }
            if (key == KeyWrd.Avg)
            {
                if (double.Parse(str) < 0 || double.Parse(str) > 100)
                {
                    msg = "Average between 1 and 100 only";
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else if (key == KeyWrd.idNum || key == KeyWrd.Phone) 
            {
                if(str.Length == 10)
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
                        if(key == KeyWrd.idNum)
                        {
                            Read_Data("GRADUATE_ID_NUMBER", "GRADUATE");
                            string field = "";
                            while (dataReader.Read())
                            {
                                field = (string)dataReader["GRADUATE_ID_NUMBER"];
                                if (str == field)
                                {
                                    msg = "Pre-existing number";
                                    return true;
                                }
                            }
                            return false;
                        }
                        if(key == KeyWrd.Phone && ((str[0].Equals('0') && str[1].Equals('9')) || (str[0].Equals('0') && str[1].Equals('1') && str[2].Equals('1'))))
                        {
                            Read_Data("PHONE", "EMAILPHONE");
                            string field = "";
                            while (dataReader.Read())
                            {
                                field = (string)dataReader["PHONE"];
                                if (str == field)
                                {
                                    msg = "Pre-existing number";
                                    return true;
                                }
                            }
                            return false;
                        }
                        else
                        {
                            msg = "It must contain the phone number '09 or 011'";
                            return true;
                        }
                    }
                }
                else
                {
                    msg = "The name must contain 10 characters only";
                    return true;
                }
            }
            return false;
        }
    }
}
