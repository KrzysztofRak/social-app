IF (OBJECT_ID('[dbo].[FK_LIKE_POST]', 'F') IS NOT NULL)
BEGIN
    ALTER TABLE [dbo].[Like] DROP CONSTRAINT [FK_LIKE_POST]
END
GO

DROP TABLE IF EXISTS [dbo].[Post]
GO

DROP TABLE IF EXISTS [dbo].[Like]
GO

DROP TABLE IF EXISTS [dbo].[Comment]
GO

DROP TABLE IF EXISTS [dbo].[UserInfo]
GO

CREATE TABLE [dbo].[Post] (
    [Id] INT IDENTITY (1, 1) NOT NULL,
    [UserId] NVARCHAR(100) NULL,
    [UserFullname] NVARCHAR(300) NULL,
    [PreviewImageUrl] NVARCHAR (2000) NULL,
    [Message] NVARCHAR (2000) NULL,
	[LikeCounter] INT NOT NULL DEFAULT(0),
	[Date] DATETIME NOT NULL DEFAULT(GETDATE()),
    PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

CREATE TABLE [dbo].[Like] (
    [Id] INT IDENTITY (1, 1) NOT NULL,
    [UserId] NVARCHAR(100) NULL,
    [PostId] INT NOT NULL,
	[Date] DATETIME NOT NULL DEFAULT(GETDATE()),
    PRIMARY KEY CLUSTERED ([Id] ASC),
    CONSTRAINT [FK_LIKE_POST] FOREIGN KEY ([PostId]) REFERENCES [dbo].[Post] ([Id])
)
GO

CREATE TABLE [dbo].[UserInfo] (
    [Id] INT IDENTITY (1, 1) NOT NULL,
    [UserId] NVARCHAR(100) NULL,
    [Firstname] NVARCHAR(100) NULL,
    [Lastname] NVARCHAR(100) NULL,
    [Position] NVARCHAR(100) NULL,
    [AvatarUrl] NVARCHAR(2048) NULL,
	[BirthDate] DATETIME NOT NULL DEFAULT(GETDATE()),
    [City] NVARCHAR(100) NULL,
    [PersonalDescription] NVARCHAR(500) NULL,
    [Interests] NVARCHAR(500) NULL,
    [Hobbys] NVARCHAR(500) NULL
    PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO

CREATE TABLE [dbo].[Comment] (
    [Id] INT IDENTITY (1, 1) NOT NULL,
    [UserId] NVARCHAR(100) NULL,
    [PostId] INT NOT NULL,
    [Message] NVARCHAR(1000) NULL,
    [Lastname] NVARCHAR(100) NULL,
	[Date] DATETIME NOT NULL DEFAULT(GETDATE()),
    PRIMARY KEY CLUSTERED ([Id] ASC)
)
GO
