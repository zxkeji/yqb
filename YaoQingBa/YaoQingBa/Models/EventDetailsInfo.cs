using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YaoQingBa.Models
{
    public class EventDetailsInfo
    {
        public Dictionary<string, object> value { get; set; }
        public List<Dictionary<string, object>> val_content { get; set; } 
        public Dictionary<string, object>  values { get; set; }
       
        public ArrayList photographList { get; set; }
        public   ArrayList afficheSignList  { get; set; }
        public ArrayList afficheChargeList { get; set; }
        public string a { get; set; } 
    
    }
}