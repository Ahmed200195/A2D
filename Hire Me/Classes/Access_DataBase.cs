﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Data;
using Oracle.ManagedDataAccess.Client;

namespace Hire_Me.Classes
{
    enum KeyWord
    {
        Select, DML
    }
    public class Access_DataBase
    {
        OracleConnection connection;
        DataTable dataTable;
        OracleCommand oracleCommand;
        OracleDataAdapter dataAdapter;
        public OracleDataReader dataReader;

        //Create Connection with DataBase
        public Access_DataBase()
        {
            connection = new OracleConnection();
            connection.ConnectionString = ConfigurationManager.ConnectionStrings["tcc_con"].ConnectionString;
            oracleCommand = connection.CreateCommand();
        }
        //Open and Close Connection with DataBase
        public void ConnectToggel()
        {
            if(connection.State == ConnectionState.Closed)
            {
                connection.Open();
            }
            else
            {
                connection.Close();
                connection.Dispose();
            }
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
        //Query DML on DataBase
        public int Ex_DML(string Query)
        {
            oracleCommand.CommandText = Query;
            return oracleCommand.ExecuteNonQuery();
        }
        //Data Reader in DataBase
        public void Read_Data(string Query)
        {
            oracleCommand.CommandText = Query;
            dataReader = oracleCommand.ExecuteReader();
        }
    }
}