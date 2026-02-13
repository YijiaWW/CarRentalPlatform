using System.Collections.Generic;
using System.Threading.Tasks;
using VehicleInventory.Application.DTOs;

namespace VehicleInventory.Application.Services
{
    public interface IVehicleService
    {
        Task<YWVehicleDto> CreateVehicleAsync(YWCreateVehicleDto createDto);
        Task<YWVehicleDto?> GetVehicleByIdAsync(int id);
        Task<IEnumerable<YWVehicleDto>> GetAllVehiclesAsync();
        Task<bool> UpdateVehicleStatusAsync(int id, string status);
        Task<bool> DeleteVehicleAsync(int id);
    }
}
