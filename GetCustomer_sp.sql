USE [CustomerDB]
GO

/****** Object:  StoredProcedure [dbo].[GetCustomer_sp]    Script Date: 3/6/2022 3:19:36 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Sachini Nawarathne>
-- Create date: <04-03-2022>
-- Description:	<Get customer data>
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[GetCustomer_sp] 
AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT Customer_Id , Customer_Name, Customer_Phone, Customer_Address, Customer_Email FROM tb_Customer

END
GO

