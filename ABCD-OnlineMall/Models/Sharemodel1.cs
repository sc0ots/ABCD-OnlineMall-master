using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ABCD_OnlineMall.Models
{
    public class Sharemodel1
    {
        public Store Stores { get; set; }
        public IEnumerable<Product> Products { get; set; }
        public IEnumerable<Brand> Brands { get; set; }
    }
}
