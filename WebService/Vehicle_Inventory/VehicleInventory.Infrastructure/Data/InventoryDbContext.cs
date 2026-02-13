using Microsoft.EntityFrameworkCore;
using VehicleInventory.Domain.Entities;

namespace VehicleInventory.Infrastructure.Data
{
    public class InventoryDbContext : DbContext
    {
        public InventoryDbContext(DbContextOptions<InventoryDbContext> options) : base(options) { }

        public DbSet<Vehicle> Vehicles { get; set; }
        public DbSet<Location> Locations { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);
            
            modelBuilder.Entity<Vehicle>(entity => {
                entity.ToTable("YW_Vehicles");
                entity.HasKey(e => e.Id);
                
                entity.Property(e => e.VehicleCode)
                      .IsRequired()
                      .HasMaxLength(50); // Typical constraint

                entity.Property(e => e.LocationId)
                      .IsRequired();

                entity.Property(e => e.VehicleType)
                      .IsRequired()
                      .HasMaxLength(50);

                entity.Property(e => e.Status)
                      .HasConversion<string>() // Store Enum as String in DB
                      .IsRequired();
            });

            modelBuilder.Entity<Location>(entity =>
            {
                entity.ToTable("YW_Locations");
                entity.HasKey(e => e.Id);

                entity.Property(e => e.LocationCode)
                    .IsRequired()
                    .HasMaxLength(20);

                entity.Property(e => e.LocationName)
                    .IsRequired()
                    .HasMaxLength(100);
            });
        }
    }
}
