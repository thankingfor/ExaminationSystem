USE [master]
GO
/****** Object:  Database [Examination]    Script Date: 2018/6/24 9:15:25 ******/
CREATE DATABASE [Examination]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'db_Examination_Data', FILENAME = N'e:\db_Examination_Data.MDF' , SIZE = 3456KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'db_Examination_Log', FILENAME = N'e:\Examination_log.ldf' , SIZE = 768KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [Examination] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Examination].[dbo].[sp_fulltext_database] @action = 'disable'
end
GO
ALTER DATABASE [Examination] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Examination] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Examination] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Examination] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Examination] SET ARITHABORT OFF 
GO
ALTER DATABASE [Examination] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Examination] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [Examination] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Examination] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Examination] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Examination] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Examination] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Examination] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Examination] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Examination] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Examination] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Examination] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Examination] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Examination] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Examination] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Examination] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Examination] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Examination] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Examination] SET  MULTI_USER 
GO
ALTER DATABASE [Examination] SET PAGE_VERIFY NONE  
GO
ALTER DATABASE [Examination] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Examination] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Examination] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Examination] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Examination', N'ON'
GO
ALTER DATABASE [Examination] SET QUERY_STORE = OFF
GO
USE [Examination]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Examination]
GO
/****** Object:  Table [dbo].[tb_Lesson]    Script Date: 2018/6/24 9:15:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Lesson](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](60) NULL,
	[ofProfession] [bigint] NULL,
	[JoinTime] [datetime] NULL,
 CONSTRAINT [PK_tb_Lesson] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_TaoTi]    Script Date: 2018/6/24 9:15:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_TaoTi](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NULL,
	[LessonID] [bigint] NULL,
	[JoinTime] [datetime] NULL,
 CONSTRAINT [PK_tb_TaoTi] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Questions]    Script Date: 2018/6/24 9:15:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Questions](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[que_subject] [varchar](50) NULL,
	[que_type] [char](10) NULL,
	[que_joindate] [datetime] NULL,
	[que_lessonid] [int] NULL,
	[que_professionid] [int] NULL,
	[que_taotiid] [bigint] NULL,
	[optionA] [varchar](50) NULL,
	[optionB] [varchar](50) NULL,
	[optionC] [varchar](50) NULL,
	[optionD] [varchar](50) NULL,
	[que_answer] [char](10) NULL,
	[note] [varchar](50) NULL,
 CONSTRAINT [PK_tb_Questions] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[KechengTaotiTimuView]    Script Date: 2018/6/24 9:15:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** 对象: 视图 dbo.KechengTaotiTimuView    脚本日期: 2008-1-3 11:13:37 ******/
CREATE VIEW [dbo].[KechengTaotiTimuView]
AS
SELECT dbo.tb_Lesson.Name, dbo.tb_TaoTi.Name AS Expr1, 
      dbo.tb_Questions.que_subject, dbo.tb_Questions.que_type, 
      dbo.tb_Questions.optionA, dbo.tb_Questions.optionB, dbo.tb_Questions.optionC, 
      dbo.tb_Questions.optionD, dbo.tb_Questions.que_answer
FROM dbo.tb_Lesson INNER JOIN
      dbo.tb_TaoTi ON dbo.tb_Lesson.ID = dbo.tb_TaoTi.LessonID INNER JOIN
      dbo.tb_Questions ON dbo.tb_TaoTi.ID = dbo.tb_Questions.que_taotiid

GO
/****** Object:  View [dbo].[Timu_Taoti_Kcheng_view]    Script Date: 2018/6/24 9:15:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** 对象: 视图 dbo.Timu_Taoti_Kcheng_view    脚本日期: 2008-1-3 11:13:37 ******/
CREATE VIEW [dbo].[Timu_Taoti_Kcheng_view]
AS
SELECT dbo.tb_Questions.id, dbo.tb_Questions.que_subject, dbo.tb_Questions.que_type, 
      dbo.tb_TaoTi.ID AS Expr1, dbo.tb_TaoTi.Name, dbo.tb_Questions.que_joindate, 
      dbo.tb_Lesson.ID AS Expr2, dbo.tb_Lesson.Name AS Expr3
