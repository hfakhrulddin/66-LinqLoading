SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerCode] [nvarchar](50) NULL,
	[CustomerName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerAddresses]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerAddresses](
	[Addressid] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nchar](10) NULL,
 CONSTRAINT [PK_CustomerAddresses] PRIMARY KEY CLUSTERED 
(
	[Addressid] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Phone]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Phone](
	[PhoneId] [int] IDENTITY(1,1) NOT NULL,
	[AddressId] [int] NULL,
	[MobilePhone] [nvarchar](50) NULL,
	[LandLine] [nvarchar](50) NULL,
 CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[PhoneId] ASC
)WITH (IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAddresses_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAddresses]'))
ALTER TABLE [dbo].[CustomerAddresses]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAddresses_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerId])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Phone_CustomerAddresses]') AND parent_object_id = OBJECT_ID(N'[dbo].[Phone]'))
ALTER TABLE [dbo].[Phone]  WITH CHECK ADD  CONSTRAINT [FK_Phone_CustomerAddresses] FOREIGN KEY([AddressId])
REFERENCES [dbo].[CustomerAddresses] ([Addressid])
