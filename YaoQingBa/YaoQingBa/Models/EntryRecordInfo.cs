using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace YaoQingBa.Models
{
    public class EntryRecordInfo
    {
        public List<Dictionary<string, object>> list { get; set; }
        public int count { get; set; }
        public int issuccess { get; set; }
        public string eventname { get; set; }
        
    }
}