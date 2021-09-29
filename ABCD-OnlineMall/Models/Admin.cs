using Microsoft.AspNetCore.Identity;
using System;
using System.Collections.Generic;


#nullable disable

namespace ABCD_OnlineMall.Models
{
    public partial class Admin 
    {
        public int AdminId { get; set; }
        public string AdminName { get; set; }
        public string AdminPassword { get; set; }
    }
}
