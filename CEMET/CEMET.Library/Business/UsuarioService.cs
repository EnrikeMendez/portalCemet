using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cemetlib.Business
{
    public static class UsuarioService
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
        
        public static bool ValidaFolio(string folio, out bool redirect)
        {
            redirect = false;
            var respuesta = false;

            if (!string.IsNullOrWhiteSpace(folio))
            {
                if (int.TryParse(folio.Trim(), out var noFolio))
                {
                    //función que valida que el numero recuperado exista y no solo lo haya puesto el usuario...
                    //si noFolio no existe y/o no le pertenece.... Redirect
                    respuesta = true;
                }
                else
                {
                    redirect = true;
                }
            }

            return respuesta;
        }
    }
}
