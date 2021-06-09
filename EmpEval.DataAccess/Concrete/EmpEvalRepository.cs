using EmpEval.DataAccess.Abstract;
using EmpEval.Entities.Abstract;
using EmpEval.Entities.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmpEval.DataAccess.Concrete
{
    public class EmpEvalRepository : IEmpEvalRepository
    {
        public async Task<EmployeesModel> AddEmployeeAsync(EmployeesModel employee)
        {
            using (var empEvalDbContext = new EmpEvalDbContext())
            {
                empEvalDbContext.employees.Add(employee);
                await empEvalDbContext.SaveChangesAsync();
                return employee;
            }
        }
        public async Task<EmployeesModel> GetEmployeeAsync(string id)
        {
            using (var empEvalDbContext = new EmpEvalDbContext())
            {
                return await empEvalDbContext.employees.FindAsync(id);
            }
        }
        public List<EmployeesModel> GetAllEmployees()
        {
            using (var empEvalDbContext = new EmpEvalDbContext())
            {
                return empEvalDbContext.employees.Select(s => new EmployeesModel()
                {
                    Id = s.Id,
                    FirstName = s.FirstName,
                    Department = new DepartmentsModel()
                    {
                        DepartmentID = s.Department.DepartmentID,
                        DepartmentName = s.Department.DepartmentName
                    },
                    EmployeeEvaluations = s.EmployeeEvaluations.Select(v => new EmpEvaluationModel
                    {
                        EvaluationID = v.EvaluationID,
                        JobKnowledge = v.JobKnowledge,
                        Attendance = v.Attendance,
                        Initiatives = v.Initiatives,
                        WorkQuality = v.WorkQuality,
                        CommunicationSkill = v.CommunicationSkill,
                        OverAllScore = v.OverAllScore
                    }).ToList(),
                    PhoneNumber = s.PhoneNumber,
                    Email = s.Email,
                    IsAdmin = s.IsAdmin,
                }).OrderByDescending(o=>o.EmployeeEvaluations.FirstOrDefault().OverAllScore).ToList();
            }
        }
        public EmployeesModel GetEmployeeEvaluationAsync(string id)
        {
            using (var empEvalDbContext = new EmpEvalDbContext())
            {
                return
                 empEvalDbContext.employees.Where(e => e.Id == id).Select(s =>
                 new EmployeesModel()
                 {
                     Id = s.Id,
                     FirstName = s.FirstName,
                     Email = s.Email,
                     EmployeeEvaluations = s.EmployeeEvaluations.Select(v => new EmpEvaluationModel
                     {
                         EvaluationID = v.EvaluationID,
                         JobKnowledge = v.JobKnowledge,
                         Attendance = v.Attendance,
                         Initiatives = v.Initiatives,
                         WorkQuality = v.WorkQuality,
                         CommunicationSkill = v.CommunicationSkill,
                         OverAllScore = v.OverAllScore
                     }).ToList()
                 }).Single();
            }
        }
        public async Task<DepartmentsModel> AddDepartmentAsync(DepartmentsModel department)
        {
            using (var empEvalDbContext = new EmpEvalDbContext())
            {
                empEvalDbContext.departments.Add(department);
                await empEvalDbContext.SaveChangesAsync();
                return department;
            }
        }
        public List<DepartmentsModel> GetAllDepartments()
        {
            using (var empEvalDbContext = new EmpEvalDbContext())
            {
                return empEvalDbContext.departments.ToList();
            }
        }
        public async Task<reponseMessage> AddEvaluationAsync(EmpEvaluationModel evaluation)
        {
            using (var empEvalDbContext = new EmpEvalDbContext())
            {
                try
                {
                    if (evaluation.EvaluationID != 0)
                    {
                        var entity = empEvalDbContext.evaluations.Find(evaluation.EvaluationID);
                        entity.Attendance = evaluation.Attendance;
                        entity.CommunicationSkill = evaluation.CommunicationSkill;
                        entity.Initiatives = evaluation.Initiatives;
                        entity.JobKnowledge = evaluation.JobKnowledge;
                        entity.WorkQuality = evaluation.WorkQuality;
                        entity.OverAllScore = evaluation.OverAllScore;
                        //  entity = evaluation;
                        //  empEvalDbContext.evaluations.Update(entity);
                    }
                    else
                    {
                        empEvalDbContext.evaluations.Add(evaluation);
                    }
                    await empEvalDbContext.SaveChangesAsync();
                    return new reponseMessage() { status = 1, message = $"Employee Evaluated Successfully" };
                }
                catch (Exception e)
                {
                    return new reponseMessage() { status = 0, message = $"Employee not Evaluated" };
                }

            }
        }
        public List<EmpEvaluationModel> GetAllEvaluations()
        {
            using (var empEvalDbContext = new EmpEvalDbContext())
            {
                return empEvalDbContext.evaluations.ToList();
            }
        }
    }
}
