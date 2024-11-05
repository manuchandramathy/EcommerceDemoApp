USE [master]
GO
/****** Object:  Database [E-commerce]    Script Date: 11/5/2024 10:32:12 PM ******/
CREATE DATABASE [E-commerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'E-commerce', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\E-commerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'E-commerce_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\E-commerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [E-commerce] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [E-commerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [E-commerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [E-commerce] SET ANSI_NULLS OFF  
GO
ALTER DATABASE [E-commerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [E-commerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [E-commerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [E-commerce] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [E-commerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [E-commerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [E-commerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [E-commerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [E-commerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [E-commerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [E-commerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [E-commerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [E-commerce] SET  DISABLE_BROKER 
GO
ALTER DATABASE [E-commerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [E-commerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [E-commerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [E-commerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [E-commerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [E-commerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [E-commerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [E-commerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [E-commerce] SET  MULTI_USER 
GO
ALTER DATABASE [E-commerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [E-commerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [E-commerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [E-commerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [E-commerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [E-commerce] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [E-commerce] SET QUERY_STORE = ON
GO
ALTER DATABASE [E-commerce] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [E-commerce]
GO
/****** Object:  Table [dbo].[CUSTOMERS]    Script Date: 11/5/2024 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMERS](
	[CUSTOMERID] [nvarchar](10) NOT NULL,
	[FIRSTNAME] [nvarchar](50) NULL,
	[LASTNAME] [nvarchar](50) NULL,
	[EMAIL] [nvarchar](50) NULL,
	[HOUSENO] [nvarchar](50) NULL,
	[STREET] [nvarchar](50) NULL,
	[TOWN] [nvarchar](50) NULL,
	[POSTCODE] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[CUSTOMERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERITEMS]    Script Date: 11/5/2024 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERITEMS](
	[ORDERITEMID] [int] IDENTITY(1,1) NOT NULL,
	[ORDERID] [int] NULL,
	[PRODUCTID] [int] NULL,
	[QUANTITY] [int] NULL,
	[PRICE] [decimal](9, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[ORDERITEMID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORDERS]    Script Date: 11/5/2024 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORDERS](
	[ORDERID] [int] IDENTITY(1,1) NOT NULL,
	[CUSTOMERID] [nvarchar](10) NULL,
	[ORDERDATE] [date] NULL,
	[DELIVERYEXPECTED] [date] NULL,
	[CONTAINSGIFT] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ORDERID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRODUCTS]    Script Date: 11/5/2024 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRODUCTS](
	[PRODUCTID] [int] IDENTITY(1,1) NOT NULL,
	[PRODUCTNAME] [nvarchar](50) NULL,
	[COLOUR] [nvarchar](20) NULL,
	[SIZE] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[PRODUCTID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CUSTOMERS] ([CUSTOMERID], [FIRSTNAME], [LASTNAME], [EMAIL], [HOUSENO], [STREET], [TOWN], [POSTCODE]) VALUES (N'A99001', N'Chris', N'Gregory', N'chris@gmail.com', N'7A', N'Marsh Lane', N'Leeds', N'LS9 7NE')
INSERT [dbo].[CUSTOMERS] ([CUSTOMERID], [FIRSTNAME], [LASTNAME], [EMAIL], [HOUSENO], [STREET], [TOWN], [POSTCODE]) VALUES (N'C34454', N'Bob', N'Marshal', N'bob@aol.com', N'1A', N'Uppingham Gate', N'Uppingham', N'LE15 9NY')
INSERT [dbo].[CUSTOMERS] ([CUSTOMERID], [FIRSTNAME], [LASTNAME], [EMAIL], [HOUSENO], [STREET], [TOWN], [POSTCODE]) VALUES (N'R34788', N'Jack', N'Ross', N'jack@yahoo.com', N'4B', N'Strabrokeway', N'Wortley', N'LS12 4NB')
INSERT [dbo].[CUSTOMERS] ([CUSTOMERID], [FIRSTNAME], [LASTNAME], [EMAIL], [HOUSENO], [STREET], [TOWN], [POSTCODE]) VALUES (N'X45001', N'Ken', N'Martin', N'ken@aol.com', N'32B', N'Harehills', N'York', N'LE15 9NY')
GO
SET IDENTITY_INSERT [dbo].[ORDERITEMS] ON 

INSERT [dbo].[ORDERITEMS] ([ORDERITEMID], [ORDERID], [PRODUCTID], [QUANTITY], [PRICE]) VALUES (965, 456, 110, 3, CAST(45.00 AS Decimal(9, 2)))
INSERT [dbo].[ORDERITEMS] ([ORDERITEMID], [ORDERID], [PRODUCTID], [QUANTITY], [PRICE]) VALUES (966, 456, 113, 1, CAST(120.00 AS Decimal(9, 2)))
INSERT [dbo].[ORDERITEMS] ([ORDERITEMID], [ORDERID], [PRODUCTID], [QUANTITY], [PRICE]) VALUES (1001, 545, 111, 1, CAST(150.00 AS Decimal(9, 2)))
INSERT [dbo].[ORDERITEMS] ([ORDERITEMID], [ORDERID], [PRODUCTID], [QUANTITY], [PRICE]) VALUES (1150, 652, 111, 1, CAST(150.00 AS Decimal(9, 2)))
INSERT [dbo].[ORDERITEMS] ([ORDERITEMID], [ORDERID], [PRODUCTID], [QUANTITY], [PRICE]) VALUES (1151, 652, 112, 2, CAST(300.00 AS Decimal(9, 2)))
INSERT [dbo].[ORDERITEMS] ([ORDERITEMID], [ORDERID], [PRODUCTID], [QUANTITY], [PRICE]) VALUES (1152, 652, 110, 5, CAST(65.00 AS Decimal(9, 2)))
INSERT [dbo].[ORDERITEMS] ([ORDERITEMID], [ORDERID], [PRODUCTID], [QUANTITY], [PRICE]) VALUES (2151, 786, 113, 1, CAST(120.00 AS Decimal(9, 2)))
INSERT [dbo].[ORDERITEMS] ([ORDERITEMID], [ORDERID], [PRODUCTID], [QUANTITY], [PRICE]) VALUES (2152, 786, 110, 2, CAST(30.00 AS Decimal(9, 2)))
INSERT [dbo].[ORDERITEMS] ([ORDERITEMID], [ORDERID], [PRODUCTID], [QUANTITY], [PRICE]) VALUES (2153, 786, 112, 1, CAST(75.00 AS Decimal(9, 2)))
SET IDENTITY_INSERT [dbo].[ORDERITEMS] OFF
GO
SET IDENTITY_INSERT [dbo].[ORDERS] ON 

INSERT [dbo].[ORDERS] ([ORDERID], [CUSTOMERID], [ORDERDATE], [DELIVERYEXPECTED], [CONTAINSGIFT]) VALUES (456, N'R34788', CAST(N'2023-05-03' AS Date), CAST(N'2023-05-10' AS Date), 0)
INSERT [dbo].[ORDERS] ([ORDERID], [CUSTOMERID], [ORDERDATE], [DELIVERYEXPECTED], [CONTAINSGIFT]) VALUES (545, N'C34454', CAST(N'2023-06-07' AS Date), CAST(N'2023-06-15' AS Date), 0)
INSERT [dbo].[ORDERS] ([ORDERID], [CUSTOMERID], [ORDERDATE], [DELIVERYEXPECTED], [CONTAINSGIFT]) VALUES (652, N'A99001', CAST(N'2023-07-10' AS Date), CAST(N'2023-07-25' AS Date), 1)
INSERT [dbo].[ORDERS] ([ORDERID], [CUSTOMERID], [ORDERDATE], [DELIVERYEXPECTED], [CONTAINSGIFT]) VALUES (667, N'R34788', CAST(N'2023-09-20' AS Date), CAST(N'2023-09-30' AS Date), 0)
INSERT [dbo].[ORDERS] ([ORDERID], [CUSTOMERID], [ORDERDATE], [DELIVERYEXPECTED], [CONTAINSGIFT]) VALUES (786, N'R34788', CAST(N'2023-10-28' AS Date), CAST(N'2023-11-21' AS Date), 1)
SET IDENTITY_INSERT [dbo].[ORDERS] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCTS] ON 

INSERT [dbo].[PRODUCTS] ([PRODUCTID], [PRODUCTNAME], [COLOUR], [SIZE]) VALUES (110, N'Tennis Ball', N'Yellow', N'S')
INSERT [dbo].[PRODUCTS] ([PRODUCTID], [PRODUCTNAME], [COLOUR], [SIZE]) VALUES (111, N'Tennis Net', N'White', N'XL')
INSERT [dbo].[PRODUCTS] ([PRODUCTID], [PRODUCTNAME], [COLOUR], [SIZE]) VALUES (112, N'Tennis Racket', N'White', N'L')
INSERT [dbo].[PRODUCTS] ([PRODUCTID], [PRODUCTNAME], [COLOUR], [SIZE]) VALUES (113, N'Tennis Gear', N'White', N'XL')
SET IDENTITY_INSERT [dbo].[PRODUCTS] OFF
GO
ALTER TABLE [dbo].[ORDERITEMS]  WITH CHECK ADD FOREIGN KEY([ORDERID])
REFERENCES [dbo].[ORDERS] ([ORDERID])
GO
ALTER TABLE [dbo].[ORDERITEMS]  WITH CHECK ADD FOREIGN KEY([PRODUCTID])
REFERENCES [dbo].[PRODUCTS] ([PRODUCTID])
GO
ALTER TABLE [dbo].[ORDERS]  WITH CHECK ADD FOREIGN KEY([CUSTOMERID])
REFERENCES [dbo].[CUSTOMERS] ([CUSTOMERID])
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerByEmailAndId]    Script Date: 11/5/2024 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCustomerByEmailAndId]
    @Email NVARCHAR(255),
    @CustomerId NVARCHAR(20)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT *
    FROM Customers
    WHERE Email = @Email AND CustomerId = @CustomerId;
END

GO
/****** Object:  StoredProcedure [dbo].[GetLatestOrderByCustomerId]    Script Date: 11/5/2024 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetLatestOrderByCustomerId]
    @CustomerId NVARCHAR(50)
AS
BEGIN
    SELECT 
        o.ORDERID, 
        o.ORDERDATE, 
        o.DELIVERYEXPECTED,
        oi.PRODUCTID,
        oi.QUANTITY, 
        oi.PRICE, 
        p.PRODUCTNAME,
        o.CONTAINSGIFT,
        CONCAT(c.HOUSENO, ' ', c.STREET, ', ', c.TOWN, ', ', c.POSTCODE) AS DeliveryAddress
    FROM 
        ORDERS o
    INNER JOIN 
        ORDERITEMS oi ON o.ORDERID = oi.ORDERID
    INNER JOIN 
        PRODUCTS p ON oi.PRODUCTID = p.PRODUCTID
    INNER JOIN 
        CUSTOMERS c ON o.CUSTOMERID = c.CUSTOMERID
    WHERE 
        o.CUSTOMERID = @CustomerId
    ORDER BY 
        o.ORDERDATE DESC
END
GO
/****** Object:  StoredProcedure [dbo].[GetMostRecentOrder]    Script Date: 11/5/2024 10:32:13 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetMostRecentOrder]
    @Email NVARCHAR(50),
    @CustomerID NVARCHAR(10)
AS
BEGIN
    -- Check if email and customer ID match
    IF NOT EXISTS (SELECT 1 FROM CUSTOMERS WHERE EMAIL = @Email AND CUSTOMERID = @CustomerID)
    BEGIN
        -- Return error if email and ID don't match
        THROW 50000, 'Invalid customer ID or email address.', 1;
    END

    -- Select the most recent order with customer details and order items
    SELECT TOP 1
        c.FIRSTNAME,
        c.LASTNAME,
        o.ORDERID AS OrderNumber,
        o.ORDERDATE,
        o.DELIVERYEXPECTED,
        c.HOUSENO + ' ' + c.STREET + ', ' + c.TOWN + ', ' + c.POSTCODE AS DeliveryAddress
    INTO #OrderInfo
    FROM ORDERS o
    JOIN CUSTOMERS c ON o.CUSTOMERID = c.CUSTOMERID
    WHERE o.CUSTOMERID = @CustomerID
    ORDER BY o.ORDERDATE DESC;

    -- Check if order was found, return details if found
    IF @@ROWCOUNT = 0
    BEGIN
        -- No orders for this customer, return only customer details
        SELECT
            c.FIRSTNAME,
            c.LASTNAME,
            NULL AS OrderNumber,
            NULL AS OrderDate,
            NULL AS DeliveryExpected,
            c.HOUSENO + ' ' + c.STREET + ', ' + c.TOWN + ', ' + c.POSTCODE AS DeliveryAddress
        FROM CUSTOMERS c
        WHERE c.CUSTOMERID = @CustomerID;
    END
    ELSE
    BEGIN
        -- Get order items, mask product name if contains gift
        SELECT
            CASE WHEN o.CONTAINSGIFT = 1 THEN 'Gift' ELSE p.PRODUCTNAME END AS Product,
            oi.QUANTITY,
            oi.PRICE AS PriceEach
        FROM ORDERITEMS oi
        JOIN PRODUCTS p ON oi.PRODUCTID = p.PRODUCTID
        JOIN ORDERS o ON oi.ORDERID = o.ORDERID
        WHERE o.ORDERID = (SELECT OrderNumber FROM #OrderInfo);

        -- Output main order information
        SELECT * FROM #OrderInfo;
    END

    -- Cleanup temporary table
    DROP TABLE #OrderInfo;
END;
GO
USE [master]
GO
ALTER DATABASE [E-commerce] SET  READ_WRITE 
GO
