using Microsoft.EntityFrameworkCore;
using PersonAPI.Models;

namespace PersonAPI.Data
{
    public class AppDbContext: DbContext
    {

        public DbSet<People> People { get; set; }

        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {

        }

     
    }
    

}
