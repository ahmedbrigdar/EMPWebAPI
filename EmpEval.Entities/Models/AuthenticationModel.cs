using System;
using System.Collections.Generic;
using System.Text;

namespace EmpEval.Entities.Models
{
    public class AuthenticationModel
    {
        public string Id { get; set; }
        public string Message { get; set; }
        public bool IsAuthenticated { get; set; }
        public string UserName { get; set; }
        public string Email { get; set; }
        public List<string> Roles { get; set; }
        public string Token { get; set; }
        public bool IsAdmin { get; set; }
    }
}
