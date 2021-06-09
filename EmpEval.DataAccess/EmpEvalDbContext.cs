using System;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;

using System.Text;
using EmpEval.Entities.Models;

namespace EmpEval.DataAccess
{
    public partial class EmpEvalDbContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            base.OnConfiguring(optionsBuilder);

            string connectionString = ConfigurationHelper.MSSQLConnectionString();
            optionsBuilder.UseSqlServer(connectionString);
        }
        

        public virtual DbSet<EmployeesModel> employees { get; set; }
        public virtual DbSet<DepartmentsModel> departments { get; set; }
        public virtual DbSet<EmpEvaluationModel> evaluations { get; set; }


    }

}
