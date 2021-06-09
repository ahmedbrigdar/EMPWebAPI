using EmpEval.Business.Abstract;
using EmpEval.Business.Concrete;
using EmpEval.Entities.Models;
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
    public class DepartmentsController : ControllerBase
    {
        private IDepartmentsService _departmentService;

        public DepartmentsController(IDepartmentsService departmentsService)
        {
            _departmentService = departmentsService;
        }
        [HttpPost]
        [Route("[action]")]
        public async Task<IActionResult> AddDepartmentAsync(DepartmentsModel department)
        {
            DepartmentsModel response = await _departmentService.AddDepartment(department);
            return Ok(response);
        }
        [HttpGet]
        [Route("[action]")]
        public IActionResult GetAll()
        {
            List<DepartmentsModel> response = _departmentService.GetAllDepartments();
            return Ok(response);
        }
    }
}
