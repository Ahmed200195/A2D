using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Hire_Me.Classes
{
    public class BasicHireMe
    { 
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
        public static string Encrypt(string txt, int key)
        {
            return Encoding(txt, key);
        }
        public static string Decrypt(string txt, int key)
        {
            return Encoding(txt, -key);
        }

    }
}
