using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace webApi.Dom
{
    public class User
    {
        public string userId { get; set; }
        public string userType { get; set; }
        public string userIdType { get; set; }
        public string name { get; set; }
        public string lastName { get; set; }
        public string password { get; set; }
        public string email { get; set; }
        public List<string> phoneList { get; set; }
        public List<string> softSkillList { get; set; }
    }
}
