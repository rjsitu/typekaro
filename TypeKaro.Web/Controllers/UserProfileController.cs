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
    public class UserProfileController : ControllerBase
    {
        public readonly IBaseRepository<UserProfile> _repository;
        public UserProfileController(IBaseRepository<UserProfile> repository)
        {
            this._repository = repository;
        }

        [HttpGet]
        public ActionResult Get()
        {
            var result = _repository.GetAll();
            return new OkObjectResult(result.AsList<UserProfileResponse>());
        }

        [HttpGet("{id}")]
        public ActionResult Get(int id)
        {
            var entity = _repository.Get(id);
            if (entity != null)
            {
                return new OkObjectResult(entity.TO<UserProfileResponse>());
            }
            return new NoContentResult();
        }

        [HttpPost]
        public ActionResult Post([FromBody] UserProfileRequest userProfile)
        {
            var entity = userProfile.TO<UserProfile>();            
            var result = _repository.Add(entity);
            return CreatedAtAction(nameof(Get), new { id = result.ProfileId }, result.TO<UserProfileResponse>());
        }
                  
        [HttpPut("{id}")]
        public ActionResult Put(int id, [FromBody] UserProfileRequest userProfile)
        {
            var entity = _repository.Get(id);

            if (entity != null)
            {
                entity = userProfile.CopyTo(entity);
               
                _repository.Update(entity);
                return new OkObjectResult(entity.TO<UserProfileResponse>());
            }
            return new NoContentResult();
        }

        [HttpDelete("{id}")]
        public ActionResult Delete(int id)
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