using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;

namespace MainProject.Models
{
    public class MySmsSender
    {
        string senderId, UserId, Pass;
        public MySmsSender()
        {
            senderId = "KSSCKT";
            UserId = "KSSCKT";
            Pass = "41f95f660fXX";
        }
        public bool SendSMS(string MobileNo, string MessageText)
        {
            try
            {
                string apiURL="http://t.160smsalert.com/submitsms.jsp?user="+UserId+"&key="+Pass+"&mobile="+MobileNo+"&message="+MessageText+"&senderid="+senderId+"&accusage=1";
                WebClient wc=new WebClient();
                string res=wc.DownloadString(apiURL);
                return true;
            }
            catch(Exception ex)
            {
                return false;
            }
        }
    }
}