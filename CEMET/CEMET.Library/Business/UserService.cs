using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cemetlib.Business
{
    public static class UserService
    {
        public static void CreateUser(string username, string password, string salt)
        {
            throw new NotImplementedException();
        }
        /// <summary>
        ///     Checks if the provided credentials are correct for the given user
        /// </summary>
        /// <param name="userName"></param>
        /// <param name="password"></param>
        /// <returns>User entity</returns>
        public static User Login(string userName, string password)
        {
            throw new NotImplementedException();
        }
        public static User GetUserInfo(string userName)
        {
            throw new NotImplementedException();
        }
        
    }
}
