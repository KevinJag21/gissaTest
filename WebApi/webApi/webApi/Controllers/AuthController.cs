using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using webApi.Bl;
using webApi.Dom;
using Microsoft.Extensions.Configuration;


using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using Microsoft.IdentityModel.Tokens;

namespace webApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IConfiguration _configuration;
        private BlUser blUser;

        public AuthController(IConfiguration configuration)
        {
            _configuration = configuration;
            this.blUser = new BlUser(_configuration.GetConnectionString("GissaDBconn"));
        }

        [HttpGet]
        public JsonResult Get()
        {

            List<string> list = blUser.getSoftSkill();

            return new JsonResult(list);
        }

        [HttpPost]
        public IActionResult Authentication(UserLogin login)
        {
            //if it is a valid user
            User user = blUser.login(login.email,login.password);
            if (user != null){

                //llamar al bl
                var token = GenerateToken(user);
                return Ok(new { token, user });
            }

            return NotFound();
        }

        private string GenerateToken(User security)
        {
            //Header
            var symmetricSecurityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["Authentication:SecretKey"]));
            var signingCredentials = new SigningCredentials(symmetricSecurityKey, SecurityAlgorithms.HmacSha256);
            var header = new JwtHeader(signingCredentials);

            //Claims
            var claims = new[]
            {
                new Claim(ClaimTypes.Name, security.name),
                new Claim(ClaimTypes.Email, security.email),
                new Claim(ClaimTypes.Role, security.userType),
            };

            //Payload
            var payload = new JwtPayload
            (
                _configuration["Authentication:Issuer"],
                _configuration["Authentication:Audience"],
                claims,
                DateTime.Now,
                DateTime.UtcNow.AddMinutes(10)
            );

            var token = new JwtSecurityToken(header, payload);

            return new JwtSecurityTokenHandler().WriteToken(token);
        }
    }
}