FROM dbo.tb_Questions INNER JOIN
      dbo.tb_TaoTi ON dbo.tb_Questions.que_taotiid = dbo.tb_TaoTi.ID INNER JOIN
      dbo.tb_Lesson ON dbo.tb_TaoTi.LessonID = dbo.tb_Lesson.ID

GO
/****** Object:  View [dbo].[kecheng_taoti_view]    Script Date: 2018/6/24 9:15:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** 对象: 视图 dbo.kecheng_taoti_view    脚本日期: 2008-1-3 11:13:37 ******/
CREATE VIEW [dbo].[kecheng_taoti_view]
AS
SELECT dbo.tb_TaoTi.ID, dbo.tb_TaoTi.Name, dbo.tb_Lesson.Name AS Expr1, 
      dbo.tb_TaoTi.JoinTime
FROM dbo.tb_TaoTi INNER JOIN
      dbo.tb_Lesson ON dbo.tb_TaoTi.LessonID = dbo.tb_Lesson.ID

GO
/****** Object:  Table [dbo].[tb_Profession]    Script Date: 2018/6/24 9:15:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Profession](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](200) NULL,
	[JoinTime] [datetime] NULL,
 CONSTRAINT [PK_tb_Profession] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[kc_zy_view]    Script Date: 2018/6/24 9:15:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** 对象: 视图 dbo.kecheng_zhuanye_view    脚本日期: 2008-1-3 11:13:37 ******/
CREATE VIEW [dbo].[kc_zy_view]
AS
SELECT dbo.tb_Lesson.Name, dbo.tb_Profession.Name AS Expr1, 
      dbo.tb_Lesson.JoinTime, dbo.tb_Lesson.ID
FROM dbo.tb_Lesson INNER JOIN
      dbo.tb_Profession ON dbo.tb_Lesson.ofProfession = dbo.tb_Profession.ID

GO
/****** Object:  Table [dbo].[tb_Student]    Script Date: 2018/6/24 9:15:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Student](
	[ID] [varchar](50) NOT NULL,
	[Name] [varchar](20) NULL,
	[PWD] [varchar](20) NULL,
	[Sex] [varchar](2) NULL,
	[JoinTime] [datetime] NULL,
	[question] [varchar](50) NULL,
	[answer] [varchar](50) NULL,
	[profession] [bigint] NULL,
	[IPAddress] [char](30) NULL,
 CONSTRAINT [PK_tb_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[stu_zhuanye_view]    Script Date: 2018/6/24 9:15:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** 对象: 视图 dbo.stu_zhuanye_view    脚本日期: 2008-1-3 11:13:37 ******/
CREATE VIEW [dbo].[stu_zhuanye_view]
AS
SELECT dbo.tb_Student.ID, dbo.tb_Student.Name, dbo.tb_Student.Sex, 
      dbo.tb_Profession.Name AS Expr1, dbo.tb_Student.JoinTime
FROM dbo.tb_Student INNER JOIN
      dbo.tb_Profession ON dbo.tb_Student.profession = dbo.tb_Profession.ID

GO
/****** Object:  Table [dbo].[tb_StuResult]    Script Date: 2018/6/24 9:15:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_StuResult](
	[res_id] [bigint] IDENTITY(1,1) NOT NULL,
	[stu_id] [varchar](50) NULL,
	[which_lesson] [varchar](50) NULL,
	[taotiid] [bigint] NULL,
	[taotiname] [varchar](50) NULL,
	[res_single] [int] NULL,
	[res_more] [int] NULL,
	[res_total]  AS ([res_single] + [res_more]),
	[res_subdate] [datetime] NULL,
 CONSTRAINT [PK_tb_StuResult] PRIMARY KEY CLUSTERED 
(
	[res_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[chengji_chaxun_view]    Script Date: 2018/6/24 9:15:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** 对象: 视图 dbo.chengji_chaxun_view    脚本日期: 2008-1-3 11:13:37 ******/
