using EmpEval.Entities.Models;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace EmpEval.Business.Abstract
{
    public interface IDepartmentsService
    {
        Task<DepartmentsModel> AddDepartment(DepartmentsModel department);
        List<DepartmentsModel> GetAllDepartments();
    }
}
