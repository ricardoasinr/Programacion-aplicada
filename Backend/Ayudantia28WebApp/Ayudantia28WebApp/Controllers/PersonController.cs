using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Ayudantia28WebApp.Data;
using Ayudantia28WebApp.Models;

namespace Ayudantia28WebApp.Controllers
{
    public class PersonController : Controller
    {
        private readonly AppDbContext _context;

        public PersonController(AppDbContext context)
        {
            _context = context;
        }

        // GET: Person
        public async Task<IActionResult> Index()
        {
              return View(await _context.people.ToListAsync());
        }

        // GET: Person/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.people == null)
            {
                return NotFound();
            }

            var people = await _context.people
                .FirstOrDefaultAsync(m => m.personId == id);
            if (people == null)
            {
                return NotFound();
            }

            return View(people);
        }

        // GET: Person/Create
        public IActionResult Create()
        {
            return View();
        }

        // POST: Person/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("personId,nombre,carrera,sextype")] People people)
        {
            if (ModelState.IsValid)
            {
                _context.Add(people);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(people);
        }

        // GET: Person/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.people == null)
            {
                return NotFound();
            }

            var people = await _context.people.FindAsync(id);
            if (people == null)
            {
                return NotFound();
            }
            return View(people);
        }

        // POST: Person/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("personId,nombre,carrera,sextype")] People people)
        {
            if (id != people.personId)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(people);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!PeopleExists(people.personId))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            return View(people);
        }

        // GET: Person/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.people == null)
            {
                return NotFound();
            }

            var people = await _context.people
                .FirstOrDefaultAsync(m => m.personId == id);
            if (people == null)
            {
                return NotFound();
            }

            return View(people);
        }

        // POST: Person/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.people == null)
            {
                return Problem("Entity set 'AppDbContext.people'  is null.");
            }
            var people = await _context.people.FindAsync(id);
            if (people != null)
            {
                _context.people.Remove(people);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool PeopleExists(int id)
        {
          return _context.people.Any(e => e.personId == id);
        }
    }
}
