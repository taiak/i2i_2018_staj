using System;
using System.Collections.Generic;
using System.Data;
using System.Web.UI;
using Oracle.ManagedDataAccess.Client;

namespace DotNetUygulama
{
    public partial class _Default : Page
    {
        public List<String> EmployeeNameList;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            EmployeeNameList = GetEmployeeNames();
        }

        // get single employees first_name from employee id
        protected string GetEmployeeName(int EmployeeID)
        {
            String return_value = null;
            string connectionString = "user id=hr;password=hr;data source=localhost:1521/xe";
            OracleConnection conn = new OracleConnection(connectionString);
            OracleCommand cmd = new OracleCommand();
            cmd.Connection = conn;
            cmd.CommandText = "SELECT FIRST_NAME FROM employees WHERE employee_id =  " + EmployeeID.ToString() + '"';

            try {
                conn.Open();
                OracleDataReader dr = cmd.ExecuteReader();
                dr.Read();
                return_value = dr.GetString(0).ToString();
                conn.Dispose();
            }
            catch (Exception e) {
                return_value = e.ToString();
            }

            return return_value;
        }


        // sorgu dosyaları burda durmamalı!
        protected static List<string> GetEmployeeNames()
        {
            List<String> employee_name_list = new List<String>();
            
            // parola açıkta durmamalı
            String connectionString = "user id=hr;password=hr;data source=localhost:1521/xe";
            OracleConnection conn = new OracleConnection(connectionString);
            OracleCommand cmd = new OracleCommand();
            cmd.Connection = conn;
            cmd.CommandText = "SELECT FIRST_NAME FROM HR.employees";
            cmd.CommandType = CommandType.Text;

            try {
                conn.Open();
                OracleDataReader dr = cmd.ExecuteReader();
                while (dr.Read()) {
                    employee_name_list.Add(dr.GetString(0).ToString());
                };
            }
            catch (Exception) {
                employee_name_list.Clear();
                employee_name_list.Add("Error! Connection or Execute error!");
            }
            finally {
                conn.Close();
            }

            return employee_name_list;
        }
    }
}