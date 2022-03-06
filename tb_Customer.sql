USE [CustomerDB]
GO

/****** Object:  Table [dbo].[tb_Customer]    Script Date: 3/6/2022 3:15:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tb_Customer](
	[Customer_Id] [int] IDENTITY(1,1) NOT NULL,
	[Customer_Name] [nvarchar](500) NULL,
	[Customer_Phone] [nvarchar](15) NULL,
	[Customer_Address] [nvarchar](500) NULL,
	[Customer_Email] [nvarchar](100) NULL,
 CONSTRAINT [PK_tb_Customer] PRIMARY KEY CLUSTERED 
(
	[Customer_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

