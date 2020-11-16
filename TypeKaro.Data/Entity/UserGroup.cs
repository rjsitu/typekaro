using System;
using System.Collections.Generic;

namespace TypeKaro.Data.Entity
{
    public partial class UserGroup
    {
        public Guid GroupId { get; set; }
        public Guid UserId { get; set; }
        public Guid GroupTypeId { get; set; }
        public Guid AccessId { get; set; }
        public string GroupName { get; set; }
        public string GroupDescription { get; set; }
        public string GroupTag { get; set; }
        public Guid CreatedBy { get; set; }
        public bool? IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
