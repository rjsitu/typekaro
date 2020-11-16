using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using FluentValidation.AspNetCore;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using TypeKaro.Data.Context;
using TypeKaro.Data.Repository;
using TypeKaro.Data.Repository.Contract;
using TypeKaro.Web.Filters;
using TypeKaro.Web.Model;

namespace TypeKaro.Web
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        readonly string MyAllowSpecificOrigins = "_myAllowSpecificOrigins";

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddCors(options =>
            {
                options.AddPolicy(name: MyAllowSpecificOrigins,
                                  builder =>
                                  {
                                      if (builder == null)
                                      {
                                          throw new ArgumentNullException(nameof(builder));
                                      }

                                      builder.AllowAnyHeader().AllowAnyMethod().WithOrigins("http://localhost:4200",
                                                          "http://182.237.15.163/typekaro", "http://182.237.15.163/", "http://182.237.15.163");
                                  });
            });

            services.AddScoped(typeof(IBaseRepository<>), typeof(BaseRepository<>));

            services.AddDbContext<TypeKaroDBContext>(o => o.UseSqlServer(Configuration.GetConnectionString("DefaultConnection")));

            services.AddMvc(options => { options.Filters.Add(typeof(ValidateModelStateAttribute)); })
                    .SetCompatibilityVersion(CompatibilityVersion.Version_2_2)
                    .AddFluentValidation();

            services.AddTransient<IValidator<UserProfileRequest>, UserProfileValidator>();

            services.AddSwaggerGen(c =>
            {
                c.SwaggerDoc("v1", new Microsoft.OpenApi.Models.OpenApiInfo { Title = "TypeKaro API", Version = "V1" });
            });

        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IHostingEnvironment env)
        {
            //if (env.IsDevelopment())
            //{
            //    app.UseDeveloperExceptionPage();
            //}
            //else
            //{
            //    // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
            //    app.UseHsts();
            //}

            app.UseDeveloperExceptionPage();
            app.UseHttpsRedirection();
            app.UseCors(MyAllowSpecificOrigins);
            app.UseSwagger();
            app.UseSwaggerUI(c => {
                c.SwaggerEndpoint("/swagger/v1/swagger.json", "TypeKaro API V1");
                c.DefaultModelsExpandDepth(-1);
            });

            app.UseMvc();
        }
    }
}
