using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MainProject.Models;
using System.Data;

namespace MainProject.Controllers
{
    public class ReceptionController : Controller
    {
        //
        // GET: /Reception/
        DBManager Dbm = new DBManager();
        MySmsSender sms = new MySmsSender();
        EmailSender em = new EmailSender();
        string cmd="";
        string res="";
        DataTable dt;
        string date=DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt");
        object ob;
        static int otp;

        //For Session MAnagemebnt...............................
        [NonAction]
        private bool isValidUser()
        {
            if (Session["userid"] != null)
            {
                string uid = Session["userid"].ToString();
                //  string[] ar = Dbm.getNameAndPhoto(uid);
                //   ViewBag.name = ar[0];
                //  ViewBag.pic = ar[1];
                return true;
            }
            else
            {
                return false;
            }
        }
        [HttpGet]
        public ActionResult login()
        {
            return View();
        }
        [HttpPost]
        public ActionResult login(string user,string password)
        {
            object ob = Dbm.GetSingleVaue("select *from login where Userid='" + user + "' and password='" + password + "' and IDType='Receptionist'");
            if (ob != null)
            {
                dt = Dbm.ExecuteSelect("select status from login where Userid='" + user + "' and password='" + password + "' and IDType='Receptionist'");
                foreach (DataRow dr in dt.Rows)
                {
                    if (dr["status"].ToString() == "True")
                    {
                        if (Dbm.ExecuteInsertUpdateDelete("update login set LastLogin='" + date + "' where Userid='" + user + "' and password='" + password + "' and IDType='Receptionist'") == true)
                        {
                            Session["userid"] = user;
                            return RedirectToAction("Dashboard", "Reception");
                        }
                    }
                    else
                        res = "Your Account is Blocked!. Please Contact to Our Administration to fix it.";
                }
            }
            else
                res = "Invalid Username or Password.";
            ViewBag.msg = res;
            return View();
        }

