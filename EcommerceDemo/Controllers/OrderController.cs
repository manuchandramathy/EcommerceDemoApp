using Ecommerce.BusinessLogic;
using Ecommerce.Common.Request;
using Ecommerce.DataAccess.Entity;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;



namespace EcommerceDemo.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class OrderController : ControllerBase
    {
        private readonly OrderService _orderService;

        public OrderController(OrderService orderService)
        {
            _orderService = orderService;
        }

        [HttpPost("latest-order")]
        public IActionResult GetLatestOrder([FromBody] CustomerRequest request)
        {
            var customer = _orderService.GetCustomerByEmailAndId(request.User, request.CustomerId);
            if (customer == null)
            {
                return BadRequest("Invalid email or customer ID.");
            }

            var order = _orderService.GetLatestOrder(request.CustomerId);
            if (order == null)
            {
                return Ok(new { customer, order = (object)null });
            }

            return Ok(new { customer, order });
        }
    }

}
