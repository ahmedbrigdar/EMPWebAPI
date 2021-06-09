using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using EmpEval.Business.Abstract;
using EmpEval.Business.Concrete;
using EmpEval.Entities.Models;
using Microsoft.AspNetCore.Authorization;

namespace EmpEval.API.Controllers
{
    [Authorize(Roles = "Administrator")]
    [Route("api/[controller]")]
    [ApiController]
    public class EmployeesController : ControllerBase
    {
        private IEmployeesService _IEmployeeService;

        public EmployeesController(IEmployeesService employeeService)
        {
            _IEmployeeService = employeeService;
        }
        [HttpPost("add")]
        public async Task<IActionResult> AddEmployee(EmployeesModel employee)
        {
            EmployeesModel response = await _IEmployeeService.AddEmployee(employee);
            return Ok(response);
        }
        [HttpGet("get")]
        public async Task<IActionResult> GetEmployeeByID(string Id)
        {
            EmployeesModel response = await _IEmployeeService.getEmployee(Id);
            return Ok(response);
        }
        [HttpGet("all")]
        public IActionResult GetALL()
        {
            List<EmployeesModel> response = _IEmployeeService.getAllEmployees();
            return Ok(response);
        }
        [HttpPost("addEvaluation")]
        public async Task<IActionResult> AddEmployeeEvaluation(EmpEvaluationModel eval)
        {
            var response = await _IEmployeeService.addEmployeeEvaluation(eval);
            return Ok(response);
        }
        [AllowAnonymous]
        [HttpGet("getEvaluation")]
        public IActionResult GetEmployeeEvaluation(string Id)
        {
            EmployeesModel response =  _IEmployeeService.getEmployeeEvaluation(Id);
            return Ok(response);
        }
    }
}
