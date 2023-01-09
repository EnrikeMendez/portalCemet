using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;


namespace Cemetlib.Common
{
    public class DB
    {
        private SqlConnection cnn = null;
        private SqlCommand cmd = null;
        private SqlDataAdapter da = null;
        private DataTable dtRes = null;
        private string msj = string.Empty;


        private string GetConnectionString(string HOST = "", string PORT = "", string DB_NAME = "", string PASSWORD = "", string USER_ID = "")
        {
            string db_cadena = string.Empty;

            HOST = "192.168.0.4";
            PORT = "1521";
            DB_NAME = "Orfeo2";
            USER_ID = "web_adm";
            PASSWORD = "va4ncMC3P";

            db_cadena = string.Format("DATA SOURCE = {0}:{1} / {2}; PASSWORD = {3}; USER ID = {4};",
                                      HOST, PORT, DB_NAME, PASSWORD, USER_ID);

            return db_cadena;
        }
        public bool EjecutarQuery(string sql)
        {
            bool res = true;

            try
            {
                cnn = new SqlConnection();
                cnn.ConnectionString = GetConnectionString();

                cmd = new SqlCommand();
                cmd.CommandText = sql;
                cmd.Connection = cnn;

                cnn.Open();
                cmd.ExecuteNonQuery();
                cnn.Close();
            }
            catch (Exception ex)
            {
                ex.Source += "\t\n" + sql;
                Log.RegistraExcepcion(ex);
                res = false;
            }
            finally
            {
                if (cnn != null)
                {
                    if (cnn.State == ConnectionState.Open)
                    {
                        cnn.Close();
                    }
                    cnn.Dispose();
                    GC.SuppressFinalize(cnn);
                }
                if (cmd != null)
                {
                    cmd.Dispose();
                    GC.SuppressFinalize(cmd);
                }
            }

            return res;
        }
        public string ObtieneCadena(string sql)
        {
            string res = string.Empty;

            try
            {
                cnn = new SqlConnection();
                cnn.ConnectionString = GetConnectionString();

                cmd = new SqlCommand();
                cmd.CommandText = sql;
                cmd.Connection = cnn;

                cnn.Open();
                res = cmd.ExecuteScalar().ToString();
                cnn.Close();
            }
            catch (Exception ex)
            {
                ex.Source += "\t\n" + sql;
                Log.RegistraExcepcion(ex);
                res = string.Empty;
            }
            finally
            {
                if (cnn != null)
                {
                    if (cnn.State == ConnectionState.Open)
                    {
                        cnn.Close();
                    }
                    cnn.Dispose();
                    GC.SuppressFinalize(cnn);
                }
                if (cmd != null)
                {
                    cmd.Dispose();
                    GC.SuppressFinalize(cmd);
                }
            }

            return res;
        }
        public DataTable ObtieneDataTable(string sql)
        {
            DataTable dtTemp = new DataTable();

            try
            {
                dtRes = new DataTable();
                cnn = new SqlConnection();
                cnn.ConnectionString = GetConnectionString();

                cmd = new SqlCommand();
                cmd.CommandText = sql;
                cmd.Connection = cnn;

                cnn.Open();
                da = new SqlDataAdapter(cmd);
                da.Fill(dtTemp);
                cnn.Close();

                dtRes = dtTemp.Copy();
            }
            catch (Exception ex)
            {
                ex.Source += "\t\n" + sql;
                Log.RegistraExcepcion(ex);
                dtRes = null;
            }
            finally
            {
                if (cnn != null)
                {
                    if (cnn.State == ConnectionState.Open)
                    {
                        cnn.Close();
                    }
                    cnn.Dispose();
                    GC.SuppressFinalize(cnn);
                }
                if (cmd != null)
                {
                    cmd.Dispose();
                    GC.SuppressFinalize(cmd);
                }
                if (da != null)
                {
                    da.Dispose();
                    GC.SuppressFinalize(da);
                }
                if (dtTemp != null)
                {
                    dtTemp.Dispose();
                    GC.SuppressFinalize(dtTemp);
                }
            }

            return dtRes;
        }
    }
}
