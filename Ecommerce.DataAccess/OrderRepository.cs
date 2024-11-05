using Ecommerce.Common.Response;
using Ecommerce.DataAccess.Entity;
using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Ecommerce.DataAccess
{
    public class OrderRepository
    {
        private readonly string _connectionString;

        public OrderRepository(string connectionString)
        {
            _connectionString = connectionString;
        }

        public Customer GetCustomerByEmailAndId(string email, string customerId)
        {
            Customer customer = null;
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("GetCustomerByEmailAndId", conn))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@CustomerId", customerId);

                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            customer = new Customer
                            {
                                CustomerId = reader["CustomerId"].ToString(),
                                FirstName = reader["FirstName"].ToString(),
                                LastName = reader["LastName"].ToString(),
                                Email = reader["Email"].ToString(),
                                HouseNo = reader["HouseNo"].ToString(),
                                Street = reader["Street"].ToString(),
                                Town = reader["Town"].ToString(),
                                PostCode = reader["PostCode"].ToString()
                            };
                        }
                    }
                }
            }
            return customer;
        }

        public async Task<OrderDetails> GetLatestOrderAsync(string customerId)
        {
            OrderDetails orderDetail = null;

            using (SqlConnection connection = new SqlConnection(_connectionString))
            {
                await connection.OpenAsync();
                using (SqlCommand command = new SqlCommand("GetLatestOrderByCustomerId", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;
                    command.Parameters.AddWithValue("@CustomerId", customerId);

                    using (var reader = await command.ExecuteReaderAsync())
                    {
                        if (await reader.ReadAsync())
                        {
                            orderDetail = new OrderDetails
                            {
                                OrderNumber = (int)reader["ORDERID"],
                                OrderDate = (DateTime)reader["ORDERDATE"],
                                DeliveryExpected = (DateTime)reader["DELIVERYEXPECTED"],
                                DeliveryAddress = reader["DeliveryAddress"].ToString(),
                                OrderItems = new List<OrderItemDetails>()
                            };

                            // Collect all items for the latest order
                            do
                            {
                                orderDetail.OrderItems.Add(new OrderItemDetails
                                {
                                    Product = (bool)reader["CONTAINSGIFT"] ? "Gift" : reader["PRODUCTNAME"].ToString(),
                                    Quantity = (int)reader["QUANTITY"],
                                    PriceEach = (decimal)reader["PRICE"]
                                });
                            } while (await reader.ReadAsync());
                        }
                    }
                }
            }

            return orderDetail;
        }

    }

}
