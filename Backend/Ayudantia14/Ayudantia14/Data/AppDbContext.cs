using Ayudantia14.Models;
using Microsoft.EntityFrameworkCore;

namespace Ayudantia14.Data
{
    public class AppDbContext: DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<Materias> Materias { get; set; }
    }
}
