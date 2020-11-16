using Microsoft.Extensions.Configuration;
using System;

namespace TypeKaro.Common
{
    public static class ConfigHelper
    {
        public static IConfiguration Configuration;

        public static string GetDBConnectionString()
        {
            return Configuration["DBConnectionString"];
        }
    }
}
