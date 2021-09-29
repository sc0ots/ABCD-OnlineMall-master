using System;
using System.Collections.Generic;

#nullable disable

namespace ABCD_OnlineMall.Models
{
    public partial class Seatreserve
    {
        public int SeatreserveId { get; set; }
        public string SeatreserveName { get; set; }
        public DateTime? SeatreserveDate { get; set; }
        public int? SeatreserveCode { get; set; }
        public int? CinemaId { get; set; }
        public int? SeatId { get; set; }
        public TimeSpan? Showtime { get; set; }

        public virtual Cinema Cinema { get; set; }
        public virtual Seat Seat { get; set; }
    }
}
