using ApiRandom.Data;
using ApiRandom.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;

namespace ApiRandom.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class RandomController : ControllerBase
    {
        private readonly AppDbContext _context;

        public RandomController(AppDbContext context)

        {

            _context = context;

        }

        [HttpGet]

        public async Task<ActionResult<People>> GetFuturos()

        {

            var list = await _context.People.ToListAsync();

            var max = list.Count;

            int index = new Random().Next(0, max);

            var people = list[index];



            if (people == null)

            {

                return NoContent();

            }

            return people;

        }
    }
}
