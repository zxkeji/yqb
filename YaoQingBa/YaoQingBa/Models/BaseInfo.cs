using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YaoQingBa.Models
{
    public class BaseInfo
    {
        public int id { get; set; }
        public int uid { get; set; }
        public int cid { get; set; }
        public DateTime firstTime { get; set; }
        public DateTime lastTime { get; set; }
        public bool isDrop { get; set; }
       

    }
}