CREATE VIEW [dbo].[chengji_chaxun_view]
AS
SELECT dbo.tb_Student.ID, dbo.tb_Lesson.Name, dbo.tb_TaoTi.Name AS Expr1, 
      dbo.tb_StuResult.res_single, dbo.tb_StuResult.res_more, dbo.tb_StuResult.res_total, 
      dbo.tb_StuResult.res_subdate, dbo.tb_StuResult.taotiid
FROM dbo.tb_StuResult INNER JOIN
      dbo.tb_Student ON dbo.tb_StuResult.stu_id = dbo.tb_Student.ID INNER JOIN
      dbo.tb_TaoTi INNER JOIN
      dbo.tb_Lesson ON dbo.tb_TaoTi.LessonID = dbo.tb_Lesson.ID ON 
      dbo.tb_StuResult.taotiid = dbo.tb_TaoTi.ID


GO
/****** Object:  View [dbo].[kecheng_zhuanye_view]    Script Date: 2018/6/24 9:15:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[kecheng_zhuanye_view] AS SELECT dbo.tb_Lesson.Name, dbo.tb_Profession.Name AS Expr1, dbo.tb_Lesson.JoinTime, dbo.tb_Lesson.ID FROM dbo.tb_Lesson INNER JOIN dbo.tb_Profession ON dbo.tb_Lesson.ofProfession = dbo.tb_Profession.ID 
GO
/****** Object:  Table [dbo].[tb_Administrator]    Script Date: 2018/6/24 9:15:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Administrator](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PWD] [varchar](50) NOT NULL,
	[JoinTime] [datetime] NULL,
 CONSTRAINT [PK_tb_Administrator] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_Teacher]    Script Date: 2018/6/24 9:15:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_Teacher](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[PWD] [varchar](50) NOT NULL,
	[JoinTime] [datetime] NULL,
 CONSTRAINT [PK_tb_Teacher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tb_Administrator] ON 

INSERT [dbo].[tb_Administrator] ([ID], [Name], [PWD], [JoinTime]) VALUES (8, N'admin', N'admin', CAST(N'2018-06-24T08:54:12.347' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_Administrator] OFF
SET IDENTITY_INSERT [dbo].[tb_Lesson] ON 

INSERT [dbo].[tb_Lesson] ([ID], [Name], [ofProfession], [JoinTime]) VALUES (1, N'大学数学', 3, CAST(N'2018-06-20T11:39:21.747' AS DateTime))
INSERT [dbo].[tb_Lesson] ([ID], [Name], [ofProfession], [JoinTime]) VALUES (2, N'大学英语', 2, CAST(N'2018-06-20T11:41:36.780' AS DateTime))
INSERT [dbo].[tb_Lesson] ([ID], [Name], [ofProfession], [JoinTime]) VALUES (3, N'ASP.net', 1, CAST(N'2018-06-20T11:44:13.670' AS DateTime))
INSERT [dbo].[tb_Lesson] ([ID], [Name], [ofProfession], [JoinTime]) VALUES (4, N'大型数据库', 1, CAST(N'2018-06-24T08:55:20.460' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_Lesson] OFF
SET IDENTITY_INSERT [dbo].[tb_Profession] ON 

INSERT [dbo].[tb_Profession] ([ID], [Name], [JoinTime]) VALUES (1, N'计算机', CAST(N'2018-06-20T11:38:04.200' AS DateTime))
INSERT [dbo].[tb_Profession] ([ID], [Name], [JoinTime]) VALUES (2, N'英语', CAST(N'2018-06-20T11:38:04.200' AS DateTime))
INSERT [dbo].[tb_Profession] ([ID], [Name], [JoinTime]) VALUES (3, N'数学', CAST(N'2018-06-20T11:38:04.200' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_Profession] OFF
SET IDENTITY_INSERT [dbo].[tb_Questions] ON 

INSERT [dbo].[tb_Questions] ([id], [que_subject], [que_type], [que_joindate], [que_lessonid], [que_professionid], [que_taotiid], [optionA], [optionB], [optionC], [optionD], [que_answer], [note]) VALUES (10, N'1+2=?', N'单选题    ', CAST(N'2018-06-24T09:01:24.093' AS DateTime), 1, 3, 4, N'1', N'2', N'3', N'4', N'C         ', N'简单的数学运算')
INSERT [dbo].[tb_Questions] ([id], [que_subject], [que_type], [que_joindate], [que_lessonid], [que_professionid], [que_taotiid], [optionA], [optionB], [optionC], [optionD], [que_answer], [note]) VALUES (11, N'5*6=？', N'单选题    ', CAST(N'2018-06-24T09:01:56.903' AS DateTime), 1, 3, 4, N'30', N'18', N'12', N'10', N'A         ', N'')
INSERT [dbo].[tb_Questions] ([id], [que_subject], [que_type], [que_joindate], [que_lessonid], [que_professionid], [que_taotiid], [optionA], [optionB], [optionC], [optionD], [que_answer], [note]) VALUES (12, N'以下为整数的是', N'多选题    ', CAST(N'2018-06-24T09:02:47.880' AS DateTime), 1, 3, 4, N'1', N'2', N'3.5', N'4.4', N'A,B       ', N'')
INSERT [dbo].[tb_Questions] ([id], [que_subject], [que_type], [que_joindate], [que_lessonid], [que_professionid], [que_taotiid], [optionA], [optionB], [optionC], [optionD], [que_answer], [note]) VALUES (13, N'以下为负数的是', N'多选题    ', CAST(N'2018-06-24T09:03:25.880' AS DateTime), 1, 3, 4, N'-1', N'-1.5', N'-2', N'-4', N'A,B,C,D   ', N'')
SET IDENTITY_INSERT [dbo].[tb_Questions] OFF
INSERT [dbo].[tb_Student] ([ID], [Name], [PWD], [Sex], [JoinTime], [question], [answer], [profession], [IPAddress]) VALUES (N'00000000001', N'Student', N'123', N'男', CAST(N'2018-06-24T09:04:07.930' AS DateTime), N'Hello', N'你好', 1, NULL)
SET IDENTITY_INSERT [dbo].[tb_StuResult] ON 

INSERT [dbo].[tb_StuResult] ([res_id], [stu_id], [which_lesson], [taotiid], [taotiname], [res_single], [res_more], [res_subdate]) VALUES (16, N'00000000001', N'大学数学', 4, N'基本数学运算', 40, 60, CAST(N'2018-06-24T09:10:20.077' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_StuResult] OFF
SET IDENTITY_INSERT [dbo].[tb_TaoTi] ON 

INSERT [dbo].[tb_TaoTi] ([ID], [Name], [LessonID], [JoinTime]) VALUES (4, N'基本数学运算', 1, CAST(N'2018-06-24T09:00:54.337' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_TaoTi] OFF
SET IDENTITY_INSERT [dbo].[tb_Teacher] ON 

INSERT [dbo].[tb_Teacher] ([ID], [Name], [PWD], [JoinTime]) VALUES (1, N'teacher', N'123', CAST(N'2018-06-23T12:04:14.890' AS DateTime))
SET IDENTITY_INSERT [dbo].[tb_Teacher] OFF
ALTER TABLE [dbo].[tb_Administrator] ADD  CONSTRAINT [DF_tb_Administrator_JoinTime]  DEFAULT (getdate()) FOR [JoinTime]
GO
ALTER TABLE [dbo].[tb_Lesson] ADD  CONSTRAINT [DF_tb_Lesson_JoinTime]  DEFAULT (getdate()) FOR [JoinTime]
GO
ALTER TABLE [dbo].[tb_Profession] ADD  CONSTRAINT [DF_tb_Profession_JoinTime]  DEFAULT (getdate()) FOR [JoinTime]
GO
ALTER TABLE [dbo].[tb_Questions] ADD  CONSTRAINT [DF_tb_Questions_que_joindate]  DEFAULT (getdate()) FOR [que_joindate]
GO
ALTER TABLE [dbo].[tb_Student] ADD  CONSTRAINT [DF_tb_student_JoinTime]  DEFAULT (getdate()) FOR [JoinTime]
GO
ALTER TABLE [dbo].[tb_StuResult] ADD  CONSTRAINT [DF_tb_StuResult_res_subdate]  DEFAULT (getdate()) FOR [res_subdate]
GO
ALTER TABLE [dbo].[tb_TaoTi] ADD  CONSTRAINT [DF_tb_TaoTi_JoinTime]  DEFAULT (getdate()) FOR [JoinTime]
GO
ALTER TABLE [dbo].[tb_Teacher] ADD  CONSTRAINT [DF_tb_Teacher_JoinTime]  DEFAULT (getdate()) FOR [JoinTime]
GO
ALTER TABLE [dbo].[tb_Lesson]  WITH CHECK ADD  CONSTRAINT [FK_tb_Lesson_tb_Profession] FOREIGN KEY([ofProfession])
REFERENCES [dbo].[tb_Profession] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_Lesson] CHECK CONSTRAINT [FK_tb_Lesson_tb_Profession]
GO
ALTER TABLE [dbo].[tb_Questions]  WITH CHECK ADD  CONSTRAINT [FK_tb_Questions_tb_TaoTi] FOREIGN KEY([que_taotiid])
REFERENCES [dbo].[tb_TaoTi] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_Questions] CHECK CONSTRAINT [FK_tb_Questions_tb_TaoTi]
GO
ALTER TABLE [dbo].[tb_StuResult]  WITH CHECK ADD  CONSTRAINT [FK_tb_StuResult_tb_Student] FOREIGN KEY([stu_id])
REFERENCES [dbo].[tb_Student] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_StuResult] CHECK CONSTRAINT [FK_tb_StuResult_tb_Student]
GO
ALTER TABLE [dbo].[tb_TaoTi]  WITH CHECK ADD  CONSTRAINT [FK_tb_TaoTi_tb_Lesson] FOREIGN KEY([LessonID])
REFERENCES [dbo].[tb_Lesson] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tb_TaoTi] CHECK CONSTRAINT [FK_tb_TaoTi_tb_Lesson]
GO
/****** Object:  StoredProcedure [dbo].[add_admin]    Script Date: 2018/6/24 9:15:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[add_admin]
@Name varchar(50), @PWD varchar(50)
As
Begin 
insert into tb_Administrator(Name, PWD)
values(@Name, @PWD)
End
GO
/****** Object:  StoredProcedure [dbo].[add_questions]    Script Date: 2018/6/24 9:15:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create proc [dbo].[add_questions]
@que_professionid int, @que_lessonid int, @que_taotiid bigint, @que_subject varchar(50), @que_type char(10), 
@optionA varchar(50), @optionB varchar(50), @optionC varchar(50), @optionD varchar(50), @que_answer char(10), @note varchar(50)
As
Begin
insert into tb_Questions (que_professionid,que_lessonid,que_taotiid,que_subject,que_type,optionA,optionB,optionC,optionD,que_answer,note)
values (@que_professionid,@que_lessonid,@que_taotiid,@que_subject, @que_type, @optionA, @optionB, @optionC, @optionD, @que_answer, @note)
End
GO
/****** Object:  StoredProcedure [dbo].[add_teacher]    Script Date: 2018/6/24 9:15:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create proc [dbo].[add_teacher]
@Name varchar(50), @PWD varchar(50)
As
Begin 
insert into tb_Teacher(Name, PWD)
values(@Name, @PWD)
End
GO
USE [master]
GO
ALTER DATABASE [Examination] SET  READ_WRITE 
GO
