using Ecommerce.DataAccess.Entity;
using Ecommerce.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Ecommerce.Common.Response;


namespace Ecommerce.BusinessLogic
{
    public class OrderService
    {
        private readonly OrderRepository _orderRepository;

        public OrderService(OrderRepository orderRepository)
        {
            _orderRepository = orderRepository;
        }

        public Customer GetCustomerByEmailAndId(string email, string customerId)
        {
            return _orderRepository.GetCustomerByEmailAndId(email, customerId);
        }

        public async Task<OrderDetails> GetLatestOrder(string customerId)
        {
            if (string.IsNullOrEmpty(customerId))
            {
                throw new ArgumentException("Customer ID cannot be null or empty.", nameof(customerId));
            }

            // Call the repository method to get the latest order
            return await _orderRepository.GetLatestOrderAsync(customerId);


        }

        // Add additional methods to retrieve the order details and format response
    }

}
