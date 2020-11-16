using System;
using System.Collections.Generic;

namespace TypeKaro.Data.Entity
{
    public partial class UserBase
    {
        public Guid UserId { get; set; }
        public string UserDisplayName { get; set; }
        public string UserName { get; set; }
        public string UserEmailId { get; set; }
        public string UserContact { get; set; }
        public string UserPassword { get; set; }
        public string UserSource { get; set; }
        public bool? IsActive { get; set; }
        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }
        public DateTime? LastLoginDate { get; set; }
    }
}
