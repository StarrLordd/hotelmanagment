using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MainProject.Models;
using System.IO;
using System.Data;

namespace MainProject.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        DBManager Dbm = new DBManager();
        MySmsSender Sms = new MySmsSender();
        EmailSender em = new EmailSender();
        string res = "";

        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Index(string cin, string cout, string child, string room)
        {
            TimeSpan  x = DateTime.Parse(cout) -DateTime.Parse(cin);
            int day = int.Parse(x.Days.ToString());
            return RedirectToAction("Booking", new { room = room,day=day,cin=cin });
        }
        [HttpGet]
        public ActionResult OurCampus()
        {
            return View();
        }
        [HttpPost]
        public ActionResult OurCampus(string s)
        {
            return View();
        }
        [HttpGet]
        public ActionResult HotelRooms()
        {
            return View();
        }
        [HttpGet]
        public ActionResult feedback()
        {
            return View();
        }
        [HttpPost]
        public ActionResult feedback(string s)
        {
            return View();
        }
        public ActionResult saveFeed(string fname, string subject, string numb, string mssg, int star)
        {
           // HttpPostedFileBase fb = Request.Files["pic"];
         //   string Filename = Path.GetRandomFileName() + fb.FileName;
          //  fb.SaveAs(Server.MapPath("/Content/Feedback/" + Filename));
            string mycommand = "insert into feedback(name,subject,MobileNo,feedback,star,date) values('" + fname + "','" + subject + "'," + numb + "','" + mssg + "','" + star + "','" + DateTime.Now.ToString() + "')";
            if (Dbm.ExecuteInsertUpdateDelete(mycommand) == true)
            {
                MySmsSender ss = new MySmsSender();
                string s = "Hello Mr. " + fname + ", Thanks for your review. We'll sortly perform action in your Feedback. Thank you.";
                bool b=ss.SendSMS(numb, s);
                res = "Thanks For your Feedback!";
            }
            else
            {
                res = "Sorry Something went Wrong";
            }
            return Json(res, JsonRequestBehavior.AllowGet);
        }
        public ActionResult Enquiry(string name, string email, string subject, string message)
        {
            string cmd = "insert into Enquiry values('"+name+"','"+email+"','"+subject+"','"+message+"','"+DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt")+"','false')";
            if (Dbm.ExecuteInsertUpdateDelete(cmd) == true)
                res = "Your message has been sent. Thank you!";
            else
                res = "Some Error Occured";
            TempData["msg"] = res;
            return RedirectToAction("index","Home");
        }

        [HttpGet]
        public ActionResult Booking(int day,string room,string cin)
        {
            int total = day * int.Parse(room) * 999;
            string t = total.ToString();
            ViewBag.cin = cin;
            ViewBag.total = t;
            ViewBag.day = day.ToString();
            ViewBag.room = room;
            return View();
        }
        [HttpPost]
        public ActionResult Booking(int day, string room,string name,string number,string email,string addr,int price, string cin)
        {
            string cmd = "select * from OnlineRequest where User_id=(select MAX(User_ID) from OnlineRequest)";
            string gid = "GUEST";
            int srno=0;
            string dy = DateTime.Now.Year.ToString().Substring(2);
            gid = gid + dy;
            DataTable dt=Dbm.ExecuteSelect(cmd);
            if (dt.Rows.Count == 0)
            {
                srno = 0;
            }
            else
            {
                foreach (DataRow dr in dt.Rows)
                {
                    string ii = dr[0].ToString();
                    int x = int.Parse(ii.Substring(7));
                    x++;
                    srno = x;
                }
            }
            gid = gid + "000" + srno;
            string mycmd = "insert into OnlineRequest values('" + gid + "','" + name + "','" + number + "','" + email + "','" + addr + "','" + day + "','" + room + "','" + price + "','False','" + DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt") + "')";
            if (Dbm.ExecuteInsertUpdateDelete(mycmd) == true)
            {
                res = "Thanks for you Request of Room Booking in Hotel Svarnima. Please Reach hotel at " + cin + ".";
                Sms.SendSMS(number, res);
                em.SendTo = email;
                em.Subject = "no-reply";
                em.Message = res;
                em.sendMyEmail();
                ViewBag.Msg = "Request Succesfully Submitted. Please Reach Hotel at the Time as you Entered";
            }
            else
                ViewBag.Msg = "Some Error Occured";
            return View();
        }
    }
}
