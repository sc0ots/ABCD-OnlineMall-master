using System;
using System.Collections.Generic;

#nullable disable

namespace ABCD_OnlineMall.Models
{
    public partial class Feedback
    {
        public int FeedbackId { get; set; }
        public string FeedbackSubject { get; set; }
        public string FeedbackContent { get; set; }
        public string UserEmail { get; set; }
        public DateTime? FeedbackDate { get; set; }
    }
}
