using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace ABCD_OnlineMall.Models
{
    public partial class Store
    {
        public Store()
        {
            Brands = new HashSet<Brand>();
            Plots = new HashSet<Plot>();
            Products = new HashSet<Product>();
        }

        public int StoreId { get; set; }
        public string StoreName { get; set; }
        public TimeSpan? OpenTime { get; set; }
        public TimeSpan? CloseTime { get; set; }
        public string ImageName { get; set; }
        public string PromoImageName { get; set; }
        public string StoreAbout { get; set; }
        public string StoreDescription { get; set; }
        public string StoreCategory { get; set; }
        public int? PlotId { get; set; }
        [NotMapped]
        [Display(Name = "Upload File")]
        [Required]
        public IFormFile ImageFile { get; set; }
        [NotMapped]
        [Display(Name = "Promo File")]
        [Required]
        public IFormFile ImagePromo { get; set; }

        public virtual Plot Plot { get; set; }
        public virtual ICollection<Brand> Brands { get; set; }
        public virtual ICollection<Plot> Plots { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
