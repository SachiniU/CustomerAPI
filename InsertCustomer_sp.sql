USE [CustomerDB]
GO

/****** Object:  StoredProcedure [dbo].[InsertCustomer_sp]    Script Date: 3/6/2022 3:19:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Sachini Udayanga>
-- Create date: <04-03-2022>
-- Description:	<Insert new customer>
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[InsertCustomer_sp]
	@Customer_Name nvarchar(500) = null,
	@Customer_Phone nvarchar(15) = null, 
	@Customer_Address nvarchar(500) = null, 
	@Customer_Email nvarchar(100) = null
AS
BEGIN
	
	SET NOCOUNT ON;

	INSERT INTO tb_Customer (Customer_Name, Customer_Phone, Customer_Address, Customer_Email) 
    VALUES (@Customer_Name, @Customer_Phone, @Customer_Address, @Customer_Email)
    
	
END
GO

