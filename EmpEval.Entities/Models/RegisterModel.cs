using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace EmpEval.Entities.Models
{
    public class RegisterModel
    {
        [Required]
        public string FirstName { get; set; }
        [Required]
        public string LastName { get; set; }
        public string Username { get; set; }
        [Required]
        public string Email { get; set; }
        public int DepartmentID { get; set; }
        public string NationalID { get; set; }
        public string PhoneNumber { get; set; }
        public bool IsAdmin { get; set; }
        public string Id { get; set; }
    }
}
