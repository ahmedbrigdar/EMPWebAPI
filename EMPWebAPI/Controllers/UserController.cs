using EmpEval.Entities.Models;
using EmpEval.Security;
using EmpEval.Security.Abstract;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace EmpEval.API.Controllers
{
    [Authorize(Roles = "Administrator")]
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;
        public UserController(IUserService userService)
        {
            _userService = userService;
        }
        [HttpPost("register")]
        public async Task<IActionResult> RegisterAsync(RegisterModel model)
        {
            var result = await _userService.RegisterAsync(model);
            return Ok(result);
        }
        [HttpPost("update")]
        public async Task<IActionResult> UpdateAsync(RegisterModel model)
        {
            var result = await _userService.UpdateAsync(model);
            return Ok(result);
        }
        [HttpPost("delete")]
        public async Task<IActionResult> DeleteAsync(string Id)
        {
            var result = await _userService.DeleteAsync(Id);
            return Ok(result);
        }
        [AllowAnonymous]
        [HttpPost("token")]
        public async Task<IActionResult> GetTokenAsync(TokenRequestModel model)
        {
            var result = await _userService.GetTokenAsync(model);
            return Ok(result);
        }
    }
}
