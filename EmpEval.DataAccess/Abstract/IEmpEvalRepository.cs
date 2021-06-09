using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;
using EmpEval.Entities.Abstract;
using EmpEval.Entities.Models;


namespace EmpEval.DataAccess.Abstract
{
    public interface IEmpEvalRepository
    {
        Task<EmployeesModel> AddEmployeeAsync(EmployeesModel employee);
        List<EmployeesModel> GetAllEmployees();
        Task<EmployeesModel> GetEmployeeAsync(string id);
        Task<DepartmentsModel> AddDepartmentAsync(DepartmentsModel department);
        List<DepartmentsModel> GetAllDepartments();

        Task<reponseMessage> AddEvaluationAsync(EmpEvaluationModel evaluation);
        List<EmpEvaluationModel> GetAllEvaluations();
        EmployeesModel GetEmployeeEvaluationAsync(string id);

    }
}
