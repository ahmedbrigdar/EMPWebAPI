using EmpEval.Entities.Abstract;
using EmpEval.Entities.Models;
using EmpEval.Security.Abstract;
using Microsoft.AspNetCore.Identity;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace EmpEval.Security.Concrete
{
    public class UserService : IUserService
    {
        private readonly UserManager<ApplicationUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly JWT _jwt;
        public UserService(UserManager<ApplicationUser> userManager, RoleManager<IdentityRole> roleManager, IOptions<JWT> jwt)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _jwt = jwt.Value;
        }
        public async Task<reponseMessage> RegisterAsync(RegisterModel model)
        {
            var user = new ApplicationUser
            {
                UserName = model.Email,
                Email = model.Email,
                FirstName = model.FirstName,
                LastName = model.LastName,
                DepartmentID = model.DepartmentID,
                NationalID = model.NationalID,
                PhoneNumber = model.PhoneNumber,
                IsAdmin = model.IsAdmin,
            };
            var userWithSameEmail = await _userManager.FindByEmailAsync(model.Email);
            if (userWithSameEmail == null)
            {
                var result = await _userManager.CreateAsync(user, Authorization.default_password);
                if (result.Succeeded)
                {
                    if (model.IsAdmin)
                        await _userManager.AddToRoleAsync(user, Authorization.Roles.Administrator.ToString());
                    else
                        await _userManager.AddToRoleAsync(user, Authorization.default_role.ToString());
                }
                else
                {
                    return new reponseMessage { status = 0, message = "User Not Registered" };
                }
                return new reponseMessage { status = 1, message = $"User Registered with username {user.UserName}" };
            }
            else
            {
                return new reponseMessage { status = 0, message = $"Email {user.Email } is already registered." };
            }
        }
        public async Task<reponseMessage> UpdateAsync(RegisterModel model)
        {
            var existUser = await _userManager.FindByIdAsync(model.Id);
            if (existUser == null)
            {
                return null;
            }

            var userWithSameEmail = await _userManager.FindByEmailAsync(model.Email);
            if ((userWithSameEmail != null && userWithSameEmail.Id == model.Id) || userWithSameEmail == null)
            {
                existUser.UserName = model.Email;
                existUser.Email = model.Email;
                existUser.FirstName = model.FirstName;
                existUser.LastName = model.LastName;
                existUser.DepartmentID = model.DepartmentID;
                existUser.NationalID = model.NationalID;
                existUser.PhoneNumber = model.PhoneNumber;
                existUser.IsAdmin = model.IsAdmin;

                var result = await _userManager.UpdateAsync(existUser);
                if (result.Succeeded)
                {
                    if (model.IsAdmin)
                    {
                        await _userManager.RemoveFromRoleAsync(existUser, Authorization.default_role.ToString());
                        await _userManager.AddToRoleAsync(existUser, Authorization.Roles.Administrator.ToString());
                    }
                    else
                    {
                        await _userManager.RemoveFromRoleAsync(existUser, Authorization.Roles.Administrator.ToString());
                        await _userManager.AddToRoleAsync(existUser, Authorization.default_role.ToString());
                    }
                }
                else
                {
                    return new reponseMessage { status = 0, message = "User Not Registered" };
                }
                return new reponseMessage { status = 1, message = $"User Updated with username {existUser.UserName}" };
            }
            else
                return new reponseMessage { status = 0, message = $"Email {model.Email } is already registered For another user" };

        }
        public async Task<reponseMessage> DeleteAsync(string Id)
        {
            var existUser = await _userManager.FindByIdAsync(Id);
            if (existUser == null)
            {
                return null;
            }
            var result = await _userManager.DeleteAsync(existUser);
            if (result.Succeeded)
            { 
                return new reponseMessage { status = 1, message = $"User with username {existUser.UserName} deleted successfully" };
            }
            else
            {
                return new reponseMessage { status = 0, message = "User Not deleted" };
            }
        }
        public async Task<AuthenticationModel> GetTokenAsync(TokenRequestModel model)
        {
            var authenticationModel = new AuthenticationModel();
            var user = await _userManager.FindByEmailAsync(model.Email);
            if (user == null)
            {
                authenticationModel.IsAuthenticated = false;
                authenticationModel.Message = $"No Accounts Registered with {model.Email}.";
                return authenticationModel;
            }
            if (await _userManager.CheckPasswordAsync(user, model.Password))
            {
                authenticationModel.IsAuthenticated = true;
                JwtSecurityToken jwtSecurityToken = await CreateJwtToken(user);
                authenticationModel.Token = new JwtSecurityTokenHandler().WriteToken(jwtSecurityToken);
                authenticationModel.Email = user.Email;
                authenticationModel.UserName = user.UserName;
                authenticationModel.Id = user.Id;
                authenticationModel.IsAdmin = user.IsAdmin;
                var rolesList = await _userManager.GetRolesAsync(user).ConfigureAwait(false);
                authenticationModel.Roles = rolesList.ToList();
                return authenticationModel;
            }
            authenticationModel.IsAuthenticated = false;
            authenticationModel.Message = $"Incorrect Credentials for user {user.Email}.";
            return authenticationModel;
        }
        private async Task<JwtSecurityToken> CreateJwtToken(ApplicationUser user)
        {
            var userClaims = await _userManager.GetClaimsAsync(user);
            var roles = await _userManager.GetRolesAsync(user);
            var roleClaims = new List<Claim>();
            for (int i = 0; i < roles.Count; i++)
            {
                roleClaims.Add(new Claim("roles", roles[i]));
            }
            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub, user.UserName),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(JwtRegisteredClaimNames.Email, user.Email),
                new Claim("uid", user.Id)
            }
            .Union(userClaims)
            .Union(roleClaims);
            var symmetricSecurityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_jwt.Key));
            var signingCredentials = new SigningCredentials(symmetricSecurityKey, SecurityAlgorithms.HmacSha256);
            var jwtSecurityToken = new JwtSecurityToken(
                issuer: _jwt.Issuer,
                audience: _jwt.Audience,
                claims: claims,
                expires: DateTime.UtcNow.AddMinutes(_jwt.DurationInMinutes),
                signingCredentials: signingCredentials);
            return jwtSecurityToken;
        }

    }
}
