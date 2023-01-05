using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(CEMET.WebApp.Startup))]
namespace CEMET.WebApp
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