        /// <summary>
        /// Dashboard Page...................
        /// </summary>
        /// <returns></returns>
        public ActionResult Dashboard()
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Reception");
            }
            return View();
        }


        /// <summary>
        /// To Guest Record...........................................
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult NewGuest(string name, string number, string email, string idd)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Reception");
            }
            ViewBag.idd = idd;
            ViewBag.name = name;
            ViewBag.number = number;
            ViewBag.email = email;
            return View();
        }
        [HttpPost]
        public ActionResult NewGuest(string onid,string name, string email, string number, int adults, int child, string cin, string cout, string addr, string idtype, string IDNumber)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Reception");
            }
            if (onid != null)
            {
                cmd = "update OnlineRequest set User_Status='True' where User_id='" + onid + "'";
                Dbm.ExecuteInsertUpdateDelete(cmd);
            }
            TimeSpan x = DateTime.Parse(cout) - DateTime.Parse(cin);
            int day = int.Parse(x.Days.ToString());
            cmd = "insert into GuestDetail values('" + name + "','" + email + "','" + number + "','" + adults + "','" + child + "','" + cin + "','" + cout + "','" + addr + "','" + idtype + "','" + IDNumber + "','"+date+"','')";
            if (Dbm.ExecuteInsertUpdateDelete(cmd) == true)
            {
                res = "Hello Mr./Mrs. " + name + ", Thanks For Provoide us This Favour. We'll Give our best in your servicing. We are Processing on your Request with in few seconds.                                        Team #Svarnima.";
                sms.SendSMS(number, res);
                em.SendTo = email;
                em.Subject = "no-reply";
                em.Message = res;
                em.sendMyEmail();
                ob=Dbm.GetSingleVaue("select Max(Guest_ID) from GuestDetail");
                return RedirectToAction("Booking", "Reception", new { gid =  ob.ToString(),day=day});
            }
            else
                ViewBag.msg = "Some Error Accured";
            return View();
        }



        /// <summary>
        /// ///Room Booking for Guest.........................
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Booking(int gid, int day)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Reception");
            }
            ViewBag.day = day;
            ViewBag.msg = gid;
            
            return View();
        }
        [HttpPost]
        public ActionResult Booking(string name,string email,string number, int id, int no_room,int adv,int Due,int total)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Reception");
            }
            string roomid="SV";
            int srno=0;
            string dy = DateTime.Now.Year.ToString().Substring(2);
            roomid = roomid + dy;
            cmd = "select *from RoomBooking where Book_id=(select max(Book_id) from RoomBooking)";
            DataTable dt = Dbm.ExecuteSelect(cmd);
            if (dt.Rows.Count == 0)
                srno = 0;
            else
                foreach(DataRow dr in dt.Rows)
                {
                    string ii = dr[0].ToString();
                    int x = int.Parse(ii.Substring(4));
                    x++;
                    srno = x;
                }
            if(srno<10)
                roomid = roomid + "000" + srno;
            else if(srno<100&&srno>9)
                roomid = roomid + "00" + srno;
            else if(srno<1000&&srno>99)
                roomid = roomid + "0" + srno;
            else
                roomid = roomid + srno;
            cmd = "insert into RoomBooking values('"+roomid+"','"+name+"','"+id+"','"+no_room+"','"+adv+"','"+Due+"','"+total+"','"+adv+"','"+date+"','')";
            if (Dbm.ExecuteInsertUpdateDelete(cmd) == true)
            {
                res = "Congratulations Mr/Mrs. "+name+". Your Room is Successfully Booked. Thanks for Stay Here.";
                sms.SendSMS(number, res);
                em.SendTo = email;
                em.Message = res;
                em.Subject="no-reply";
                em.sendMyEmail();
                return RedirectToAction("printRecipt", new { roomid = roomid });
            }
            ViewBag.res = "Some Error Occured";
            return View();
        }
        


        /// <summary>
        /// Print Invoice..................
        /// </summary>
        /// <param name="gid"></param>
        /// <returns></returns>
        [HttpGet]
        public ActionResult printRecipt(string roomid)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Reception");
            } 
            ViewBag.msg = roomid;
            return View();
        }
        [HttpPost]
        public ActionResult printRecipt(string rid,string x)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Reception");
            }
            cmd="update roombooking set book_paid=(select book_total from roombooking where book_id='"+rid+"'), book_due='0' where book_id='"+rid+"'";
            if (Dbm.ExecuteInsertUpdateDelete(cmd) == true)
                return RedirectToAction("printRecipt", new { roomid = rid });
            return View();
        }


        /// <summary>
        /// To Manage Guest Details................
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GuestDetail()
        {

            return View();
        }
        [HttpPost]
        public ActionResult GuestDetail(string s)
        {
            return View();
        }



        /// <summary>
        /// Chenge Password................
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult ChangePassword()
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Reception");
            }
            return View();
        }
        [HttpPost]
        public ActionResult ChangePassword(string old,string pass,string cpaas)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Reception");
            }
            string id = Session["userid"].ToString();
            if (pass.Equals(cpaas))
                if (Dbm.ExecuteInsertUpdateDelete("Update login set password='" + pass + "' where userid='" + id + "' and password='" + old + "'") == true)
                    res = "Password Changed Succefully";
                else
                    res = "Invalid Current Password";
            else
                res = "New Password and Confirm Password Does not Match";
            ViewBag.msg = res;
            return View();
        }


        /// <summary>
        /// To Manage Extra Bill................
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult GenerateBill()
        {
            return View();
        }
        [HttpPost]
        public ActionResult GenerateBill(string s)
        {
            return View();
        }

        /// <summary>
        /// To Manage Online Request................
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult OnlineRequest()
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Reception");
            }
            return View();
        }
        [HttpPost]
        public ActionResult OnlineRequest(string s)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Reception");
            }
            return View();
        }


        /// <summary>
        /// To Manage Online Request................
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult Checkout()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Checkout(string id)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Reception");
            }
            
            cmd = "select Guest_ID from RoomBooking where Book_id='"+id+"'";
            object ob = Dbm.GetSingleVaue(cmd);
            if (ob != null)
            {
                string idd = ob.ToString();
                cmd = "select check_in from GuestDetail where Guest_ID='" + ob.ToString() + "'";
                ob = Dbm.GetSingleVaue(cmd);
                if (ob != null)
                {
                    string dd = ob.ToString();
                    date = DateTime.Now.ToString("yyyy-MM-dd");
                    TimeSpan x = DateTime.Parse(date) - DateTime.Parse(dd);
                    cmd = "select No_room, Book_Due from RoomBooking where Book_id='" + id + "'";
                    DataTable dt = Dbm.ExecuteSelect(cmd);
                    foreach (DataRow dr in dt.Rows)
                    {
                        int to;
                        int day = int.Parse(x.Days.ToString());
                        to = day * int.Parse(dr[0].ToString())*999;
                        int due = to - int.Parse(dr[1].ToString());
                        cmd = "update RoomBooking set Book_total='" + to + "', Book_Due='"+due+"', Check_out='" + date + "'where Book_id='" + id + "' ";
                        string cmd1 = "update GuestDetail set check_out='" + date + "', mainCheck_out='" + date + "'where Guest_ID='" + idd + "' ";
                        Dbm.ExecuteInsertUpdateDelete(cmd);
                        Dbm.ExecuteInsertUpdateDelete(cmd1);
                        return RedirectToAction("printRecipt", new { roomid = id });
                    }
                    
                    return View();
                }
            }
            //string cmd2 = "update GuestDetail set check_out='"+date+"' maincheck-out='" + date + "' where Book_id='" + id + "'";
            
            return View();
        }



        /// <summary>
        /// /Logout.....................
        /// </summary>
        /// <returns></returns>
        public ActionResult logout()
        {
            Session.Clear();
            Session.Abandon();
            return View();
        }



        /// <summary>
        /// Forgotten Password................
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult ForgetPassword()
        {
            return View();
        }
        static string pwdu;
        [HttpPost]
        public ActionResult ForgetPassword(string user)
        {
            cmd = "select rec_number from Receptionist where Rec_id='" + user + "'";
            pwdu = user;
            ob = Dbm.GetSingleVaue(cmd);
            if (ob != null)
            {
                Random r = new Random();
                otp = r.Next(10000, 999999);
                res = "Your  Account Verification OTP code is " + otp + ". Code valid for 10 minuts only, one time use.Please DO NOT share this OTP with anyone.";
                if (sms.SendSMS(ob.ToString(), res) == true)
                    return RedirectToAction("verify");
                else
                    ViewBag.msg="Some Error Occured";
            }
            ViewBag.msg = "Invalid User Name";
            return View();
        }
        [HttpGet]
        public ActionResult verify()
        {
            return View();
        }
        [HttpPost]
        public ActionResult verify(int ot)
        {
            if (ot == otp)
                return RedirectToAction("change");
            return View();
        }
        [HttpGet]
        public ActionResult change()
        {
            return View();
        }
        [HttpPost]
        public ActionResult change(string pass,string cpass)
        {
            if (pass == cpass)
            {
                cmd = "update login set Password='" + pass + "' where Userid='" + pwdu + "'";
                if (Dbm.ExecuteInsertUpdateDelete(cmd) == true)
                {
                    TempData["msg"] = "Password Change Successfully";
                    return RedirectToAction("login");
                }
            }
            ViewBag.msg = "Password and Conform Passwoord Not Match";
            return View();
        }
    }
}
 