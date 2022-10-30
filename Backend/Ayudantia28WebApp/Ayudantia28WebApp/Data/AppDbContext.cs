using Ayudantia28WebApp.Models;
using Microsoft.EntityFrameworkCore;

namespace Ayudantia28WebApp.Data
{
    public class AppDbContext: DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<People> people { get; set; }
    }
}
