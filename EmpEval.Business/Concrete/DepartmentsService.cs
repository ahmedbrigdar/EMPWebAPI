using EmpEval.Business.Abstract;
using EmpEval.DataAccess.Abstract;
using EmpEval.Entities.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace EmpEval.Business.Concrete
{
    public class DepartmentsService: IDepartmentsService
    {
        private IEmpEvalRepository _empEvalRepository;
        public DepartmentsService(IEmpEvalRepository empEvalRepository)
        {
            _empEvalRepository = empEvalRepository;
        }
        public async Task<DepartmentsModel> AddDepartment(DepartmentsModel department)
        {
            return await _empEvalRepository.AddDepartmentAsync(department);
        }
        public List<DepartmentsModel> GetAllDepartments()
        {
            return _empEvalRepository.GetAllDepartments();
        }
    }
}
