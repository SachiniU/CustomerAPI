using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System.Data;
using System.Data.SqlClient;
using CustomerAPI.Models;

namespace CustomerAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CustomerController : ControllerBase
    {
        private readonly IConfiguration _config;

        public CustomerController(IConfiguration config)
        {
            _config = config;
        }


        // ----- Get Customer ------
        [HttpGet]
        public JsonResult Get()
        {
            DataTable dtable = new DataTable();
            string sqlDataSource = _config.GetConnectionString("Myconnection");
            SqlDataReader myReader;

            using (SqlConnection mycon = new SqlConnection(sqlDataSource))
            { 
                mycon.Open();

                SqlCommand myCom = new SqlCommand("GetCustomer_sp", mycon);
                myCom.CommandType = CommandType.StoredProcedure;
                myReader = myCom.ExecuteReader();
                dtable.Load(myReader);
                myReader.Close();
                mycon.Close();
                
            }

            return new JsonResult(dtable);
        }


        // ----- Post Customer -----
        [HttpPost]
        public JsonResult Post(CustomerModel cus)
        {
            string sqlDataSource = _config.GetConnectionString("Myconnection");

            using (SqlConnection mycon = new SqlConnection(sqlDataSource))
            {
                mycon.Open();

                SqlCommand myCom = new SqlCommand("InsertCustomer_sp", mycon);
                myCom.CommandType = CommandType.StoredProcedure;
                
                myCom.Parameters.AddWithValue("@Customer_Name", cus.Customer_Name);
                myCom.Parameters.AddWithValue("@Customer_Phone", cus.Customer_Phone);
                myCom.Parameters.AddWithValue("@Customer_Address", cus.Customer_Address);
                myCom.Parameters.AddWithValue("@Customer_Email", cus.Customer_Email);
                   
                myCom.ExecuteReader();

                mycon.Close();
                
            }

            return new JsonResult("Added Successfully");
        }


        //----- Customer Update -----
        [HttpPut]
        public JsonResult Put(CustomerModel cus)
        {
            string sqlDataSource = _config.GetConnectionString("Myconnection");
            
            using (SqlConnection mycon = new SqlConnection(sqlDataSource))
            {
                mycon.Open();

                SqlCommand myCom = new SqlCommand("UpdateCustomer_sp", mycon);
                myCom.CommandType = CommandType.StoredProcedure;

                myCom.Parameters.AddWithValue("@Customer_Id", cus.Customer_Id);
                myCom.Parameters.AddWithValue("@Customer_Name", cus.Customer_Name);
                myCom.Parameters.AddWithValue("@Customer_Phone", cus.Customer_Phone);
                myCom.Parameters.AddWithValue("@Customer_Address", cus.Customer_Address);
                myCom.Parameters.AddWithValue("@Customer_Email", cus.Customer_Email);
                    
                myCom.ExecuteReader();
                    
                mycon.Close();
                
            }

            return new JsonResult("Updated Successfully");
        }


        // ----- Customer Delete -----
        [HttpDelete("{id}")]
        public JsonResult Delete(int id)
        {
            string sqlDataSource = _config.GetConnectionString("Myconnection");
            
            using (SqlConnection mycon = new SqlConnection(sqlDataSource))
            {
                mycon.Open();

                SqlCommand myCom = new SqlCommand("DeleteCustomer_sp", mycon);
                myCom.CommandType = CommandType.StoredProcedure;

                myCom.Parameters.AddWithValue("@Customer_Id", id);
                
                myCom.ExecuteReader();
                
                mycon.Close();

            }

            return new JsonResult("Deleted Successfully");
        }


    }
}
