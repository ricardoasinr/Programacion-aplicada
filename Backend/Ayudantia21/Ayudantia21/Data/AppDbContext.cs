

using Ayudantia21.Models;
using Microsoft.EntityFrameworkCore;

namespace Ayudantia21.Data
{
    public class AppDbContext: DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { }

        public DbSet<People> People { get; set; }
    }
}
