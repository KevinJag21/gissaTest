using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using webApi.Dom;
using webApi.Bl;
using Microsoft.Extensions.Configuration;


namespace webApi.Controllers
{

    [Route("api/[controller]")]
    [Controller]
    public class UserController : Controller
    {


        private readonly IConfiguration _configuration;
        private BlUser blUser; 

        public UserController(IConfiguration configuration)
        {
            _configuration = configuration;
            this.blUser = new BlUser(_configuration.GetConnectionString("GissaDBconn"));
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        public JsonResult Get() {

            List<string> list = blUser.getSoftSkill();

            return new JsonResult(list);
        }
    }
}
