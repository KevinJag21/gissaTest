using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using webApi.Dom;
using webApi.Dao;

namespace webApi.Bl
{
    public class BlUser
    {
        
        private DaoUser daoUser;
        public BlUser(string conn) {
            this.daoUser = new DaoUser(conn); 
        }

        public List<string> getSoftSkill() {
            return daoUser.getSoftSkill();
        }

        public User login(string email, string password) {

            
            User user = daoUser.login(email, password);
            if (user != null){
                user.phoneList = new List<string>();
                user.softSkillList = new List<string>();
            }
           

            return user;
        }
    }
}
