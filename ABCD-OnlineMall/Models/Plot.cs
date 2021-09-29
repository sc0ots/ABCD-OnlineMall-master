using System;
using System.Collections.Generic;

#nullable disable

namespace ABCD_OnlineMall.Models
{
    public partial class Plot
    {
        public Plot()
        {
            Stores = new HashSet<Store>();
        }

        public int PlotId { get; set; }
        public string PlotName { get; set; }
        public bool? IsEmpty { get; set; }
        public byte? Floor { get; set; }
        public int? StoreId { get; set; }

        public virtual Store Store { get; set; }
        public virtual ICollection<Store> Stores { get; set; }
    }
}
