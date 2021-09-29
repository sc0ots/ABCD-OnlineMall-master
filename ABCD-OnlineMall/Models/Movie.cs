using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace ABCD_OnlineMall.Models
{
    public partial class Movie
    {
        public Movie()
        {
            Cinemas = new HashSet<Cinema>();
        }

        public int MovieId { get; set; }
        public string Title { get; set; }
        public string Director { get; set; }
        public string Cast { get; set; }
        public string Description { get; set; }
        public int? Duration { get; set; }
        public string Trailer { get; set; }
        public string ImageName { get; set; }
        public int? CinemaId { get; set; }
        public int? Price { get; set; }
        [NotMapped]
        [Display(Name = "Upload File")]
        [Required]
        public IFormFile ImageFile { get; set; }

        public virtual Cinema Cinema { get; set; }
        public virtual ICollection<Cinema> Cinemas { get; set; }
    }
}
