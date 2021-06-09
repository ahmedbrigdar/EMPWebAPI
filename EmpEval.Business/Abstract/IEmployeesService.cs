using EmpEval.Entities.Abstract;
using EmpEval.Entities.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace EmpEval.Business.Abstract
{
    public interface IEmployeesService
    {
        Task<EmployeesModel> AddEmployee(EmployeesModel employee);
        Task<EmployeesModel> getEmployee(string id);
        List<EmployeesModel> getAllEmployees();
        EmployeesModel getEmployeeEvaluation(string id);
        Task<reponseMessage> addEmployeeEvaluation(EmpEvaluationModel eval);
    }
}
