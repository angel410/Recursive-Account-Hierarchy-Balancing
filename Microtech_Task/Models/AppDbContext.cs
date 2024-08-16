using Microsoft.EntityFrameworkCore;

namespace Microtech_Task.Models
{
    public class AppDbContext : DbContext
    {
        public DbSet<Account> Accounts { get; set; }

        public AppDbContext(DbContextOptions<AppDbContext> options) : base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Account>()
        .HasKey(a => a.Acc_number); // Set the primary key

            modelBuilder.Entity<Account>()
                .HasOne(a => a.Parent)
                .WithMany(a => a.Children)
                .HasForeignKey(a => a.Acc_parent);

        }
    }
}
