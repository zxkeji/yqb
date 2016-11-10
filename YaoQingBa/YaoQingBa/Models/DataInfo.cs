using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YaoQingBa.Models
{
    public class DataInfo:BaseInfo
    {
        public string x_title { get; set; }
        public int x_kind { get; set; }
        public int x_type { get; set; }
        public DateTime x_beginTime { get; set; }
        public DateTime x_endTime { get; set; }
        public string x_address { get; set; }
        public int x_mode { get; set; }
        public bool x_isCharge { get; set; }
        public float x_chargePrice { get; set; }
        public DateTime x_closeDate { get; set; }
        public bool x_isClose { get; set; }
        public string x_coverSummary { get; set; }
        public string x_coverImage { get; set; }
        public int x_readCount { get; set; }
        public int x_praiseCount { get; set; }
        public string p_nick { get; set; }
        public string p_sign { get; set; }
        public int p_sex{ get; set; }
        public string p_image { get; set; }
        public int count { get; set; }
        public List<Dictionary<string, object>> list { get; set; } 
    }
}