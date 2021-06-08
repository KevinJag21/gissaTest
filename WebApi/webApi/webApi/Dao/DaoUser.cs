using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using webApi.Dom;

namespace webApi.Dao
{
    public class DaoUser
    {
        List<string> list = new List<string>();
        private string _conn = "";
        public DaoUser(string conn) {
            this._conn = conn;
        }

        public List<string> getSoftSkill() {

            string query = @"test_getSoftSkills";
            DataTable table = new DataTable();
            string sqlDataSource = _conn;
            SqlDataReader myReader;
            using (SqlConnection myCon = new SqlConnection(sqlDataSource))
            {
                myCon.Open();
                using (SqlCommand myCommand = new SqlCommand(query, myCon))
                {
                   
                    myReader = myCommand.ExecuteReader();
                    table.Load(myReader); ;

                    myReader.Close();
                    myCon.Close();
                }
            }

            foreach (DataRow row in table.Rows) {
                list.Add(row["skill"].ToString());
            }

            return list;
        }

        public User login(string email, string password)
        {
            User user = null;

            string query = "test_login";
            DataTable table = new DataTable();
            string sqlDataSource = _conn;
            SqlConnection conexion = new SqlConnection(_conn);
            try
            {
                SqlCommand comandoSelect = new SqlCommand(query, conexion);
                comandoSelect.CommandType = CommandType.StoredProcedure;
                comandoSelect.Parameters.AddWithValue("@password", password);
                comandoSelect.Parameters.AddWithValue("@email", email);
                

                if (conexion.State != ConnectionState.Open)
                {
                    conexion.Open();
                }

                SqlDataReader myReader = comandoSelect.ExecuteReader();
                if (myReader.HasRows)
                {
                    user = new User();
                    while (myReader.Read())
                    {

                        user.userId = (String)myReader["userId"];
                        user.userIdType = (String)myReader["userIdType"];
                        user.userType = (String)myReader["userType"];
                        user.name = (String)myReader["name"];
                        user.lastName = (String)myReader["lastName"];
                        user.email = (String)myReader["email"];
                        user.password = (String)myReader["password"];
                    }
                }
            }
            catch (Exception e)
            {
                Console.WriteLine(e);
                return null;
            }
            finally
            {
                if (conexion.State != ConnectionState.Closed)
                {
                    conexion.Close();
                }
            }
            return user;
        }
    }
}
