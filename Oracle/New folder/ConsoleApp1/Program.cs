using System;
using Oracle.ManagedDataAccess.Client;
using System.Threading;

namespace ConsoleApp1
{
    class OraConnect
    {
        public OracleConnection con;

        public void Connect()
        {
            con = new OracleConnection();
            con.ConnectionString = "User Id=HR;Password=hr;Data Source=localhost:1521/XEPDB1;Pooling = true;";
            con.Open();
            Console.WriteLine("Connected to Oracle" + con.ServerVersion);
        }
        public void Close()
        {
            con.Close();
            con.Dispose();
        }
    }
    class Program
    {
        public static void Test()
        {
            Thread.Sleep(5000);
            Console.WriteLine("End");
        }
        static void Main(string[] args)
        {
            //OraConnect ora = new OraConnect();
            //ora.Connect();
            //OracleCommand command = ora.con.CreateCommand();
            //string data = "select * from emp order by ename";
            //command.CommandText = data;
            //OracleDataReader oracleData = command.ExecuteReader();
            //while (oracleData.Read())
            //{
            //    string myField = (string)oracleData["ENAME"];
            //    int myField1 = (int)oracleData["EMPNO"];
            //    Console.WriteLine(myField + "\t" + myField1);
            //}
            //ora.Close();
            Thread thread = new Thread(Test);
            thread.Start();
            Console.WriteLine("Hello 1");
            
            for (int i = 0; i < 5; i++)
            {
                Console.WriteLine("Ahmed");
            }
            

            Console.WriteLine("Hello 2");
        }
    }
}
