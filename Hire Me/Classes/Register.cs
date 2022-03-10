using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Hire_Me.Classes
{
    public class Register
    {
        [Required(ErrorMessage = "Name is required")]
        public string name
        {
            get;
            set;
        }
        [Required(ErrorMessage = "Number is required")]
        [RegularExpression(@"\d{10}")]
        public string numId
        {
            get;
            set;
        }
        [Required(ErrorMessage = "Date is required")]
        [Range(typeof(DateTime), "01/01/1990", "01/01/2005", ErrorMessage = "Invalid Date")]
        public string date
        {
            get;
            set;
        }
        [Required(ErrorMessage = "Avg is required")]
        [Range(typeof(double), "50", "100", ErrorMessage = "Avg must be between 50 to 100")]
        public string avg
        {
            get;
            set;
        }
        [Required(ErrorMessage = "Phone is required")]
        [RegularExpression(@"\d{10}", ErrorMessage = "Phone Numbers 10 Characters Only")]
        public string phone
        {
            get;
            set;
        }

        [Required(ErrorMessage = "email is required")]
        [RegularExpression(@"\A(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?)\Z",
            ErrorMessage = "Please enter proper email")]
        public string email
        {
            get;
            set;
        }

        [Required(ErrorMessage = "Mobile is required")]
        [RegularExpression(@"\d{10}", ErrorMessage = "Please enter 10 digit Mobile No.")]
        public string mobile
        {
            get;
            set;
        }

        [Required(ErrorMessage = "Password is required")]
        [DataType(DataType.Password)]
        public string Password
        {
            get;
            set;
        }

        [Required(ErrorMessage = "Confirm Password is required")]
        [DataType(DataType.Password)]
        [Compare("Password")]
        public string ConfirmPassword
        {
            get;
            set;
        }

        [Required(ErrorMessage = "Age is required")]
        [Range(typeof(int), "18", "40", ErrorMessage = "Age can only be between 18 and 40")]
        public string age
        {
            get;
            set;
        }
    }
}