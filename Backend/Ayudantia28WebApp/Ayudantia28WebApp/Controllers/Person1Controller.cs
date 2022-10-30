using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ayudantia28WebApp.Data;
using Ayudantia28WebApp.Models;
//Este controlador se creó para tener una API y una WebApp en un mismo proyecto.
namespace Ayudantia28WebApp.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class Person1Controller : ControllerBase
    {
        private readonly AppDbContext _context;

        public Person1Controller(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Person1
        [HttpGet]
        public async Task<ActionResult<IEnumerable<People>>> Getpeople()
        {
            return await _context.people.ToListAsync();
        }

        // GET: api/Person1/5
        [HttpGet("{id}")]
        public async Task<ActionResult<People>> GetPeople(int id)
        {
            var people = await _context.people.FindAsync(id);

            if (people == null)
            {
                return NotFound();
            }

            return people;
        }

        // PUT: api/Person1/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPeople(int id, People people)
        {
            if (id != people.personId)
            {
                return BadRequest();
            }

            _context.Entry(people).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PeopleExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/Person1
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<People>> PostPeople(People people)
        {
            _context.people.Add(people);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetPeople", new { id = people.personId }, people);
        }

        // DELETE: api/Person1/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePeople(int id)
        {
            var people = await _context.people.FindAsync(id);
            if (people == null)
            {
                return NotFound();
            }

            _context.people.Remove(people);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool PeopleExists(int id)
        {
            return _context.people.Any(e => e.personId == id);
        }
    }
}
