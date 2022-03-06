USE [CustomerDB]
GO

/****** Object:  StoredProcedure [dbo].[DeleteCustomer_sp]    Script Date: 3/6/2022 3:19:16 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Sachini Nawarathne>
-- Create date: <04-03-2022>
-- Description:	<Delete customer>
-- =============================================
CREATE OR ALTER PROCEDURE [dbo].[DeleteCustomer_sp] 
	@Customer_Id int
AS
BEGIN
	
	SET NOCOUNT ON;

    DELETE FROM tb_Customer WHERE Customer_Id = @Customer_Id
	
END
GO

