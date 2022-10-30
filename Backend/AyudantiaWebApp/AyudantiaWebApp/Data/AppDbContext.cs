using AyudantiaWebApp.Models;
using Microsoft.EntityFrameworkCore;

namespace AyudantiaWebApp.Data
{
    public class AppDbContext: DbContext
    {
        public DbSet<people> people { get; set; }

        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options) { 
          
        }
       
    }
}
