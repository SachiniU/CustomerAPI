USE [CustomerDB]
GO

/****** Object:  StoredProcedure [dbo].[UpdateCustomer_sp]    Script Date: 3/6/2022 3:20:06 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Sachini Nawarathne>
-- Create date: <04-03-2022>
-- Description:	<Update customer>
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[UpdateCustomer_sp]
	@Customer_Id int,
	@Customer_Name nvarchar(500) = null,
	@Customer_Phone nvarchar(15) = null, 
	@Customer_Address nvarchar(500) = null, 
	@Customer_Email nvarchar(100) = null
	
AS
BEGIN
	
	SET NOCOUNT ON;

	UPDATE tb_Customer 
    SET Customer_Name = @Customer_Name, Customer_Phone = @Customer_Phone, Customer_Address = @Customer_Address, Customer_Email = @Customer_Email 
    WHERE Customer_Id = @Customer_Id
    
	
END
GO

