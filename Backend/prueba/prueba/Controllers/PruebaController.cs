using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using prueba.Data;
using prueba.Models;

namespace prueba.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class PruebaController : ControllerBase
    {
        private readonly AppDbContext _context;

        public PruebaController(AppDbContext context)
        {
            _context = context;
        }

        // GET: api/Prueba
        [HttpGet]
        public async Task<ActionResult<IEnumerable<pruebas>>> Getpruebas()
        {
            return await _context.pruebas.ToListAsync();
        }

        // GET: api/Prueba/5
        [HttpGet("{id}")]
        public async Task<ActionResult<pruebas>> Getpruebas(int id)
        {
            var pruebas = await _context.pruebas.FindAsync(id);

            if (pruebas == null)
            {
                return NotFound();
            }

            return pruebas;
        }

        // PUT: api/Prueba/5
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPut("{id}")]
        public async Task<IActionResult> Putpruebas(int id, pruebas pruebas)
        {
            if (id != pruebas.pruebaId)
            {
                return BadRequest();
            }

            _context.Entry(pruebas).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!pruebasExists(id))
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

        // POST: api/Prueba
        // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
        [HttpPost]
        public async Task<ActionResult<pruebas>> Postpruebas(pruebas pruebas)
        {
            _context.pruebas.Add(pruebas);
            await _context.SaveChangesAsync();

            return CreatedAtAction("Getpruebas", new { id = pruebas.pruebaId }, pruebas);
        }

        // DELETE: api/Prueba/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> Deletepruebas(int id)
        {
            var pruebas = await _context.pruebas.FindAsync(id);
            if (pruebas == null)
            {
                return NotFound();
            }

            _context.pruebas.Remove(pruebas);
            await _context.SaveChangesAsync();

            return NoContent();
        }

        private bool pruebasExists(int id)
        {
            return _context.pruebas.Any(e => e.pruebaId == id);
        }
    }
}
