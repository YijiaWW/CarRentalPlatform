namespace VehicleInventory.Domain.Entities
{
    public class Location
    {
        public int Id { get; private set; }
        public string LocationCode { get; private set; }
        public string LocationName { get; private set; }

        private Location()
        {
            LocationCode = string.Empty;
            LocationName = string.Empty;
        }

        public Location(string locationCode, string locationName)
        {
            LocationCode = locationCode;
            LocationName = locationName;
        }
    }
}
