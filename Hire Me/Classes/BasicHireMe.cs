using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Hire_Me.Classes
{
    enum KeyWrd
    {
        Name, Avg, Phone, Email, Pswrd
    }
    class BasicHireMe
    {
        
        //Process Encodeing
        public static string Encoding(string txt, int key)
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
        //Encrypt
        public static string Encrypt(string txt, int key)
        {
            return Encoding(txt, key);
        }
        //Decrypt
        public static string Decrypt(string txt, int key)
        {
            return Encoding(txt, -key);
        }
        //Validation
        public bool NotNull(string txt, KeyWrd key)
        {
            if (string.IsNullOrEmpty(txt))
            {
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
                    return true;
                }
                if(key == KeyWrd.Avg || key == KeyWrd.Name || key == KeyWrd.Phone 
                || key == KeyWrd.Pswrd)
                {
                    if(str[i] == '.')
                    {
                        return true;
                    }
                }
            }
            if(key == KeyWrd.Name)
            {
                return NoNum(str);
            }
            else if(key == KeyWrd.Phone || key == KeyWrd.Avg)
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
                            if(str[i] == '@' && str[i + 1] == 'g' && str[i + 2] == 'm'
                            && str[i + 3] == 'a' && str[i + 4] == 'i' && str[i + 5] == 'l'
                            && str[i + 6] == '.' && str[i + 7] == 'c'  && str[i + 8] == 'o'
                            && str[i + 9] == 'm')
                            {
                                return false;
                            }
                            else
                            {
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
                    return true;
                }
            }
            if(key == KeyWrd.Avg)
            {
                if(double.Parse(str) < 0 && double.Parse(str) > 100)
                {
                    return true;
                }
                else
                {
                    return false;
                }
                
            }
            else if(key == KeyWrd.Phone)
            {
                if(double.Parse(str) < 0 && double.Parse(str) > 9999999999)
                {
                    return true;
                }
                else
                {
                    for (var i = 0; i < str.Length; i++)
                    {
                        if(str[i] == '0')
                        {
                            zero++;
                        }
                    }
                    if(zero > 5)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }                   
                }
            }
            return false;
        }
    }
}
