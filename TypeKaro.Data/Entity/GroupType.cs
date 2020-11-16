using System;
using System.Collections.Generic;

namespace TypeKaro.Data.Entity
{
    public partial class GroupType
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
}
