using FluentValidation;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace TypeKaro.Web.Model
{
    public class GroupTypeRequest
    {        
        public string GroupTypeName { get; set; }
        public string GroupRemark { get; set; }
        public bool? IsPrivate { get; set; }
        public bool? IsPost { get; set; }
        public bool? IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
    }

    public class GroupTypeResponse
    {
        public Guid GroupTypeId { get; set; }
        public string GroupTypeName { get; set; }
        public string GroupRemark { get; set; }
        public bool? IsPrivate { get; set; }
        public bool? IsPost { get; set; }
        public bool? IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
    }

    public class GroupTypeValidator : AbstractValidator<GroupTypeRequest>
    {
        public GroupTypeValidator()
        {
            RuleFor(x => x.GroupTypeName).NotNull().NotEmpty().MaximumLength(200);
            RuleFor(x => x.GroupRemark).NotNull().NotEmpty().MaximumLength(2000);
            RuleFor(x => x.ModifiedDate).NotNull().NotEmpty();
        }
    }
}
