using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace EjemploAJAX
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        [System.Web.Services.WebMethod]              // Marcamos el método como uno web
        public static string BuscarNumAleatorio()    // el método debe ser de static
        {
            Random aleatorio = new Random();
            return aleatorio.Next(0, 1000).ToString();
        }
    }
}