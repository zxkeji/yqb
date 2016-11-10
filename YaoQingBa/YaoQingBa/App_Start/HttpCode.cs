using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Text;
using System.Net.Security;
using System.Security.Cryptography.X509Certificates;
using System.Net;
using System.IO;
using System.IO.Compression;
using System.Text.RegularExpressions;
using System.Runtime.Serialization;
using System.Reflection;
using System.Collections;
using System.Web.Script.Serialization;

namespace YaoQingBa.App_Start
{
    public static class HttpCode
    {
        public static string Post(string url, string jsonStr)
        {



            HttpWebRequest request = (HttpWebRequest)HttpWebRequest.Create(url);

            request.Method = "POST";
            request.ContentType = "application/json; charset=utf-8";

            //jsonStr = "{\"viewLite\":{\"frameName\":\"EcrpMain\",\"viewName\":\"AfficheTable\"},\"clientPlatform\":\"3\",\"searchInfo\":{\"allowDrop\":false,\"pageCount\":20,\"pageIndex\":1,\"sortInfo\":{\"sortType\":6}}}";

            byte[] data = Encoding.UTF8.GetBytes(jsonStr);
            using (Stream stream = request.GetRequestStream())
            {
                stream.Write(data, 0, data.Length);
            }

            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            if (response.StatusCode == HttpStatusCode.OK)
            {
                using (var streamReader = new StreamReader(response.GetResponseStream()))
                {
                    string  resultStr = streamReader.ReadToEnd();
                    return resultStr;
                }
               
            }
           
            response.Close();
            return null;
        }



    }

    public class viewLite
    {

        public string frameName { get; set; }

        public string viewName { get; set; }



    }
    public class sortInfo
    {

        public int sortType { get; set; }


    }

    public class ConditionInfo
    {
        public int conditionKind { get; set; }
        public string columnValue { get; set; }
         public string columnName { get; set; }
       
    }
    public class searchInfo
    {

        public bool allowDrop { get; set; }

        public int pageCount { get; set; }
        public int pageIndex { get; set; }
        public sortInfo sortInfo { get; set; }
        public List<ConditionInfo> conditions { get; set; }

    }
     
    public class ToJson
    {
       
        public static string ScriptSerialize( Dictionary<string, object>  parameters)
        {
            
            JavaScriptSerializer js = new JavaScriptSerializer();

            return js.Serialize(parameters);

        }

    }
    public class JsonTo
    {
        public static Dictionary<string,object> ScriptDeserialize(string resultStr)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Deserialize<Dictionary<string, object>>(resultStr);

        }
        public static List<Dictionary<string, object>> ScriptDeserializeList(string resultStr)
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
            return js.Deserialize<List<Dictionary<string, object>>>(resultStr);

        }

    }





}
