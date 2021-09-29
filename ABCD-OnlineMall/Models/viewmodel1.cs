using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ABCD_OnlineMall.Models
{
    public class viewmodel1
    {
        public IEnumerable<Seat> Seat { get; set; }
        public IEnumerable<Seatreserve> Seatre2 { get; set; }
        public Seatreserve Seatre { get; set; }

        public Movie Movie { get; set; }
    }
}
