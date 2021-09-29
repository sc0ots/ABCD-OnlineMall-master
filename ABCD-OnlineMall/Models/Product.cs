using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

#nullable disable

namespace ABCD_OnlineMall.Models
{
    public partial class Product
    {
        public int ProductId { get; set; }
        public string ProductName { get; set; }
        public int? StoreId { get; set; }
        public int? BrandId { get; set; }
        public string Category { get; set; }
        public string ImageName { get; set; }
        [NotMapped]
        [Display(Name = "Upload File")]
        [Required]
        public IFormFile ImageFile { get; set; }
        public virtual Brand Brand { get; set; }
        public virtual Store Store { get; set; }
    }
}
