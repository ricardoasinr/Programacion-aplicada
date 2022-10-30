using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Ayudantia14.Data;
using Ayudantia14.Models;

namespace Ayudantia14.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class MateriaController : ControllerBase
    {
        private readonly AppDbContext _context;

        public MateriaController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Materia
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Materias>>> GetMaterias()
        {
            return await _context.Materias.ToListAsync();
        }

        // GET: api/Materia/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Materias>> GetMaterias(int id)
        {
            var materias = await _context.Materias.FindAsync(id);

            if (materias == null)
            {
                return NotFound();
            }

            return materias;
        }

        // PUT: api/Materia/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> PutMaterias(int id, Materias materias)
        {
            if (id != materias.materiaId)
            {
                return BadRequest();
            }

            _context.Entry(materias).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!MateriasExists(id))
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

        // POST: api/Materia
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<Materias>> PostMaterias(Materias materias)
        {
            _context.Materias.Add(materias);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetMaterias", new { id = materias.materiaId }, materias);
        }

        // DELETE: api/Materia/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteMaterias(int id)
        {
            var materias = await _context.Materias.FindAsync(id);
            if (materias == null)
            {
                return NotFound();
            }

            _context.Materias.Remove(materias);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool MateriasExists(int id)
        {
            return _context.Materias.Any(e => e.materiaId == id);
        }
    }
}
