using System;
using System.Collections.Generic;

#nullable disable

namespace ABCD_OnlineMall.Models
{
    public partial class Cinema
    {
        public Cinema()
        {
            Movies = new HashSet<Movie>();
            Seatreserves = new HashSet<Seatreserve>();
        }

        public int CinemaId { get; set; }
        public int? CinemaNo { get; set; }
        public int? MovieId { get; set; }

        public virtual Movie Movie { get; set; }
        public virtual ICollection<Movie> Movies { get; set; }
        public virtual ICollection<Seatreserve> Seatreserves { get; set; }
    }
}
