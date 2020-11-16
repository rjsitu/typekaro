using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using TypeKaro.Common.Extension;
using TypeKaro.Data.Entity;
using TypeKaro.Data.Repository.Contract;
using TypeKaro.Web.Model;

namespace TypeKaro.Web.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserPostController : ControllerBase
    {
        public readonly IBaseRepository<UserPost> _repository;
        public UserPostController(IBaseRepository<UserPost> repository)
        {
            this._repository = repository;
        }

        [HttpGet]
        public ActionResult Get()
        {
            var result = _repository.GetAll();
            return new OkObjectResult(result.AsList<UserPostResponse>());
        }

        [HttpGet("{id}")]
        public ActionResult Get(Guid id)
        {
            var entity = _repository.Get(id);
            if (entity != null)
            {
                return new OkObjectResult(entity.TO<UserPostResponse>());
            }
            return new NoContentResult();
        }

        [HttpPost]
        public ActionResult Post([FromBody] UserPostRequest userPostRequest)
        {
            var entity = userPostRequest.TO<UserPost>();
            var result = _repository.Add(entity);
            return CreatedAtAction(nameof(Get), new { id = result.PostId }, result.TO<UserPostResponse>());
        }

        [HttpPut("{id}")]
        public ActionResult Put(Guid id, [FromBody] UserPostRequest userPostRequest)
        {
            var entity = _repository.Get(id);

            if (entity != null)
            {
                entity = userPostRequest.CopyTo(entity);

                _repository.Update(entity);
                return new OkObjectResult(entity.TO<UserPostResponse>());
            }
            return new NoContentResult();
        }

        [HttpDelete("{id}")]
        public ActionResult Delete(Guid id)
        {
            var entity = _repository.Get(id);
            if (entity != null)
            {
                _repository.Delete(entity);
                return new OkResult();
            }
            return new NoContentResult();
        }
    }
}