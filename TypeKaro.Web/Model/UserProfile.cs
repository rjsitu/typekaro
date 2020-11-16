using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TypeKaro.Web.Model
{
    public class UserProfileRequest
    {
        public Guid ProfileId { get; set; }
        public Guid UserId { get; set; }
        public byte[] UserImage { get; set; }
        public DateTime ModifiedDate { get; set; }
    }

    public class UserProfileResponse
    {
        public Guid ProfileId { get; set; }
        public Guid UserId { get; set; }
        public byte[] UserImage { get; set; }
        public DateTime ModifiedDate { get; set; }
    }

    public class UserProfileValidator : AbstractValidator<UserProfileRequest>
    {
        public UserProfileValidator()
        {
            RuleFor(x => x.ProfileId).NotNull();
            RuleFor(x => x.UserId).NotNull();
            RuleFor(x => x.ModifiedDate).NotNull().NotEmpty();
        }
    }
}
