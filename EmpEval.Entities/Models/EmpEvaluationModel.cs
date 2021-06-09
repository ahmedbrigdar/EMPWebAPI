using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Text;

namespace EmpEval.Entities.Models
{
    [Table("EmployeeEvaluation")]
    public class EmpEvaluationModel
    {
        [Key, DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int EvaluationID { get; set; }
        [ForeignKey("Id")]
        public string EmployeeID { get; set; }
        public int JobKnowledge { get; set; }
        public int WorkQuality { get; set; }
        public int Attendance { get; set; }
        public int Initiatives { get; set; }
        public int CommunicationSkill { get; set; }
        public int OverAllScore { get; set; }
        public virtual EmployeesModel Employee { get; set; }

    }
}
