using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YaoQingBa.Models
{
    public class ReviewInfo
    {

    
        public string username { get; set; }
        public List<Dictionary<string, object>> list { get; set; }
        public int count { get; set; }
        public int pageIndex { get; set; }
        
    }
}