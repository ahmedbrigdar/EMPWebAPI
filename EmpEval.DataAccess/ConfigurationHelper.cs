using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EmpEval.DataAccess
{
    public static class ConfigurationHelper
    {
        public static IConfiguration GetConfig()
        {

            var builder = new ConfigurationBuilder().SetBasePath(AppContext.BaseDirectory).AddJsonFile("appsettings.json", optional: true, reloadOnChange: true);
            return builder.Build();
        }

        public static string MSSQLConnectionString()
        {
            var settings = GetConfig();
            return settings.GetConnectionString("MSSQLConnectionString");
        }

    }
}
