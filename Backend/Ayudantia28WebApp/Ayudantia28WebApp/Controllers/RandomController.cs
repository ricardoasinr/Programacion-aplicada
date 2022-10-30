using Ayudantia28WebApp.Data;
using Ayudantia28WebApp.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace Ayudantia28WebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RandomController : ControllerBase
    {
        private readonly AppDbContext _context;
        public RandomController(AppDbContext context){
            _context = context;
        }

        [HttpGet]
        public async Task<ActionResult<People>> GetFuturos() //Donde está <People> ahi entra nuestro Model que estemos utilizando
        {
            var list = await _context.people.ToListAsync();
            var max = list.Count;
            int index = new Random().Next(0, max);
            var people = list[index];
            if (people == null){
                return NoContent();
            }
            
            return people;

        }


    }
}
