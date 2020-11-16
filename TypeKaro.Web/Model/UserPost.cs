using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TypeKaro.Web.Model
{
    public class UserPostRequest
    {        
        public string PostHeader { get; set; }
        public string PostMessage { get; set; }
        public Guid UserId { get; set; }
        public Guid? GroupId { get; set; }                
    }

    public class UserPostResponse
    {
        public Guid PostId { get; set; }
        public string PostHeader { get; set; }
        public string PostMessage { get; set; }
        public Guid UserId { get; set; }
        public Guid? GroupId { get; set; }
        public bool? IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
    }

    public class UserPostValidator : AbstractValidator<UserPostRequest>
    {
        public UserPostValidator()
        {
            RuleFor(x => x.PostHeader).NotNull();
            RuleFor(x => x.PostMessage).NotNull();
            RuleFor(x => x.GroupId).NotNull();
        }
    }
}
