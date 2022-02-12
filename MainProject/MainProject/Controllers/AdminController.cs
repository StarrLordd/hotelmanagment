using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MainProject.Models;
using MainProject.App_Code;
using System.IO;
using System.Data;

namespace MainProject.Controllers
{
    public class AdminController : Controller
    {
        //
        // GET: /Admin/
        DBManager Dbm = new DBManager();
        MySmsSender SMS = new MySmsSender();
        EmailSender Em = new EmailSender();
        RandomGenrator rr = new RandomGenrator();

        string res = "";
        //Lgoin Page...........................
        [HttpGet]
        public ActionResult login()
        {
            Session.Clear();
            Session.Abandon();
            return View();
        }
        [HttpPost]
        public ActionResult login(String id,String pass)
        {
            
            String mycmd = "select *from Login where UserID='" + id + "' and password='" + pass + "' and IDType='admin'";
            object ob = Dbm.GetSingleVaue(mycmd);
            if (ob != null)
            {
                Session["userid"] = id;
                return RedirectToAction("Welcome", "Admin");
            }
            else
            {
                ViewBag.res = "Invalid UserName or Password";
                return View();
            }
        }


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


        //Welcome......................
        [HttpGet]
        public ActionResult Welcome()
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            return View();
        }
        


        //MAnage Slider..............................
        [HttpGet]
        public ActionResult ManageSlider()
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            return View();
        }
        [HttpPost]
        public ActionResult ManageSlider(string id,string titlee,string subtitle)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            HttpPostedFileBase fb = Request.Files["file"];
            string Filename = Path.GetRandomFileName() + fb.FileName;
            

            fb.SaveAs(Server.MapPath("/Content/SliderImages/" + Filename));
            string dt = DateTime.Now.ToString("dd/mm/yyy hh:MM:ss tt");
            string cmd = "update ManageSlider set Titlle='"+titlee+"', subtitle='"+subtitle+"',Image='"+Filename+"', date='"+dt+"' where sliderId='"+id+"'";
            bool b = Dbm.ExecuteInsertUpdateDelete(cmd);
            if (b == true)
                res = "Slider Updated SuccessFullly";
            else
                res = "Unable to Update";
            ViewBag.msg = res;
            return View();
        }

        //For Manage Room........................
        [HttpGet]
        public ActionResult ManageRoom()
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            return View();
        }
        [HttpPost]
        public ActionResult ManageRoom(string room)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            
            HttpPostedFileBase fb = Request.Files["file"];
            string Filename = Path.GetRandomFileName() + fb.FileName;
            fb.SaveAs(Server.MapPath("/Content/RoomImages/" + Filename));
            string dt=DateTime.Now.ToString("dd/mm/yyy hh:MM:ss tt");
            string cmd = "insert into ManageRoom values('" + room + "','" + Filename + "','" + dt + "')";
            bool b = Dbm.ExecuteInsertUpdateDelete(cmd);
            if (b == true)
                res = "Room Added SuccessFullly";
            else
                res = "Unable to add Room";
            ViewBag.msg = res;
            return View();
        }
        public ActionResult logout(){
            Session.Clear();
            Session.Abandon();
            return View();
        }
        public ActionResult DeleteRoom(string id)
        {
            bool b=Dbm.ExecuteInsertUpdateDelete("delete from ManageRoom where RoomID='"+id+"'");
            if (b == true)
            {
                TempData["msg"] = "Delete Record Successfully";
            }
            else
            {
                TempData["msg"] = "Unable to Delete";
            }
            return RedirectToAction("ManageRoom", "Admin");
        }



        //To manage Image GAllery.............................
       


        /// <summary>
        /// Manage Image GAllery
        /// </summary>
        /// <returns></returns>

        public ActionResult ManageImage()
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            return View();
        }
        [HttpPost]
        public ActionResult ManageImage(string titlee)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            HttpPostedFileBase fb = Request.Files["file"];
            string Filename = Path.GetRandomFileName() + fb.FileName;
            fb.SaveAs(Server.MapPath("/Content/Gallery/" + Filename));
            string dt = DateTime.Now.ToString("dd/mm/yyy hh:MM:ss tt");
            string cmd = "insert into ManageGallery values('" + titlee + "','" + Filename + "','true','" + dt + "')";
            bool b = Dbm.ExecuteInsertUpdateDelete(cmd);
            if (b == true)
                res = "Image Added SuccessFullly";
            else
                res = "Unable to add Content";
            ViewBag.msg = res;
            return View();
        }
        public ActionResult DeleteImage(string id)
        {
            TempData["msg"] = (Dbm.ExecuteInsertUpdateDelete("delete from ManageGallery where Gal_Id='" + id + "'") == true) ? "Deleted Successfully" : "Some Error Occcured";
            return RedirectToAction("ManageImage", "Admin");
        }

        //To manage Video GAllery.............................
        [HttpGet]
        public ActionResult ManageVideo()
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            return View();
        }
        [HttpPost]
        public ActionResult ManageVideo(string titlee,string link)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            string dt = DateTime.Now.ToString("dd/mm/yyy hh:MM:ss tt");
            string cmd = "insert into ManageGallery values('" + titlee + "','" + link + "','false','" + dt + "')";
            bool b = Dbm.ExecuteInsertUpdateDelete(cmd);
            if (b == true)
                res = "Video Added SuccessFullly";
            else
                res = "Unable to add Content";
            ViewBag.msg = res;
            return View();
        }
        public ActionResult DeleteVideo(string id)
        {
            TempData["msg"] = (Dbm.ExecuteInsertUpdateDelete("delete from ManageGallery where Gal_Id='" + id + "'") == true) ? "Deleted Successfully" : "Some Error Occcured";
            return RedirectToAction("ManageVideo", "Admin");
        }


        ////Manage Receptionist..............................
        [HttpGet]
        public ActionResult AddReception()
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            return View();
        }
        [HttpPost]
        public ActionResult AddReception(string name, string fname, string gender, string email, string number, string addr)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            int id=0;
            HttpPostedFileBase fb = Request.Files["file"];
            string Filename = Path.GetRandomFileName() + fb.FileName;
            fb.SaveAs(Server.MapPath("/Content/ReceptionistImage/" + Filename));
            string dtt = DateTime.Now.ToString("dd/mm/yyy hh:MM:ss tt");
            string cmd = "select * from Receptionist where rec_id=(select MAX(rec_id) from Receptionist)";
            DataTable dt = Dbm.ExecuteSelect(cmd);
            if (dt.Rows.Count == 0)
            {
                id = 0;
            }
            else
            {
                foreach (DataRow dr in dt.Rows)
                {
                    string ii = dr["Rec_id"].ToString();
                    int x=int.Parse(ii.Substring(5));
                    x++;
                    id = x;
                }
            }
            string user = "SVARN000" + id;
            cmd = "insert into Receptionist values('" + user + "','" + name + "','" + fname + "','" + gender + "','" + email + "','" + number + "','" + Filename + "','" + addr + "','True','" + dtt + "')";
            bool b = Dbm.ExecuteInsertUpdateDelete(cmd);
            if (b == true)
            {
               string pass = rr.RandomPassword();
                cmd = "insert into login values('" + user + "','" + pass + "','Receptionist','','true')";
                if (Dbm.ExecuteInsertUpdateDelete(cmd) == true)
                {
                    res = "Receptionist Registered SuccessFullly";
                    string msg = "Congratulations! Mr/Mrs. " + name + ", You are Registered as Receptionist in Hotel Svarnima. Your UserId is " + user + " and password is " + pass + ". We have a Great wishes for Your Job.                      Team Svarnima";
                    SMS.SendSMS(number, msg);
                    Em.SendTo = email;
                    Em.Subject = "no-reply";
                    Em.Message = msg;
                    Em.sendMyEmail();
                }
                else
                {
                    res = "Register Succefully Bt Some Error Occured";
                }

            }
            else
                res = "Unable to Register";
            ViewBag.msg = res;
            return View();
        }


        ///Manage Receptionists................................
        ///
        public ActionResult Status(string id, string st)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            if (st == "True")
            {
                Dbm.ExecuteSelect("update Receptionist set Rec_Status='False' where Rec_Id='" + id + "'");
                Dbm.ExecuteSelect("update login set Status='False' where UserId='" + id + "'");
            }
            else
            {
                Dbm.ExecuteSelect("update Receptionist set Rec_Status='True' where Rec_Id='" + id + "'");
                Dbm.ExecuteSelect("update login set Status='True' where UserId='" + id + "'");
            }
            return RedirectToAction("ManageReceptionist", "Admin");
        }
        
        public ActionResult ManageReceptionist()
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            return View();
        }

        public ActionResult DeleteReceptionist(string id)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            bool a=Dbm.ExecuteInsertUpdateDelete("delete from Receptionist where Rec_Id='" + id + "'");
            bool b=Dbm.ExecuteInsertUpdateDelete("delete from login where userId='" + id + "'");
            if (a == true && b == true)
                res = "Deleted Successfully";
            else
                res = "Some Error Occcured";
            TempData["msg"] = res;
            return RedirectToAction("ManageReceptionist", "Admin");
        }

        ///////Manage Enquiry............
        [HttpGet]
        public ActionResult ManageEnquiry()
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            return View();
        }
        [HttpPost]
        public ActionResult ManageEnquiry(string id, string msg, string email)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            Em.SendTo = email;
            Em.Subject = "no-reply";
            Em.Message = msg;
            if (Em.sendMyEmail() == true)
            {
                string cmd = "update Enquiry set Enq_status='True', Enq_date='" + DateTime.Now.ToString("dd/MM/yyyy hh:mm:ss tt") + "' where Enq_id='" + id + "'";
                if (Dbm.ExecuteInsertUpdateDelete(cmd) == true)
                    res = "SuccessFully Replied";
            }
            return View();
        }
        public ActionResult DeleteEnq(string id)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            string cmd = "delete from Enquiry where Enq_id='" + id + "'";
            if (Dbm.ExecuteInsertUpdateDelete(cmd) == true)
                res = "Deleted SuccessFully";
            else
                res = "Some Error Occured";
            TempData["msg"] = res;
            return RedirectToAction("ManageEnquiry", "Admin");
        }




        /// <summary>
        /// ////Send Sms.....................................................................................
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult SendSMS()
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            return View();
        }
        [HttpPost]
        public ActionResult SendSMS(string number,string message)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            if (SMS.SendSMS(number, message) == true)
                res = "Message Sent Successfully!";
            else
                res = "Some Error Occured!";
            ViewBag.msg = res;
            return View();
        }


        ////ToSend Email.......................

        [HttpGet]
        public ActionResult SendEmail()
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            return View();
        }
        [HttpPost]
        public ActionResult SendEmail(MyEmailSender ss)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            HttpPostedFileBase file = Request.Files["Att"];
            if (file != null)
            {
                file.SaveAs(Server.MapPath("/Content/Attch/" + file.FileName));
                ss.AttachmentFile = file.FileName;
            }
            bool status = ss.sendMyEmail();
            ViewBag.msg = status == true ? "Send SuccesFully" : "Faild";
            return View();
        }

        /// <summary>
        /// My Profile......................
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult MyProfile()
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            return View();
        }
        [HttpPost]
        public ActionResult MyProfile(string s)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            HttpPostedFileBase fb = Request.Files["file"];
            string Filename = Path.GetRandomFileName() + fb.FileName;
            fb.SaveAs(Server.MapPath("/Content/ReceptionistImage/" + Filename));
            string cmd = "update admin set Ad_Image='" + Filename + "'";
            Dbm.ExecuteInsertUpdateDelete(cmd);
            return View();
        }
        [HttpGet]
        public ActionResult UpdatePro()
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            return View();
        }
        [HttpPost]
        public ActionResult UpdatePro(string id, string name,string mobile,string email)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            if(Dbm.ExecuteInsertUpdateDelete("update admin set Ad_ID='" + id + "',Ad_Name='" + name + "',Ad_Mobile='" + mobile + "',ad_email='" + email + "'")==true)
                Dbm.ExecuteInsertUpdateDelete("update Login set userid='"+id+"' where IDType='Admin'");
            return RedirectToAction("MyProfile", "Admin");
        }


        /// <summary>
        /// /To Manage Password..................
        /// </summary>
        /// <returns></returns>
        [HttpGet]
        public ActionResult ChangePassword(string id)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
            ViewBag.idd = id;
            return View();
        }
        [HttpPost]
        public ActionResult ChangePassword(string old, string pass, string cpaas, string id)
        {
            if (isValidUser() == false)
            {
                return RedirectToAction("Login", "Admin");
            }
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
    }
}
