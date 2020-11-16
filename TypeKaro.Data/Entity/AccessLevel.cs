using System;
using System.Collections.Generic;

namespace TypeKaro.Data.Entity
{
    public partial class AccessLevel
    {
        public Guid AccessId { get; set; }
        public string AccessTo { get; set; }
        public string AccessRemark { get; set; }
    }
}
