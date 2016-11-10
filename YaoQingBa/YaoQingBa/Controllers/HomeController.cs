using System;
using System.Collections;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Mvc;
using System.Web.Script.Serialization;
using YaoQingBa.App_Start;
using YaoQingBa.Models;

namespace YaoQingBa.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        public ActionResult Index()
        {

            DataInfo Model = new DataInfo();
            int clientPlatform = 4;
            //viewLite viewLite = new viewLite { frameName = "EcrpSole", viewName = "ProfileTable" };
            viewLite viewLite = new viewLite { frameName = "EcrpMain", viewName = "AfficheTable" };
            sortInfo sortInfo = new sortInfo { sortType = 6 };
            searchInfo searchInfo = new searchInfo { allowDrop = false, pageCount = 20, pageIndex = 1, sortInfo = sortInfo }; ;
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("clientPlatform", clientPlatform);
            parameters.Add("viewLite", viewLite);
            parameters.Add("searchInfo", searchInfo);
            string jsonStr = ToJson.ScriptSerialize(parameters);
            string url = "Http://61.155.203.29:60214/service.svc/ReadDatasBySearchInfo2";
            string resultStr = HttpCode.Post(url, jsonStr);
            Dictionary<string, object> obj = JsonTo.ScriptDeserialize(resultStr);
            string value = obj["value"].ToString();
            List<Dictionary<string, object>> val = JsonTo.ScriptDeserializeList(value);
            //Model.count = val.Count;
            Model.list = val;
            //foreach (Dictionary<string, object> s in val)
            //{
            //    Model.id = Convert.ToInt32(s["id"]);
            //    Model.uid = Convert.ToInt32(s["uid"]);
            //    Model.cid = Convert.ToInt32(s["cid"]);
            //    Model.firstTime = Convert.ToDateTime(s["firstTime"]);
            //    Model.lastTime = Convert.ToDateTime(s["lastTime"]);
            //    Model.isDrop = Convert.ToBoolean(s["isDrop"]);
            //    object a= s["values"];
            //    Dictionary<string, object> values= a as Dictionary<string, object>;
            //    Model.x_title = values["x.title"].ToString();
            //    Model.x_kind = Convert.ToInt32(values["x.kind"]);
            //    Model.x_type = Convert.ToInt32(values["x.type"]);
            //    Model.x_beginTime = Convert.ToDateTime(values["x.beginTime"]);
            //    Model.x_endTime = Convert.ToDateTime(values["x.beginTime"]);
            //    Model.x_address= values["x.address"].ToString();
            //    Model.x_mode = Convert.ToInt32(values["x.mode"]);
            //    Model.x_isCharge = Convert.ToBoolean(values["x.isCharge"]);
            //    Model.x_chargePrice = Convert.ToSingle(values["x.chargePrice"]);
            //    Model.x_isClose = Convert.ToBoolean(values["x.isClose"]);
            //    Model.x_coverSummary = values["x.coverSummary"].ToString();
            //    Model.x_coverImage = values["x.coverImage"].ToString();
            //    Model.x_readCount = Convert.ToInt32(values["x.readCount"]);
            //    Model.x_praiseCount = Convert.ToInt32(values["x.praiseCount"]);
            //    Model.p_nick = values["p.nick"].ToString();
            //    Model.p_sign = values["p.sign"].ToString();
            //    Model.p_sex = Convert.ToInt32(values["p.sex"]);
            //    Model.p_image = values["p.image"].ToString();
            //}


            // //HttpWebResponse response = HttpCode.CreatePostHttpResponse(url, null, Encoding.UTF8);  
            // //Stream stream = response.GetResponseStream();   //获取响应的字符串流  
            // //StreamReader sr = new StreamReader(stream); //创建一个stream读取流  
            // //string html = sr.ReadToEnd();   //从头读到尾，放到字符串html 
            return View(Model);
        }
        public ActionResult EventDetails()
        {
            EventDetailsInfo Model = new EventDetailsInfo();
            int id = Convert.ToInt32(Request.QueryString["id"]);

            int clientPlatform = 4;
            //viewLite viewLite = new viewLite { frameName = "EcrpSole", viewName = "ProfileTable" };
            //viewLite viewLite = new viewLite { frameName = "EcrpMain", viewName = "AfficheTable" };
            //viewLite viewLite = new viewLite { frameName = "EcrpMain", viewName = "AfficheItemTable" };
            viewLite viewLite = new viewLite { frameName = "EcrpMain", viewName = "SignItemTable" };
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("clientPlatform", clientPlatform);
            parameters.Add("viewLite", viewLite);
            parameters.Add("id", id);
            string jsonStr = ToJson.ScriptSerialize(parameters);
            string url = "Http://61.155.203.29:60214/service.svc/ReadDataById2";
            string resultStr = HttpCode.Post(url, jsonStr);
            Dictionary<string, object> obj = JsonTo.ScriptDeserialize(resultStr);
            Model.value = obj;
            string value = obj["value"].ToString();
            Dictionary<string, object> obj1 = JsonTo.ScriptDeserialize(value);
            Model.value = obj1;
            /*object转dic类型*/
            object values = obj1["values"];
            Dictionary<string, object> values1 = values as Dictionary<string, object>;
            Model.values = values1;
            string a = Model.values["x.title"].ToString();
            Model.a = a;
            string content = values1["x.content"].ToString();
            string chargeSetting = values1["x.chargeSetting"].ToString();
            string signSetting = values1["x.signSetting"].ToString();

            List<Dictionary<string, object>> val_content = JsonTo.ScriptDeserializeList(content);

            Model.val_content = val_content;
            foreach (Dictionary<string, object> cont in Model.val_content)
            {
                if (cont.ContainsKey("photographList"))
                {
                    ArrayList photographList = cont["photographList"] as ArrayList;
                    Model.photographList = photographList;
                    foreach (Dictionary<string, object> photogl in Model.photographList)
                    {
                        string address1 = photogl["address"].ToString();
                    }


                }
            }
            Dictionary<string, object> val_chargeSetting = JsonTo.ScriptDeserialize(chargeSetting);

            ArrayList afficheChargeList = val_chargeSetting["afficheChargeList"] as ArrayList;
            Model.afficheChargeList = afficheChargeList;
            foreach (Dictionary<string, object> affichecl in Model.afficheChargeList)
            {
                float money = Convert.ToSingle(affichecl["money"]);
                string count = affichecl["count"].ToString();
                string name = affichecl["name"].ToString();
                int chargeIndex = Convert.ToInt32(affichecl["chargeIndex"]);
            }





            Dictionary<string, object> val_signSetting = JsonTo.ScriptDeserialize(signSetting);
            ArrayList afficheSignList = val_signSetting["afficheSignList"] as ArrayList;
            Model.afficheSignList = afficheSignList;

            foreach (Dictionary<string, object> affichesl in Model.afficheSignList)
            {


                string name = affichesl["name"].ToString();
                int kind = Convert.ToInt32(affichesl["kind"]);
                string item = affichesl["item"].ToString();
            }


            return View(Model);
        }
        public ActionResult EnrollInfo()
        {
            return View();
        }
        public ActionResult PayInfo()
        {
            return View();
        }
       
        public ActionResult EntryRecord()
        {           
            int uid = Convert.ToInt32(Request.QueryString["uid"]);
            int aid = Convert.ToInt32(Request.QueryString["afficheID"]);      
            string afficheID = aid.ToString();
            EntryRecordInfo Model = new EntryRecordInfo();
            int clientPlatform = 4;
            viewLite viewLite = new viewLite { frameName = "EcrpMain", viewName = "AfficheTable" };
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("clientPlatform", clientPlatform);
            parameters.Add("viewLite", viewLite);
            parameters.Add("id", aid);
            string jsonStr = ToJson.ScriptSerialize(parameters);
            string url = "Http://61.155.203.29:60214/service.svc/ReadDataById2";
            string resultStr = HttpCode.Post(url, jsonStr);
            Dictionary<string, object> obj = JsonTo.ScriptDeserialize(resultStr);
            string value = obj["value"].ToString();
            Dictionary<string, object> s = JsonTo.ScriptDeserialize(value);
            object a = s["values"];
            Dictionary<string, object> values = a as Dictionary<string, object>;
                     
            int  a_uid = Convert.ToInt32(s["uid"]);
            if (a_uid == uid)
            {
                Model.issuccess = 1;
                Model.eventname = values["x.title"].ToString();
                viewLite viewLite2 = new viewLite { frameName = "EcrpMain", viewName = "SignTable" };
                sortInfo sortInfo = new sortInfo { sortType = 6 };
                ConditionInfo ConditionInfo_affichelID = new ConditionInfo { columnName = "afficheID", conditionKind = 0, columnValue = afficheID };

                List<ConditionInfo> conditions = new List<ConditionInfo>();
                conditions.Add(ConditionInfo_affichelID);

                searchInfo searchInfo = new searchInfo { allowDrop = false, pageCount = -1, sortInfo = sortInfo, conditions = conditions }; ;
                Dictionary<string, object> parameters2 = new Dictionary<string, object>();
                parameters2.Add("clientPlatform", clientPlatform);
                parameters2.Add("viewLite", viewLite2);
                parameters2.Add("searchInfo", searchInfo);
                string jsonStr2 = ToJson.ScriptSerialize(parameters2);
                string url2 = "Http://61.155.203.29:60214/service.svc/ReadDatasBySearchInfo2";
                string resultStr2 = HttpCode.Post(url2, jsonStr2);
                Dictionary<string, object> obj2 = JsonTo.ScriptDeserialize(resultStr2);

                object objvalue = obj2["value"];
                if (objvalue == null) { Model.list = null; Model.count = 0; }
                else
                {
                    string value2 = obj2["value"].ToString();
                    List<Dictionary<string, object>> val = JsonTo.ScriptDeserializeList(value2);
                    Model.list = val;
                    Model.count = val.Count();
                }
            }
            else {
                Model.issuccess = 0;
            }
            return View(Model);
        }

        public ActionResult ReviewLogin()
        {
            return View();
        }
        public ActionResult Review()
        {
            string username = Request.QueryString["username"];
            ReviewInfo Model = new ReviewInfo();
            Model.username = username;
            return View(Model);
        }
        public ActionResult WithdrawsCash()
        {
                  return PartialView();
        }
        public ActionResult WithdrawsCashList(int pageIndex, int state)
        {
            
            string state1 = state.ToString();
            ReviewInfo Model = new ReviewInfo();
            Model.pageIndex = pageIndex;
            int clientPlatform = 4;
            //viewLite viewLite = new viewLite { frameName = "EcrpSole", viewName = "ProfileTable" };
            viewLite viewLite = new viewLite { frameName = "EcrpMain", viewName = "CashView" };
            sortInfo sortInfo = new sortInfo { sortType = 6 };
            ConditionInfo ConditionInfo = new ConditionInfo { columnName = "state", conditionKind = 0, columnValue = state1 };
            List<ConditionInfo> conditions = new List<ConditionInfo>();
            conditions.Add(ConditionInfo);
            searchInfo searchInfo = new searchInfo { allowDrop = false, pageCount = 4, pageIndex = pageIndex, sortInfo = sortInfo, conditions = conditions }; ;
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("clientPlatform", clientPlatform);
            parameters.Add("viewLite", viewLite);
            parameters.Add("searchInfo", searchInfo);
            string jsonStr = ToJson.ScriptSerialize(parameters);
            string url = "Http://61.155.203.29:60214/service.svc/ReadDatasBySearchInfo2";
            string resultStr = HttpCode.Post(url, jsonStr);
            Dictionary<string, object> obj = JsonTo.ScriptDeserialize(resultStr);
            object objvalue = obj["value"];
            if (objvalue == null) { Model.list = null; Model.count = 0; }
            else
            {
                string value = obj["value"].ToString();
                List<Dictionary<string, object>> val = JsonTo.ScriptDeserializeList(value);
                Model.list = val;
                Model.count = val.Count();
            }


            return PartialView(Model);
        }
        public ActionResult IdentityReview()
        {
            return PartialView();
        }
        public ActionResult IdentityReviewList(int pageIndex, int state)
        {

            string state1 = state.ToString();
            ReviewInfo Model = new ReviewInfo();
            Model.pageIndex = pageIndex;
            int clientPlatform = 4;
            
            viewLite viewLite = new viewLite { frameName = "EcrpMain", viewName = "InspectView" };
            sortInfo sortInfo = new sortInfo { sortType = 6 };
            ConditionInfo ConditionInfo = new ConditionInfo { columnName = "state", conditionKind = 0, columnValue = state1 };
            List<ConditionInfo> conditions = new List<ConditionInfo>();
            conditions.Add(ConditionInfo);
            searchInfo searchInfo = new searchInfo { allowDrop = false, pageCount = 4, pageIndex = pageIndex, sortInfo = sortInfo, conditions = conditions }; ;
            Dictionary<string, object> parameters = new Dictionary<string, object>();
            parameters.Add("clientPlatform", clientPlatform);
            parameters.Add("viewLite", viewLite);
            parameters.Add("searchInfo", searchInfo);
            string jsonStr = ToJson.ScriptSerialize(parameters);
            string url = "Http://61.155.203.29:60214/service.svc/ReadDatasBySearchInfo2";
            string resultStr = HttpCode.Post(url, jsonStr);
            Dictionary<string, object> obj = JsonTo.ScriptDeserialize(resultStr);
            object objvalue = obj["value"];
            if (objvalue == null) { Model.list = null; Model.count = 0; }
            else
            {
                string value = obj["value"].ToString();
                List<Dictionary<string, object>> val = JsonTo.ScriptDeserializeList(value);
                Model.list = val;
                Model.count = val.Count();
            }


            return PartialView(Model);
        }
        
      
    }
}
