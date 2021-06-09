using EmpEval.Entities.Abstract;
using EmpEval.Entities.Models;
using EmpEval.Security.Concrete;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace EmpEval.Security.Abstract
{
    public interface IUserService
    {
        Task<reponseMessage> RegisterAsync(RegisterModel model);
        Task<reponseMessage> UpdateAsync(RegisterModel model);
        Task<reponseMessage> DeleteAsync(string Id);
        Task<AuthenticationModel> GetTokenAsync(TokenRequestModel model);
    }
}
