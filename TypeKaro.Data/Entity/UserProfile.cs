using System;
using System.Collections.Generic;

namespace TypeKaro.Data.Entity
{
    public partial class UserProfile
    {
        public Guid ProfileId { get; set; }
        public Guid UserId { get; set; }
        public byte[] UserImage { get; set; }
        public DateTime ModifiedDate { get; set; }
    }
}
