using Oracle.ManagedDataAccess.Client;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;

namespace Project_for_Al_Aseel_Mosque.Classes
{
    public class Access_DataBase
    {
        OracleConnection connection;
        private DataTable dataTable;
        OracleCommand oracleCommand;
        OracleDataAdapter dataAdapter;
        public OracleDataReader dataReader;

        //Create Connection with DataBase
        public Access_DataBase()
        {
            connection = new OracleConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["Con_DB_Mosque"].ConnectionString;
            connection.Open();
            oracleCommand = connection.CreateCommand();
            //oracleCommand.CommandType = CommandType.StoredProcedure;
        }

        //Open and Close Connection with DataBase
        public void Close()
        {
            connection.Close();
            connection.Dispose();
        }

        //Select Data From DataBase
        public DataTable SelectData(string Query)
        {
            oracleCommand.CommandText = Query;
            dataAdapter = new OracleDataAdapter(oracleCommand);
            dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            return dataTable;
        }
        //Select All Data From Table
        public DataTable SelectAllData(string Table)
        {
            oracleCommand.CommandText = "SELECT * FROM " + Table;
            dataAdapter = new OracleDataAdapter(oracleCommand);
            dataTable = new DataTable();
            dataAdapter.Fill(dataTable);
            return dataTable;
        }
        //Query SQL on DataBase
        public int Ex_SQL(string Query)
        {
            oracleCommand.CommandText = Query;
            return oracleCommand.ExecuteNonQuery();
        }
        //Data Reader in DataBase
        public void Read_Data(string Field, string Table)
        {
            oracleCommand.CommandText = "SELECT " + Field + " FROM " + Table;
            dataReader = oracleCommand.ExecuteReader();
        }
    }
}