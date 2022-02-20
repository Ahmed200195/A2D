using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Data;
using Oracle.ManagedDataAccess.Client;

namespace Hire_Me.Classes
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
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["tcc_con"].ConnectionString;
            connection.Open();
            oracleCommand = connection.CreateCommand();
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
        //Query DML on DataBase
        public int Ex_DML(string Query)
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
        //Data Number In Database
        public int Data_Num(string Field, string Table)
        {
            int i = 1;
            Read_Data(Field, Table);
            while (dataReader.Read())
            {
                i++;
            }
            return i;
        }
    }
}