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
    public class GroupTypeController : ControllerBase
    {
        public readonly IBaseRepository<GroupType> _repository;
        public GroupTypeController(IBaseRepository<GroupType> repository)
        {
            this._repository = repository;
        }

        [HttpGet]
        public ActionResult Get()
        {
            var result = _repository.GetAll();
            return new OkObjectResult(result.AsList<GroupTypeResponse>());
        }

        [HttpGet("{id}")]
        public ActionResult Get(Guid id)
        {
            var entity = _repository.Get(id);
            if (entity != null)
            {
                return new OkObjectResult(entity.TO<GroupTypeResponse>());
            }
            return new NoContentResult();
        }

        [HttpPost]
        public ActionResult Post([FromBody] GroupTypeRequest groupTypeRequest)
        {
            var entity = groupTypeRequest.TO<GroupType>();
            var result = _repository.Add(entity);
            return CreatedAtAction(nameof(Get), new { id = result.GroupTypeId }, result.TO<GroupTypeResponse>());
        }

        [HttpPut("{id}")]
        public ActionResult Put(Guid id, [FromBody] GroupTypeRequest groupTypeRequest)
        {
            var entity = _repository.Get(id);

            if (entity != null)
            {
                entity = groupTypeRequest.CopyTo(entity);

                _repository.Update(entity);
                return new OkObjectResult(entity.TO<GroupTypeResponse>());
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