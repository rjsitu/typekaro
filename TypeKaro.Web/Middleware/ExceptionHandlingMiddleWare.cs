﻿using Microsoft.AspNetCore.Http;
using System;
using System.Net;
using System.Threading.Tasks;

namespace TypeKaro.Web.Middleware
{
    public class ExceptionHandlingMiddleWare
    {
        private readonly RequestDelegate next;

        public ExceptionHandlingMiddleWare(RequestDelegate next)
        {
            this.next = next;
        }

        public async Task Invoke(HttpContext context)
        {
            try
            {
                await next(context);
            }
            catch (Exception ex)
            {
                await HandleExceptionAsync(context, ex);
            }
        }

        private Task HandleExceptionAsync(HttpContext context, Exception exception)
        {
            context.Response.ContentType = "application/json";
            context.Response.StatusCode = (int)HttpStatusCode.InternalServerError;

            var ex = new
            {
                StatusCode = 500,
                Message = exception.Message
            };

            return context.Response.WriteAsync("Please contact administrator");
        }
    }
}
