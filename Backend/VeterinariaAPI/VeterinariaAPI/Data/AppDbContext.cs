using Microsoft.EntityFrameworkCore;
using VeterinariaAPI.Models;

namespace VeterinariaAPI.Data
{
    public class AppDbContext: DbContext
    {
        public DbSet<Animals> Animals { get; set; }

        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {

        }
    }
}
