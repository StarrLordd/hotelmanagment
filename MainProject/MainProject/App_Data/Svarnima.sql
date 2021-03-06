USE [Svarnima]
GO
/****** Object:  Table [dbo].[RoomBooking]    Script Date: 03/19/2020 15:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RoomBooking](
	[Book_Id] [varchar](50) NOT NULL,
	[Guest_Name] [varchar](100) NULL,
	[Guest_ID] [int] NULL,
	[No_room] [int] NULL,
	[Book_Adv] [int] NULL,
	[Book_Due] [int] NULL,
	[Book_total] [int] NULL,
	[Book_paid] [int] NULL,
	[Book_Date] [varchar](30) NULL,
	[Check_out] [varchar](30) NULL,
 CONSTRAINT [PK_RoomBooking] PRIMARY KEY CLUSTERED 
(
	[Book_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[RoomBooking] ([Book_Id], [Guest_Name], [Guest_ID], [No_room], [Book_Adv], [Book_Due], [Book_total], [Book_paid], [Book_Date], [Check_out]) VALUES (N'SV200001', N'Amit Ttriapthi', 103, 1, 990, 0, 999, 999, N'16/03/2020 07:51:08 PM', N'')
INSERT [dbo].[RoomBooking] ([Book_Id], [Guest_Name], [Guest_ID], [No_room], [Book_Adv], [Book_Due], [Book_total], [Book_paid], [Book_Date], [Check_out]) VALUES (N'SV200002', N'Amit Ttriapthi', 103, 3, 34, 0, 2997, 2997, N'18/03/2020 06:01:35 PM', N'')
INSERT [dbo].[RoomBooking] ([Book_Id], [Guest_Name], [Guest_ID], [No_room], [Book_Adv], [Book_Due], [Book_total], [Book_paid], [Book_Date], [Check_out]) VALUES (N'SV200003', N'Amit Ttriapthi', 103, 2, 1, 0, 1998, 1998, N'18/03/2020 06:02:21 PM', N'')
INSERT [dbo].[RoomBooking] ([Book_Id], [Guest_Name], [Guest_ID], [No_room], [Book_Adv], [Book_Due], [Book_total], [Book_paid], [Book_Date], [Check_out]) VALUES (N'SV200004', N'Amit Tripathi', 107, 5, 5, 0, 4995, 4995, N'18/03/2020 06:06:00 PM', N'')
INSERT [dbo].[RoomBooking] ([Book_Id], [Guest_Name], [Guest_ID], [No_room], [Book_Adv], [Book_Due], [Book_total], [Book_paid], [Book_Date], [Check_out]) VALUES (N'SV200005', N'Shubham Sir', 108, 1, 1998, 0, 1998, 1998, N'18/03/2020 06:21:01 PM', N'')
INSERT [dbo].[RoomBooking] ([Book_Id], [Guest_Name], [Guest_ID], [No_room], [Book_Adv], [Book_Due], [Book_total], [Book_paid], [Book_Date], [Check_out]) VALUES (N'SV200006', N'Mohd Asif', 109, 2, 7000, 992, 7992, 7000, N'19/03/2020 12:37:58 PM', N'')
INSERT [dbo].[RoomBooking] ([Book_Id], [Guest_Name], [Guest_ID], [No_room], [Book_Adv], [Book_Due], [Book_total], [Book_paid], [Book_Date], [Check_out]) VALUES (N'SV200007', N'Saurabh Singh', 110, 2, 1998, 0, 32, 1998, N'19/03/2020 01:23:51 PM', N'2020-03-19')
INSERT [dbo].[RoomBooking] ([Book_Id], [Guest_Name], [Guest_ID], [No_room], [Book_Adv], [Book_Due], [Book_total], [Book_paid], [Book_Date], [Check_out]) VALUES (N'SV200008', N'Parikshitt', 111, 1, 989, 0, 15984, 15984, N'19/03/2020 01:31:43 PM', N'2020-03-19')
INSERT [dbo].[RoomBooking] ([Book_Id], [Guest_Name], [Guest_ID], [No_room], [Book_Adv], [Book_Due], [Book_total], [Book_paid], [Book_Date], [Check_out]) VALUES (N'SV200009', N'Shubham', 112, 2, 1000, 2996, 3996, 1000, N'19/03/2020 02:31:26 PM', N'')
INSERT [dbo].[RoomBooking] ([Book_Id], [Guest_Name], [Guest_ID], [No_room], [Book_Adv], [Book_Due], [Book_total], [Book_paid], [Book_Date], [Check_out]) VALUES (N'SV200010', N'Shubham', 112, 2, 1000, 2996, 3996, 1000, N'19/03/2020 02:34:13 PM', N'')
INSERT [dbo].[RoomBooking] ([Book_Id], [Guest_Name], [Guest_ID], [No_room], [Book_Adv], [Book_Due], [Book_total], [Book_paid], [Book_Date], [Check_out]) VALUES (N'SV200011', N'Shubham', 112, 5, 5000, 0, 9990, 9990, N'19/03/2020 02:50:03 PM', N'')
/****** Object:  Table [dbo].[Receptionist]    Script Date: 03/19/2020 15:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Receptionist](
	[Rec_id] [varchar](50) NOT NULL,
	[Rec_Name] [varchar](100) NULL,
	[Rec_Father] [varchar](100) NULL,
	[Rec_Gender] [varchar](10) NULL,
	[Rec_Email] [varchar](100) NULL,
	[Rec_Number] [varchar](50) NULL,
	[Rec_Images] [varchar](100) NULL,
	[Rec_Addr] [varchar](200) NULL,
	[Rec_Status] [bit] NULL,
	[Rec_date] [varchar](30) NULL,
 CONSTRAINT [PK_Receptionist] PRIMARY KEY CLUSTERED 
(
	[Rec_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Receptionist] ([Rec_id], [Rec_Name], [Rec_Father], [Rec_Gender], [Rec_Email], [Rec_Number], [Rec_Images], [Rec_Addr], [Rec_Status], [Rec_date]) VALUES (N'1', N'Damini Shukla', N'Arvind Shukla', N'Female', N'damini8326@gmail.com', N'8887975604', N'mntrt13c.zxyhelp.png', N'Chitrakoot', 1, N'17/20/2020 06:03:29 PM')
/****** Object:  Table [dbo].[OnlineRequest]    Script Date: 03/19/2020 15:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OnlineRequest](
	[User_ID] [varchar](50) NOT NULL,
	[User_Name] [varchar](100) NULL,
	[USer_Number] [varchar](20) NULL,
	[User_Email] [varchar](100) NULL,
	[User_addr] [varchar](100) NULL,
	[User_No_of_day] [int] NULL,
	[User_No_of_room] [int] NULL,
	[User_Total] [int] NULL,
	[User_Status] [bit] NULL,
	[User_Date] [varchar](50) NULL,
 CONSTRAINT [PK_OnlineRequest] PRIMARY KEY CLUSTERED 
(
	[User_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[OnlineRequest] ([User_ID], [User_Name], [USer_Number], [User_Email], [User_addr], [User_No_of_day], [User_No_of_room], [User_Total], [User_Status], [User_Date]) VALUES (N'GUEST200000', N'', N'8299343481', N'sufbfu', N'xsdgdrgn', 5, 2, 9990, 0, N'18/03/2020 03:47:27 PM')
INSERT [dbo].[OnlineRequest] ([User_ID], [User_Name], [USer_Number], [User_Email], [User_addr], [User_No_of_day], [User_No_of_room], [User_Total], [User_Status], [User_Date]) VALUES (N'GUEST200001', N'Amit Tripathi', N'8299343481', N'sufbfu', N'xsdgdrgn', 5, 2, 9990, 0, N'18/03/2020 03:47:48 PM')
INSERT [dbo].[OnlineRequest] ([User_ID], [User_Name], [USer_Number], [User_Email], [User_addr], [User_No_of_day], [User_No_of_room], [User_Total], [User_Status], [User_Date]) VALUES (N'GUEST200002', N'Amit Tripathi', N'8299343481', N'sufbfu', N'xsdgdrgn', 5, 2, 9990, 0, N'18/03/2020 03:48:18 PM')
INSERT [dbo].[OnlineRequest] ([User_ID], [User_Name], [USer_Number], [User_Email], [User_addr], [User_No_of_day], [User_No_of_room], [User_Total], [User_Status], [User_Date]) VALUES (N'GUEST200003', N'Amit Tripathi', N'8887975604', N'Amittripathi2233@gmail.com', N'Chitrakooot', 4, 3, 11988, 1, N'18/03/2020 04:00:41 PM')
/****** Object:  Table [dbo].[ManageSlider]    Script Date: 03/19/2020 15:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManageSlider](
	[SliderId] [int] IDENTITY(100,1) NOT NULL,
	[Titlle] [varchar](100) NULL,
	[Subtitle] [varchar](500) NULL,
	[Image] [varchar](100) NULL,
	[Date] [varchar](50) NULL,
 CONSTRAINT [PK_ManageSlider] PRIMARY KEY CLUSTERED 
(
	[SliderId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ManageSlider] ON
INSERT [dbo].[ManageSlider] ([SliderId], [Titlle], [Subtitle], [Image], [Date]) VALUES (103, N'A new Grand Hotel Rooms', N'A functionally arranged living space with furnishings such as a writing desk and parlor style chairs, and a spacious bathroom provide a leisurely feel.', N'amdbfino.jomHtr4.jpg', N'24/30/2020 11:02:50 AM')
INSERT [dbo].[ManageSlider] ([SliderId], [Titlle], [Subtitle], [Image], [Date]) VALUES (104, N'We have Admire Deluxe Rooms', N' These Deluxe Rooms let you relax as you admire a beautiful view of the pool. Stay connected as you enjoy our free WiFi and watch movies with our 32-inch LCD TV and DVD player. Refresh yourself as you take a step into our rain shower. ', N'dkruon2k.sviHtr3.jpg', N'24/32/2020 11:02:48 AM')
INSERT [dbo].[ManageSlider] ([SliderId], [Titlle], [Subtitle], [Image], [Date]) VALUES (105, N'It is not about how much you eat, It is about what you eat.', N'Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum.', N'u0fub2sm.vuhfood.jpeg', N'24/59/2020 01:02:28 PM')
INSERT [dbo].[ManageSlider] ([SliderId], [Titlle], [Subtitle], [Image], [Date]) VALUES (106, N'A royal Banquet For Royal Parties', N'Each of Hotel Svarnima have state of the art banquet halls which combine elegance and technology. Luxurious, stylish and multifunctional contemporary spaces which can host up to 500 people make them ideal for any event from large scale corporate conferences, fashion events to more intimate cocktail dinners.', N'vcht5gtj.v12Htr10.jpg', N'24/00/2020 02:02:39 PM')
INSERT [dbo].[ManageSlider] ([SliderId], [Titlle], [Subtitle], [Image], [Date]) VALUES (108, N'Come as a guest go as a friend.', N'We are trying that if any guest gave us a chance to serve him, the we just give his satishfaction so that, that guestbecome our friend and give us another chance to serve him. So that we have a qoutation of Come  as a Gueat and go as a Friend.', N'qt50jti2.5w5IMG-20191014-WA0020.jpg', N'24/56/2020 08:02:54 AM')
SET IDENTITY_INSERT [dbo].[ManageSlider] OFF
/****** Object:  Table [dbo].[ManageRoom]    Script Date: 03/19/2020 15:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManageRoom](
	[RoomID] [int] IDENTITY(100,1) NOT NULL,
	[RoomTitle] [varchar](100) NULL,
	[RoomImg] [varchar](200) NULL,
	[RoomStatus] [bit] NULL,
	[AddDate] [varchar](50) NULL,
 CONSTRAINT [PK_ManageRoom] PRIMARY KEY CLUSTERED 
(
	[RoomID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ManageRoom] ON
INSERT [dbo].[ManageRoom] ([RoomID], [RoomTitle], [RoomImg], [RoomStatus], [AddDate]) VALUES (301, N'Grand New Room', N'kji5viau.jbiHtr1.png', NULL, N'22/33/2020 08:02:52 PM')
INSERT [dbo].[ManageRoom] ([RoomID], [RoomTitle], [RoomImg], [RoomStatus], [AddDate]) VALUES (401, N'Grand Banqout', N'0wxqqvlr.x40Htr5.jpg', NULL, N'22/34/2020 08:02:23 PM')
INSERT [dbo].[ManageRoom] ([RoomID], [RoomTitle], [RoomImg], [RoomStatus], [AddDate]) VALUES (501, N'Royality Spot', N'uwgfadih.frdHtr7.jpg', NULL, N'22/34/2020 08:02:54 PM')
INSERT [dbo].[ManageRoom] ([RoomID], [RoomTitle], [RoomImg], [RoomStatus], [AddDate]) VALUES (601, N'Fully Featured', N'vbefv3nn.n5oHtr8.jpg', NULL, N'22/35/2020 08:02:39 PM')
INSERT [dbo].[ManageRoom] ([RoomID], [RoomTitle], [RoomImg], [RoomStatus], [AddDate]) VALUES (701, N'Featured Room', N'2jt4rvrr.qnrHtr3.jpg', NULL, N'22/36/2020 08:02:00 PM')
INSERT [dbo].[ManageRoom] ([RoomID], [RoomTitle], [RoomImg], [RoomStatus], [AddDate]) VALUES (801, N'Evential Banqout', N'vfk151x5.0olHtr10.jpg', NULL, N'22/36/2020 08:02:28 PM')
INSERT [dbo].[ManageRoom] ([RoomID], [RoomTitle], [RoomImg], [RoomStatus], [AddDate]) VALUES (901, N'Royal Event', N'f01oggmr.debIMG-20200119-WA0013.jpg', NULL, N'22/37/2020 08:02:09 PM')
INSERT [dbo].[ManageRoom] ([RoomID], [RoomTitle], [RoomImg], [RoomStatus], [AddDate]) VALUES (1001, N'Events', N'vb5vu5mg.aaaIMG-20200126-WA0021.jpg', NULL, N'22/37/2020 08:02:38 PM')
SET IDENTITY_INSERT [dbo].[ManageRoom] OFF
/****** Object:  Table [dbo].[ManageGallery]    Script Date: 03/19/2020 15:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManageGallery](
	[Gal_Id] [int] IDENTITY(100,1) NOT NULL,
	[Gal_Title] [varchar](100) NULL,
	[Gal_Name] [varchar](100) NULL,
	[Gal_Type] [bit] NULL,
	[Gal_Date] [varchar](30) NULL,
 CONSTRAINT [PK_ManageGallery] PRIMARY KEY CLUSTERED 
(
	[Gal_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[ManageGallery] ON
INSERT [dbo].[ManageGallery] ([Gal_Id], [Gal_Title], [Gal_Name], [Gal_Type], [Gal_Date]) VALUES (101, N'Hotel Events', N'https://www.youtube.com/embed/FOCp9rMMcZU?start=2', 0, N'26/03/2020 11:02:20 AM')
INSERT [dbo].[ManageGallery] ([Gal_Id], [Gal_Title], [Gal_Name], [Gal_Type], [Gal_Date]) VALUES (102, N'Promotion Events', N'https://www.youtube.com/embed/tEhd5lmDc2Y?start=2', 0, N'26/03/2020 11:02:57 AM')
INSERT [dbo].[ManageGallery] ([Gal_Id], [Gal_Title], [Gal_Name], [Gal_Type], [Gal_Date]) VALUES (103, N'Promotional Video', N'https://www.youtube.com/embed/aSPSqIXbazw?start=2', 0, N'26/04/2020 11:02:44 AM')
INSERT [dbo].[ManageGallery] ([Gal_Id], [Gal_Title], [Gal_Name], [Gal_Type], [Gal_Date]) VALUES (104, N'Marital Decoration Video', N'https://www.youtube.com/embed/ATa5M545kvg', 0, N'26/05/2020 11:02:22 AM')
INSERT [dbo].[ManageGallery] ([Gal_Id], [Gal_Title], [Gal_Name], [Gal_Type], [Gal_Date]) VALUES (105, N'Grand Video Review', N'https://www.youtube.com/embed/4eJ8sJGh5dA', 0, N'26/06/2020 11:02:11 AM')
INSERT [dbo].[ManageGallery] ([Gal_Id], [Gal_Title], [Gal_Name], [Gal_Type], [Gal_Date]) VALUES (107, N'Royal Spot', N'idfqqinn.rqxHtr16.jpg', 1, N'27/16/2020 09:02:41 PM')
INSERT [dbo].[ManageGallery] ([Gal_Id], [Gal_Title], [Gal_Name], [Gal_Type], [Gal_Date]) VALUES (108, N'Evential Banqouts', N'3cvygt1o.omzHtr8.jpg', 1, N'27/17/2020 09:02:05 PM')
INSERT [dbo].[ManageGallery] ([Gal_Id], [Gal_Title], [Gal_Name], [Gal_Type], [Gal_Date]) VALUES (109, N'Cool Reception', N'j3ev4a4u.hybHtr11.jpg', 1, N'27/17/2020 09:02:33 PM')
INSERT [dbo].[ManageGallery] ([Gal_Id], [Gal_Title], [Gal_Name], [Gal_Type], [Gal_Date]) VALUES (110, N'Grand Room', N'xctnshgk.gwcHtr4.jpg', 1, N'27/17/2020 09:02:58 PM')
INSERT [dbo].[ManageGallery] ([Gal_Id], [Gal_Title], [Gal_Name], [Gal_Type], [Gal_Date]) VALUES (111, N'Brand Hotel', N'gtdfkrjq.abyIMG-20191014-WA0020.jpg', 1, N'28/30/2020 09:02:12 PM')
INSERT [dbo].[ManageGallery] ([Gal_Id], [Gal_Title], [Gal_Name], [Gal_Type], [Gal_Date]) VALUES (112, N'', N'd3eqpmjf.5liHtr7.jpg', 1, N'29/10/2020 08:02:29 AM')
SET IDENTITY_INSERT [dbo].[ManageGallery] OFF
/****** Object:  Table [dbo].[Login]    Script Date: 03/19/2020 15:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Login](
	[UserId] [varchar](100) NOT NULL,
	[Password] [varchar](100) NULL,
	[IDType] [varchar](15) NULL,
	[LastLogin] [varchar](30) NULL,
	[status] [bit] NULL,
 CONSTRAINT [PK_Login] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Login] ([UserId], [Password], [IDType], [LastLogin], [status]) VALUES (N'1', N'123', N'Receptionist', N'19/03/2020 02:49:35 PM', 1)
INSERT [dbo].[Login] ([UserId], [Password], [IDType], [LastLogin], [status]) VALUES (N'q', N'123', N'admin', N'34567', 1)
/****** Object:  Table [dbo].[GuestDetail]    Script Date: 03/19/2020 15:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GuestDetail](
	[Guest_ID] [int] IDENTITY(100,1) NOT NULL,
	[Guest_Name] [varchar](100) NULL,
	[Guest_Email] [varchar](100) NULL,
	[Guest_Number] [varchar](12) NULL,
	[Guest_Adults] [int] NULL,
	[Guest_Child] [int] NULL,
	[Check_in] [varchar](30) NULL,
	[Check_out] [varchar](30) NULL,
	[Guest_Addr] [varchar](200) NULL,
	[ID_Type] [varchar](50) NULL,
	[ID_Nmber] [varchar](20) NULL,
	[Date] [varchar](30) NULL,
	[MainCheck_out] [varchar](30) NULL,
 CONSTRAINT [PK_GuestDetail] PRIMARY KEY CLUSTERED 
(
	[Guest_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[GuestDetail] ON
INSERT [dbo].[GuestDetail] ([Guest_ID], [Guest_Name], [Guest_Email], [Guest_Number], [Guest_Adults], [Guest_Child], [Check_in], [Check_out], [Guest_Addr], [ID_Type], [ID_Nmber], [Date], [MainCheck_out]) VALUES (100, N'Amit Tripathi', N'Amit@gmail.com', N'8887975604', 3, 4, N'2020-12-31', N'2019-11-03', N'fghjkl', N'Adhar Card', N'', N'16/03/2020 12:54:14 PM', N'')
INSERT [dbo].[GuestDetail] ([Guest_ID], [Guest_Name], [Guest_Email], [Guest_Number], [Guest_Adults], [Guest_Child], [Check_in], [Check_out], [Guest_Addr], [ID_Type], [ID_Nmber], [Date], [MainCheck_out]) VALUES (101, N'Suraj Gupta', N'surajgupta.ckt2@gmail.com', N'8299671481', 4, 3, N'2020-03-20', N'2020-03-20', N'Chitrakoot', N'Voter ID', N'57542548686764', N'16/03/2020 01:05:46 PM', N'')
INSERT [dbo].[GuestDetail] ([Guest_ID], [Guest_Name], [Guest_Email], [Guest_Number], [Guest_Adults], [Guest_Child], [Check_in], [Check_out], [Guest_Addr], [ID_Type], [ID_Nmber], [Date], [MainCheck_out]) VALUES (102, N'Suraj Gupta', N'surajgupta.ckt2@gmail.com', N'8299671481', 4, 3, N'2020-03-20', N'2020-03-20', N'Chitrakoot', N'Voter ID', N'244444768', N'16/03/2020 01:08:06 PM', N'')
INSERT [dbo].[GuestDetail] ([Guest_ID], [Guest_Name], [Guest_Email], [Guest_Number], [Guest_Adults], [Guest_Child], [Check_in], [Check_out], [Guest_Addr], [ID_Type], [ID_Nmber], [Date], [MainCheck_out]) VALUES (103, N'Amit Ttriapthi', N'Amittripathi2233@gmail.com', N'8887975604', 4, 5, N'2020-03-14', N'2020-03-19', N'fghjk', N'Voter ID', N'895632', N'16/03/2020 01:57:28 PM', N'')
INSERT [dbo].[GuestDetail] ([Guest_ID], [Guest_Name], [Guest_Email], [Guest_Number], [Guest_Adults], [Guest_Child], [Check_in], [Check_out], [Guest_Addr], [ID_Type], [ID_Nmber], [Date], [MainCheck_out]) VALUES (104, N'Suraj Gupta', N'surajgupta.ckt2@gmail.com', N'8887975604', 1, 6, N'2020-03-18', N'2020-03-20', N'rtfyghj', N'Drivring Lisence', N'894568948', N'18/03/2020 05:02:23 PM', N'')
INSERT [dbo].[GuestDetail] ([Guest_ID], [Guest_Name], [Guest_Email], [Guest_Number], [Guest_Adults], [Guest_Child], [Check_in], [Check_out], [Guest_Addr], [ID_Type], [ID_Nmber], [Date], [MainCheck_out]) VALUES (105, N'Amit Tripathi', N'Amittripathi2233@gmail.com', N'8887975604', 3, 1, N'2020-03-20', N'2020-03-27', N'ytguhijok', N'Pan Card', N'3456789', N'18/03/2020 05:25:28 PM', N'')
INSERT [dbo].[GuestDetail] ([Guest_ID], [Guest_Name], [Guest_Email], [Guest_Number], [Guest_Adults], [Guest_Child], [Check_in], [Check_out], [Guest_Addr], [ID_Type], [ID_Nmber], [Date], [MainCheck_out]) VALUES (106, N'Amit Tripathi', N'Amittripathi2233@gmail.com', N'8887975604', 1, 5, N'2020-03-18', N'2020-03-20', N'vbhjkl', N'Passport', N'987', N'18/03/2020 06:03:23 PM', N'')
INSERT [dbo].[GuestDetail] ([Guest_ID], [Guest_Name], [Guest_Email], [Guest_Number], [Guest_Adults], [Guest_Child], [Check_in], [Check_out], [Guest_Addr], [ID_Type], [ID_Nmber], [Date], [MainCheck_out]) VALUES (107, N'Amit Tripathi', N'Amittripathi2233@gmail.com', N'8887975604', 6, 3, N'2020-03-07', N'2020-03-17', N'ytuiop[', N'Adhar Card', N'89465132', N'18/03/2020 06:05:42 PM', N'')
INSERT [dbo].[GuestDetail] ([Guest_ID], [Guest_Name], [Guest_Email], [Guest_Number], [Guest_Adults], [Guest_Child], [Check_in], [Check_out], [Guest_Addr], [ID_Type], [ID_Nmber], [Date], [MainCheck_out]) VALUES (108, N'Shubham Sir', N'Amittripathi2233@gmail.com', N'8887975604', 3, 6, N'2020-03-10', N'2020-03-12', N'fgyhujik', N'Voter ID', N'89549589865', N'18/03/2020 06:19:33 PM', N'')
INSERT [dbo].[GuestDetail] ([Guest_ID], [Guest_Name], [Guest_Email], [Guest_Number], [Guest_Adults], [Guest_Child], [Check_in], [Check_out], [Guest_Addr], [ID_Type], [ID_Nmber], [Date], [MainCheck_out]) VALUES (109, N'Mohd Asif', N'amittripathi2233@gmail.com', N'8887975604', 2, 2, N'2020-03-19', N'2020-03-23', N'erhighvsdru', N'Voter ID', N'89745621348', N'19/03/2020 12:37:36 PM', N'')
INSERT [dbo].[GuestDetail] ([Guest_ID], [Guest_Name], [Guest_Email], [Guest_Number], [Guest_Adults], [Guest_Child], [Check_in], [Check_out], [Guest_Addr], [ID_Type], [ID_Nmber], [Date], [MainCheck_out]) VALUES (110, N'Saurabh Singh', N'Saurabhsingh12500@gmail.com', N'8917006494', 3, 4, N'2020-03-03', N'2020-03-19', N'ytfghjkl;', N'Adhar Card', N'894561238', N'19/03/2020 01:23:20 PM', N'2020-03-19')
INSERT [dbo].[GuestDetail] ([Guest_ID], [Guest_Name], [Guest_Email], [Guest_Number], [Guest_Adults], [Guest_Child], [Check_in], [Check_out], [Guest_Addr], [ID_Type], [ID_Nmber], [Date], [MainCheck_out]) VALUES (111, N'Parikshitt', N'Amittripathi2233@gmail.com', N'8887975604', 6, 1, N'2020-03-03', N'2020-03-19', N'rtfyguhijok', N'Adhar Card', N'9876453218756', N'19/03/2020 01:31:05 PM', N'2020-03-19')
INSERT [dbo].[GuestDetail] ([Guest_ID], [Guest_Name], [Guest_Email], [Guest_Number], [Guest_Adults], [Guest_Child], [Check_in], [Check_out], [Guest_Addr], [ID_Type], [ID_Nmber], [Date], [MainCheck_out]) VALUES (112, N'Shubham', N's@gmail', N'9713161487', 2, 1, N'2020-03-19', N'2020-03-21', N'ckt ', N'Passport', N'8572757887', N'19/03/2020 02:29:57 PM', N'')
SET IDENTITY_INSERT [dbo].[GuestDetail] OFF
/****** Object:  Table [dbo].[Feedback]    Script Date: 03/19/2020 15:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Feedback](
	[id] [int] NULL,
	[Name] [varchar](100) NULL,
	[Subject] [varchar](50) NULL,
	[MobileNo] [varchar](50) NULL,
	[feedback] [varchar](200) NOT NULL,
	[Star] [int] NULL,
	[Date] [date] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Amit', N'KSss', N'88879975604', N'ghbhb', 4, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Manish', N'Cleaning', N'7233036846', N'Pleas Clean YOur Hotel', 2, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Amit', N'Hello', N'8887975604', N'Hello World', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Manisha', N'Hello', N'7905974710', N'Hello World', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Manisha', N'Hello', N'7905974710', N'Hello World', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Shivam', N'Food', N'9511475955', N'THIS HOTEL IS VERY POOR', 2, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Shivam', N'Food', N'9511475955', N'THIS HOTEL IS VERY POOR', 2, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Shivam', N'Food', N'9511475955', N'THIS HOTEL IS VERY POOR', 2, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Shivam', N'Food', N'9511475955', N'THIS HOTEL IS VERY POOR', 2, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Shivam', N'Food', N'9511475955', N'THIS HOTEL IS VERY POOR', 2, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Shivam', N'Food', N'9511475955', N'THIS HOTEL IS VERY POOR', 2, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Shivam', N'Food', N'9511475955', N'THIS HOTEL IS VERY POOR', 2, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Shivam', N'Food', N'9511475955', N'THIS HOTEL IS VERY POOR', 2, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Shivam', N'Food', N'9511475955', N'THIS HOTEL IS VERY POOR', 2, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Shivam', N'Food', N'9511475955', N'THIS HOTEL IS VERY POOR', 2, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'dsvsd', N'dfer', N'95597400982', N'ibundfjk', 4, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'259259259259', N'dfer', N'95597400982', N'ibundfjk', 4, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Amit', N'dufbdu', N'9559740092', N'sfvfb', 5, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'rtghj', N'rtyui', N'9559740092', N'tyuio', 4, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'rtghj', N'rtyui', N'9559740092', N'tyuio', 4, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'rtghj', N'rtyui', N'9559740092', N'tyuio', 4, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Amit Tripathi', N'Hello', N'8887975604', N'gyudsd', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Amit Tripathi', N'Hello', N'8887975604', N'gyudsd', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Amit Tripathi', N'Hello', N'8887975604', N'gyudsd', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Amit Tripathi', N'Hello', N'8887975604', N'gyudsd', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Amit Tripathi', N'Hello', N'8887975604', N'gyudsd', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Amit Tripathi', N'Hello', N'8887975604', N'gyudsd', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Amit Tripathi', N'Hello', N'8887975604', N'gyudsd', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Amit Tripathi', N'Hello', N'8887975604', N'gyudsd', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Tushar', N'Hello', N'8887975604', N'dfefbefi', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Tushar', N'Hello', N'8887975604', N'dfefbefi', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Tushar', N'Hello', N'8887975604', N'dfefbefi', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Tushar', N'Hello', N'8887975604', N'dfefbefi', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Tushar', N'Hello', N'8887975604', N'dfefbefi', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Tushar', N'Hello', N'8887975604', N'dfefbefi', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Tushar', N'Hello', N'8887975604', N'dfefbefi', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Amit', N'ifndivk', N'9559740092', N'yvgubhijnomk;', 4, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Amit', N'ifndivk', N'9559740092', N'yvgubhijnomk;', 4, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'aMIT', N'FGBRFFU', N'54645', N'guhijokl', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'aMIT', N'FGBRFFU', N'9559740092', N'guhijokl', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'aMIT', N'FGBRFFU', N'9559740092', N'guhijokl', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'aMIT', N'FGBRFFU', N'9559740092', N'guhijokl', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'aMIT', N'FGBRFFU', N'9559740092', N'guhijokl', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'aMIT', N'FGBRFFU', N'9559740092', N'guhijokl', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'drftghu', N'vygbhu', N'9559740092', N'frtgyhujio', 3, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'dffngdk', N'yuvu', N'9559740092', N'gyuiojpk', 4, CAST(0xBA400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Shubham Yadav', N'Food', N'6394761065', N'THis is Too Dilceous', 5, CAST(0xC4400B00 AS Date))
INSERT [dbo].[Feedback] ([id], [Name], [Subject], [MobileNo], [feedback], [Star], [Date]) VALUES (NULL, N'Anoop Chaurasiya', N'Fooding', N'7348020219', N'THis is Delicious', 4, CAST(0xCD400B00 AS Date))
/****** Object:  Table [dbo].[Enquiry]    Script Date: 03/19/2020 15:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Enquiry](
	[Enq_id] [int] IDENTITY(100,1) NOT NULL,
	[Enq_Name] [varchar](100) NULL,
	[Enq_Email] [varchar](100) NULL,
	[Enq_Subject] [varchar](100) NULL,
	[Enq_Messages] [varchar](300) NULL,
	[Enq_Date] [varchar](30) NULL,
	[Enq_Status] [bit] NULL,
 CONSTRAINT [PK_Enquiry] PRIMARY KEY CLUSTERED 
(
	[Enq_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Enquiry] ON
INSERT [dbo].[Enquiry] ([Enq_id], [Enq_Name], [Enq_Email], [Enq_Subject], [Enq_Messages], [Enq_Date], [Enq_Status]) VALUES (100, N'Shubham', N'er.shubhammishra01@gmail.com', N'Demo', N'shjdk sjdj', N'12/03/2020 12:44:07 AM', 0)
INSERT [dbo].[Enquiry] ([Enq_id], [Enq_Name], [Enq_Email], [Enq_Subject], [Enq_Messages], [Enq_Date], [Enq_Status]) VALUES (101, N'', N'', N'', N'', N'14/03/2020 09:12:37 PM', 0)
INSERT [dbo].[Enquiry] ([Enq_id], [Enq_Name], [Enq_Email], [Enq_Subject], [Enq_Messages], [Enq_Date], [Enq_Status]) VALUES (102, N'', N'', N'', N'', N'17/03/2020 06:25:21 PM', 0)
INSERT [dbo].[Enquiry] ([Enq_id], [Enq_Name], [Enq_Email], [Enq_Subject], [Enq_Messages], [Enq_Date], [Enq_Status]) VALUES (103, N'', N'', N'', N'', N'17/03/2020 06:26:00 PM', 0)
SET IDENTITY_INSERT [dbo].[Enquiry] OFF
/****** Object:  Table [dbo].[Admin]    Script Date: 03/19/2020 15:06:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[Ad_ID] [varchar](100) NOT NULL,
	[Ad_Name] [varchar](200) NULL,
	[Ad_Image] [varchar](200) NULL,
	[Ad_Mobile] [varchar](15) NULL,
	[Ad_Email] [varchar](200) NULL,
 CONSTRAINT [PK_Admin] PRIMARY KEY CLUSTERED 
(
	[Ad_ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Admin] ([Ad_ID], [Ad_Name], [Ad_Image], [Ad_Mobile], [Ad_Email]) VALUES (N'q', N'Svarnima Hotel', N'ps41eyjo.tcoshubhamsir.jpg', N'8887975604', N'Amittripathi2233@gmail.com')
