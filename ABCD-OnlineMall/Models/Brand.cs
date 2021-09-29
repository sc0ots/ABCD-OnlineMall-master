using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace ABCD_OnlineMall.Models
{
    public partial class Brand
    {
        public Brand()
        {
            Products = new HashSet<Product>();
        }

        public int BrandId { get; set; }
        public string BrandName { get; set; }
        public string BrandUrl { get; set; }
        public string ImageName { get; set; }
        public int? StoreId { get; set; }
        [NotMapped]
        [Display(Name = "Upload File")]
        [Required]
        public IFormFile ImageFile { get; set; }

        public virtual Store Store { get; set; }
        public virtual ICollection<Product> Products { get; set; }
    }
}
