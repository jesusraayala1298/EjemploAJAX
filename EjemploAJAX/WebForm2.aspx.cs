using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

namespace EjemploAJAX
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnHelloWorld_Click(object sender, EventArgs e)
        {
            List<Country> countries = obtenerTodos();
            dgvTabla.DataSource = null;
            dgvTabla.DataSource = countries;
            dgvTabla.DataBind();
        }

        String conexion = "server=localhost; database=world; user=root; pwd=root";
        private List<Country> obtenerTodos()
        {
            ///CREAR CONEXION, MODIFICARLA, USARLA
            List<Country> paises = new List<Country>();
            MySqlConnection cn = new MySqlConnection();
            try
            {
                cn.ConnectionString = conexion;
                cn.Open();
                ///EJECUTAR COMANDO
                string strSQL = "SELECT Code, Name, Continent FROM COUNTRY";
                MySqlCommand comando = new MySqlCommand(strSQL, cn);
                MySqlDataReader dr = comando.ExecuteReader();

                while (dr.Read())
                {

                    Country producto = new Country
                    (
                        dr.GetString("Code"),
                        dr.GetString("Name"),
                        dr.GetString("Continent")
                    );

                    paises.Add(producto);
                }

                comando.Dispose();
                return paises;
            }
            catch (Exception e)
            {
                throw e;
            }
            finally
            {
                ///CERRAR CONEXION
                cn.Close();
                cn.Dispose();
            }

        }
    }
}

class Country {
    public String Code { get; set; }
    public String Name { get; set; }
    public String Continent { get; set; }
    public Country(String code, String name, String continent)
    {
        this.Code = code;
        this.Name = name;
        this.Continent = continent;
    }
}