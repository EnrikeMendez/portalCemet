using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cemetlib.Model
{
    public class User
    {
        public int UserId { get; set; }
        public string UserName { get; set; }
        public string FullName { get; set; }
        public DateTime CreationDate { get; set; }
        public int Status { get; set; }
        public DateTime ModifyDate { get; set; }
        public string UserModified { get; set; }
        public DateTime LastLoginDate { get; set; }
        public List<Role> Roles { get; set; }
    }
}
