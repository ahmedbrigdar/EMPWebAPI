using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace EmpEval.Entities.Models
{
    [Table("AspNetUsers")]
    public class EmployeesModel
    {
        public EmployeesModel()
        {
            EmployeeEvaluations = new HashSet<EmpEvaluationModel>();
        }
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public string Id { get; set; }
        public int DepartmentID { get; set; }
        public virtual DepartmentsModel Department { get; set; }
        public string Email { get; set; }
        public bool IsAdmin { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string Username { get; set; }
        public string NationalID { get; set; }
        public string PhoneNumber { get; set; }
        public virtual ICollection<EmpEvaluationModel> EmployeeEvaluations { get; set; }
    }
}
