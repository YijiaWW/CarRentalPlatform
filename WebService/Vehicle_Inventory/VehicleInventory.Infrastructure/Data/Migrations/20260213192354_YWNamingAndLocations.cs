using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace VehicleInventory.Infrastructure.Data.Migrations
{
    /// <inheritdoc />
    public partial class YWNamingAndLocations : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropPrimaryKey(
                name: "PK_Vehicles",
                table: "Vehicles");

            migrationBuilder.RenameTable(
                name: "Vehicles",
                newName: "YW_Vehicles");

            migrationBuilder.AddPrimaryKey(
                name: "PK_YW_Vehicles",
                table: "YW_Vehicles",
                column: "Id");

            migrationBuilder.CreateTable(
                name: "YW_Locations",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    LocationCode = table.Column<string>(type: "nvarchar(20)", maxLength: 20, nullable: false),
                    LocationName = table.Column<string>(type: "nvarchar(100)", maxLength: 100, nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_YW_Locations", x => x.Id);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "YW_Locations");

            migrationBuilder.DropPrimaryKey(
                name: "PK_YW_Vehicles",
                table: "YW_Vehicles");

            migrationBuilder.RenameTable(
                name: "YW_Vehicles",
                newName: "Vehicles");

            migrationBuilder.AddPrimaryKey(
                name: "PK_Vehicles",
                table: "Vehicles",
                column: "Id");
        }
    }
}
