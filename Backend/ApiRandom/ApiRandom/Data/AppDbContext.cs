using ApiRandom.Models;
using Microsoft.EntityFrameworkCore;

namespace ApiRandom.Data
{
    public class AppDbContext: DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<People> People { get; set; }
    }
}
