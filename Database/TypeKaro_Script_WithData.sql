USE [master]
GO
/****** Object:  Database [TypeKaro]    Script Date: 8/12/2020 4:22:14 PM ******/
CREATE DATABASE [TypeKaro]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TypeKaro', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TypeKaro.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TypeKaro_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\TypeKaro_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TypeKaro] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TypeKaro].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TypeKaro] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TypeKaro] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TypeKaro] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TypeKaro] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TypeKaro] SET ARITHABORT OFF 
GO
ALTER DATABASE [TypeKaro] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TypeKaro] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TypeKaro] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TypeKaro] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TypeKaro] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TypeKaro] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TypeKaro] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TypeKaro] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TypeKaro] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TypeKaro] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TypeKaro] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TypeKaro] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TypeKaro] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TypeKaro] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TypeKaro] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TypeKaro] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TypeKaro] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TypeKaro] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TypeKaro] SET  MULTI_USER 
GO
ALTER DATABASE [TypeKaro] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TypeKaro] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TypeKaro] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TypeKaro] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TypeKaro] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TypeKaro] SET QUERY_STORE = OFF
GO
USE [TypeKaro]
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
USE [TypeKaro]
GO
/****** Object:  Table [dbo].[AccessLevel]    Script Date: 8/12/2020 4:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccessLevel](
	[AccessId] [uniqueidentifier] NOT NULL,
	[AccessTo] [varchar](100) NOT NULL,
	[AccessRemark] [varchar](200) NOT NULL,
 CONSTRAINT [PK_AccessLevel] PRIMARY KEY CLUSTERED 
(
	[AccessId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupType]    Script Date: 8/12/2020 4:22:14 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupType](
	[GroupTypeId] [uniqueidentifier] NOT NULL,
	[GroupTypeName] [varchar](200) NOT NULL,
	[GroupRemark] [varchar](max) NOT NULL,
	[IsPrivate] [bit] NULL,
	[IsPost] [bit] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GroupType] PRIMARY KEY CLUSTERED 
(
	[GroupTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserBase]    Script Date: 8/12/2020 4:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserBase](
	[UserId] [uniqueidentifier] NOT NULL,
	[UserDisplayName] [varchar](50) NOT NULL,
	[UserName] [varchar](100) NOT NULL,
	[UserEmailId] [varchar](100) NULL,
	[UserContact] [varchar](50) NULL,
	[UserPassword] [nvarchar](50) NULL,
	[UserSource] [varchar](50) NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[LastLoginDate] [datetime] NULL,
 CONSTRAINT [PK_LoginKaro] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroup]    Script Date: 8/12/2020 4:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroup](
	[GroupId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[GroupTypeId] [uniqueidentifier] NOT NULL,
	[AccessId] [uniqueidentifier] NOT NULL,
	[GroupName] [nvarchar](300) NOT NULL,
	[GroupDescription] [nvarchar](max) NULL,
	[GroupTag] [nvarchar](200) NULL,
	[CreatedBy] [uniqueidentifier] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_GroupBnao] PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserPost]    Script Date: 8/12/2020 4:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserPost](
	[PostId] [uniqueidentifier] NOT NULL,
	[PostHeader] [nvarchar](200) NULL,
	[PostMessage] [nvarchar](max) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[GroupId] [uniqueidentifier] NULL,
	[IsActive] [bit] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_PostKaro] PRIMARY KEY CLUSTERED 
(
	[PostId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 8/12/2020 4:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[ProfileId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[UserImage] [image] NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
 CONSTRAINT [PK_UserProfile] PRIMARY KEY CLUSTERED 
(
	[ProfileId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[AccessLevel] ([AccessId], [AccessTo], [AccessRemark]) VALUES (N'77d2a8f5-4999-458e-8852-3cb7e607e5c4', N'Personal', N'Visible or Access to my Followers')
GO
INSERT [dbo].[AccessLevel] ([AccessId], [AccessTo], [AccessRemark]) VALUES (N'9e672772-8993-43f7-bdab-a92319c70655', N'Group', N'Visible or Access to Group Member Only')
GO
INSERT [dbo].[AccessLevel] ([AccessId], [AccessTo], [AccessRemark]) VALUES (N'6079fa57-c070-4097-804d-b0cd1faee6ae', N'Public', N'Visible or Access to All')
GO
INSERT [dbo].[GroupType] ([GroupTypeId], [GroupTypeName], [GroupRemark], [IsPrivate], [IsPost], [IsActive], [CreatedDate], [ModifiedDate]) VALUES (N'dee54386-6917-4c93-b5ce-0c648cb2c491', N'Health', N'For the Health Tips', 0, 0, 1, CAST(N'2020-06-06T11:34:34.533' AS DateTime), CAST(N'2020-06-06T11:34:34.533' AS DateTime))
GO
INSERT [dbo].[GroupType] ([GroupTypeId], [GroupTypeName], [GroupRemark], [IsPrivate], [IsPost], [IsActive], [CreatedDate], [ModifiedDate]) VALUES (N'd1b5b1e0-1544-4372-851c-14dd7a786cd0', N'Confession', N'For the Confesstion', 0, 0, 1, CAST(N'2020-06-06T11:36:00.757' AS DateTime), CAST(N'2020-06-06T11:36:00.757' AS DateTime))
GO
INSERT [dbo].[GroupType] ([GroupTypeId], [GroupTypeName], [GroupRemark], [IsPrivate], [IsPost], [IsActive], [CreatedDate], [ModifiedDate]) VALUES (N'3869c87a-f653-410b-bdeb-29668d5777cb', N'Education', N'For the Education Institute', 0, 0, 1, CAST(N'2020-06-06T11:34:09.570' AS DateTime), CAST(N'2020-06-06T11:34:09.570' AS DateTime))
GO
INSERT [dbo].[GroupType] ([GroupTypeId], [GroupTypeName], [GroupRemark], [IsPrivate], [IsPost], [IsActive], [CreatedDate], [ModifiedDate]) VALUES (N'3e21df1f-d210-47df-a020-311cf45e8a3c', N'Discussion', N'For the User Question & Answer', 0, 1, 1, CAST(N'2020-06-06T11:39:25.313' AS DateTime), CAST(N'2020-06-06T11:39:25.313' AS DateTime))
GO
INSERT [dbo].[GroupType] ([GroupTypeId], [GroupTypeName], [GroupRemark], [IsPrivate], [IsPost], [IsActive], [CreatedDate], [ModifiedDate]) VALUES (N'3992cab2-d59c-49c0-8899-317ea7c17be2', N'Personal', N'For the Post', 0, 1, 1, CAST(N'2020-06-27T10:53:42.813' AS DateTime), CAST(N'2020-06-27T10:53:42.813' AS DateTime))
GO
INSERT [dbo].[GroupType] ([GroupTypeId], [GroupTypeName], [GroupRemark], [IsPrivate], [IsPost], [IsActive], [CreatedDate], [ModifiedDate]) VALUES (N'34259b94-45a1-45cf-8346-6ecb494b86c6', N'Work', N'For the Official Group', 1, 1, 1, CAST(N'2020-06-06T11:21:57.250' AS DateTime), CAST(N'2020-06-06T11:21:57.250' AS DateTime))
GO
INSERT [dbo].[GroupType] ([GroupTypeId], [GroupTypeName], [GroupRemark], [IsPrivate], [IsPost], [IsActive], [CreatedDate], [ModifiedDate]) VALUES (N'45c607e9-0c0c-4249-b511-a7d7ba4e57dd', N'News', N'For the News', 0, 0, 1, CAST(N'2020-06-06T11:20:58.497' AS DateTime), CAST(N'2020-06-06T11:20:58.497' AS DateTime))
GO
INSERT [dbo].[GroupType] ([GroupTypeId], [GroupTypeName], [GroupRemark], [IsPrivate], [IsPost], [IsActive], [CreatedDate], [ModifiedDate]) VALUES (N'77595497-c347-4257-a1ea-d0401c1d67b2', N'Sports', N'For the Sports Related Infomation or Event', 0, 0, 1, CAST(N'2020-06-06T11:35:25.480' AS DateTime), CAST(N'2020-06-06T11:35:25.480' AS DateTime))
GO
INSERT [dbo].[GroupType] ([GroupTypeId], [GroupTypeName], [GroupRemark], [IsPrivate], [IsPost], [IsActive], [CreatedDate], [ModifiedDate]) VALUES (N'fd10b82e-67bd-4293-9cd6-ed6de3272c3b', N'Religious', N'For the Religious Information', 0, 0, 1, CAST(N'2020-06-06T11:21:29.460' AS DateTime), CAST(N'2020-06-06T11:21:29.460' AS DateTime))
GO
INSERT [dbo].[UserBase] ([UserId], [UserDisplayName], [UserName], [UserEmailId], [UserContact], [UserPassword], [UserSource], [IsActive], [CreatedDate], [ModifiedDate], [LastLoginDate]) VALUES (N'b385a254-f500-4ac9-b582-bc9b81fe2b04', N'Manav Sharma', N'manavsharma27', N'manavsharma1989@gmail.com', N'7878787878', N'T!T@n1130', N'WebSite', 1, CAST(N'2020-06-06T10:16:17.677' AS DateTime), CAST(N'2020-06-06T10:16:17.677' AS DateTime), NULL)
GO
INSERT [dbo].[UserBase] ([UserId], [UserDisplayName], [UserName], [UserEmailId], [UserContact], [UserPassword], [UserSource], [IsActive], [CreatedDate], [ModifiedDate], [LastLoginDate]) VALUES (N'cc936c85-188e-4004-bc65-d624273a60bc', N'Ravi Dubey', N'ravi1989', N'ravidubey1989@gmail.com', N'7878797989', N'T!T@n1130', N'WebSite', 1, CAST(N'2020-06-06T10:31:06.230' AS DateTime), CAST(N'2020-06-06T10:31:06.230' AS DateTime), NULL)
GO
ALTER TABLE [dbo].[AccessLevel] ADD  CONSTRAINT [DF_AccessLevel_AccessId]  DEFAULT (newid()) FOR [AccessId]
GO
ALTER TABLE [dbo].[GroupType] ADD  CONSTRAINT [DF_Table_1_GroupId]  DEFAULT (newid()) FOR [GroupTypeId]
GO
ALTER TABLE [dbo].[GroupType] ADD  CONSTRAINT [DF_GroupType_IsPrivate]  DEFAULT ((1)) FOR [IsPrivate]
GO
ALTER TABLE [dbo].[GroupType] ADD  CONSTRAINT [DF_GroupType_IsPost]  DEFAULT ((0)) FOR [IsPost]
GO
ALTER TABLE [dbo].[GroupType] ADD  CONSTRAINT [DF_GroupType_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[GroupType] ADD  CONSTRAINT [DF_GroupType_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[GroupType] ADD  CONSTRAINT [DF_GroupType_ModifiedDate]  DEFAULT (getutcdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[UserBase] ADD  CONSTRAINT [DF_LoginKaro_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserBase] ADD  CONSTRAINT [DF_LoginKaro_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserBase] ADD  CONSTRAINT [DF_LoginKaro_ModifiedDate]  DEFAULT (getutcdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[UserGroup] ADD  CONSTRAINT [DF_GroupBnao_GroupId]  DEFAULT (newid()) FOR [GroupId]
GO
ALTER TABLE [dbo].[UserGroup] ADD  CONSTRAINT [DF_GroupBnao_GroupITypeId]  DEFAULT (newid()) FOR [GroupTypeId]
GO
ALTER TABLE [dbo].[UserGroup] ADD  CONSTRAINT [DF_GroupBnao_UserId]  DEFAULT (newid()) FOR [CreatedBy]
GO
ALTER TABLE [dbo].[UserGroup] ADD  CONSTRAINT [DF_GroupBnao_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserGroup] ADD  CONSTRAINT [DF_GroupBnao_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserGroup] ADD  CONSTRAINT [DF_GroupBnao_ModifiedDate]  DEFAULT (getutcdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[UserPost] ADD  CONSTRAINT [DF_PostKaro_PostId]  DEFAULT (newid()) FOR [PostId]
GO
ALTER TABLE [dbo].[UserPost] ADD  CONSTRAINT [DF_PostKaro_IsActive]  DEFAULT ((1)) FOR [IsActive]
GO
ALTER TABLE [dbo].[UserPost] ADD  CONSTRAINT [DF_PostKaro_CreatedDate]  DEFAULT (getutcdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[UserPost] ADD  CONSTRAINT [DF_PostKaro_ModifiedDate]  DEFAULT (getutcdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[UserProfile] ADD  CONSTRAINT [DF_Table_1_PostId]  DEFAULT (newid()) FOR [ProfileId]
GO
ALTER TABLE [dbo].[UserProfile] ADD  CONSTRAINT [DF_UserProfile_ModifiedDate]  DEFAULT (getutcdate()) FOR [ModifiedDate]
GO
ALTER TABLE [dbo].[GroupType]  WITH NOCHECK ADD  CONSTRAINT [FK_GroupType_GroupType] FOREIGN KEY([GroupTypeId])
REFERENCES [dbo].[GroupType] ([GroupTypeId])
GO
ALTER TABLE [dbo].[GroupType] CHECK CONSTRAINT [FK_GroupType_GroupType]
GO
ALTER TABLE [dbo].[UserGroup]  WITH CHECK ADD  CONSTRAINT [FK_GroupBnao_GroupBnao] FOREIGN KEY([GroupId])
REFERENCES [dbo].[UserGroup] ([GroupId])
GO
ALTER TABLE [dbo].[UserGroup] CHECK CONSTRAINT [FK_GroupBnao_GroupBnao]
GO
/****** Object:  StoredProcedure [dbo].[spGroupBanao]    Script Date: 8/12/2020 4:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[spGroupBanao]
(
	@UserId	uniqueidentifier,
	@GroupTypeId	uniqueidentifier,
	@AccessId	uniqueidentifier,
	@GroupName	nvarchar(300),
	@GroupDescription	nvarchar(MAX),
	@GroupTag	nvarchar(200)
)
AS
BEGIN
	-- Get the Count of Groups by User
	DECLARE @GroupCount int;
	SET @GroupCount = (SELECT COUNT(1) FROM UserGroup WHERE UserId = @UserId)

	-- Create Group  - Not More than that 5 group
	IF @GroupCount < 6
	BEGIN
		INSERT INTO UserGroup
		(UserId, GroupTypeId, AccessId, GroupName, GroupDescription, GroupTag)
		VALUES
		(@UserId, @GroupTypeId, @AccessId, @GroupName, @GroupDescription, @GroupTag)

		SELECT 1
	END	
	ELSE
	BEGIN
		SELECT 0
	END

END
GO
/****** Object:  StoredProcedure [dbo].[spLoginKaro]    Script Date: 8/12/2020 4:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- ======================================================================
-- Description: This Stored Procedure to Update the User Password
-- ======================================================================
CREATE PROCEDURE [dbo].[spLoginKaro]
	@UserEmailId	varchar(100),
	@UserName varchar(100),
	@UserContact	varchar(50)	,
	@UserPassword	nvarchar(50)	
AS
BEGIN
	
	SELECT UserId,UserDisplayName,UserName
	FROM UserBase
	WHERE (UserEmailId = @UserEmailId OR UserContact = @UserContact OR UserName = @UserName) 
	   AND UserPassword = @UserPassword

	-- Update The Status When the User Last Logged in
	IF @@ROWCOUNT > 0
	BEGIN
		UPDATE UserBase
		SET LastLoginDate = GETUTCDATE()
		WHERE (UserEmailId = @UserEmailId OR UserContact = @UserContact OR UserName = @UserName) 
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[spRegisterUser]    Script Date: 8/12/2020 4:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[spRegisterUser]
	@UserDisplayName	varchar(50)	,
	@UserName	varchar(100)	,
	@UserEmailId	varchar(100)	,
	@UserContact	varchar(50)	,
	@UserPassword	nvarchar(50)	,
	@UserSource	varchar(50)	
AS
BEGIN
	
	DECLARE @UserId uniqueidentifier;

    IF NOT EXISTS (SELECT 1 FROM Userbase WHERE UserContact = @UserContact OR UserEmailId = @UserEmailId)
	BEGIN
		-- User Registration
		SET @UserId = NEWID();
		INSERT INTO Userbase
			(UserId, UserDisplayName, UserName, UserEmailId, UserContact, UserPassword, UserSource)
		VALUES
			(@UserId, @UserDisplayName, @UserName, @UserEmailId, @UserContact, @UserPassword, @UserSource)			
	END
	ELSE
	BEGIN
		-- User Contact/Email already Exists - Set Empty GUID = '00000000-0000-0000-0000-000000000000'
		SET @UserId = CAST(0x0 AS UNIQUEIDENTIFIER);
	END

	-- Return Value
	SELECT @UserId AS ReturnValue
END
GO
/****** Object:  StoredProcedure [dbo].[spUpdateUserPassword]    Script Date: 8/12/2020 4:22:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- ======================================================================
-- Description: This Stored Procedure to Update the User Password
-- ======================================================================
CREATE PROCEDURE [dbo].[spUpdateUserPassword]
	@UserId uniqueidentifier ,	
	@OldPassword	nvarchar(50)	,
	@NewPassword	varchar(50)	
AS
BEGIN
	
	UPDATE 
		Userbase
	SET 
		UserPassword = @NewPassword
	WHERE 
		UserId = @UserId 
		AND UserPassword = @OldPassword

	-- Check if User Password Updated or not
	IF @@RowCount = 1
	BEGIN
		-- Password Updated Successfully
		SELECT 1
	END
	ELSE
	BEGIN
		-- Password has not updated as Old Password has not matched 
		SELECT 0
	END
	
END
GO
USE [master]
GO
ALTER DATABASE [TypeKaro] SET  READ_WRITE 
GO
