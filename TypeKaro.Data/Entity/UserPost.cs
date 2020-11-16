using System;
using System.Collections.Generic;

namespace TypeKaro.Data.Entity
{
    public partial class UserPost
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
}
