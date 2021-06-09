using EmpEval.Business.Abstract;
using EmpEval.DataAccess.Abstract;
using EmpEval.Entities.Abstract;
using EmpEval.Entities.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace EmpEval.Business.Concrete
{
    public class EmployeesService : IEmployeesService
    {
        private IEmpEvalRepository _empEvalRepository;
        public EmployeesService(IEmpEvalRepository empEvalRepository)
        {
            _empEvalRepository = empEvalRepository;
        }
        public async Task<EmployeesModel> AddEmployee(EmployeesModel employee)
        {
            return await _empEvalRepository.AddEmployeeAsync(employee);
        }
        public async Task<EmployeesModel> getEmployee(string id)
        {
            return await _empEvalRepository.GetEmployeeAsync(id);
        }
        public List<EmployeesModel> getAllEmployees()
        {
            return _empEvalRepository.GetAllEmployees();
        }
        public async Task<reponseMessage> addEmployeeEvaluation(EmpEvaluationModel eval)
        {
            return await _empEvalRepository.AddEvaluationAsync(eval);
        }
        public EmployeesModel getEmployeeEvaluation(string id)
        {
            return  _empEvalRepository.GetEmployeeEvaluationAsync(id);
        }
    }
}
