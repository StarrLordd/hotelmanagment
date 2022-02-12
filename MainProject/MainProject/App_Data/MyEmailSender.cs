using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.Net.Mail;

namespace MainProject.App_Code
{
    
    public class MyEmailSender
    {
        public string SendTo { get; set; }
        public string CC { get; set; }
        public string BCC { get; set; }
        public string Subject{get;set;}
        public string Message { get; set; }
        public string AttachmentFile{get;set;}
        private string MyEmail, MyPassword;
        public MyEmailSender()
        {
            MyEmail = "hotelsvarnima01@gmail.com";
            MyPassword = "Svarnima@1234";
        }
        public bool sendMyEmail()
        {
            try
            {
                SmtpClient client = new SmtpClient();

                //Setting Credential to sent Email
                client.Host = "smtp.gmail.com";
                client.Port = 587;
                client.UseDefaultCredentials = false;
                NetworkCredential nc = new NetworkCredential(MyEmail, MyPassword);
                client.Credentials = nc;
                client.EnableSsl = true;
                //setting releted to mail Message.............
                MailMessage msg = new MailMessage();
                MailAddress to = new MailAddress(SendTo);
                MailAddress from = new MailAddress(MyEmail);
                msg.Sender = from;
                msg.To.Add(to);
                msg.Subject = Subject;
                msg.Body = Message;
                if (CC != null)
                {
                    MailAddress ccEmail = new MailAddress(CC);
                    msg.CC.Add(ccEmail);
                }
                if (BCC != null)
                {
                    MailAddress bccEmail = new MailAddress(BCC);
                    msg.Bcc.Add(bccEmail);
                }
                if (AttachmentFile != null)
                {
                    Attachment at = new Attachment(HttpContext.Current.
                        Server.MapPath("/Content/Attch/" + AttachmentFile));
                    msg.Attachments.Add(at);
                }
                msg.From = from;
                client.Send(msg);
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}