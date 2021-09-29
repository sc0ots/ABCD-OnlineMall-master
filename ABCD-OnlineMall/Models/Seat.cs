using System;
using System.Collections.Generic;

#nullable disable

namespace ABCD_OnlineMall.Models
{
    public partial class Seat
    {
        public Seat()
        {
            Seatreserves = new HashSet<Seatreserve>();
        }

        public int SeatId { get; set; }
        public int? SeatNo { get; set; }

        public virtual ICollection<Seatreserve> Seatreserves { get; set; }
    }
}
