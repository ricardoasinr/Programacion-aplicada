using Microsoft.EntityFrameworkCore;
using prueba.Models;

namespace prueba.Data
{
    public class AppDbContext: DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }
        public DbSet<pruebas> pruebas { get; set; }
    }
}
