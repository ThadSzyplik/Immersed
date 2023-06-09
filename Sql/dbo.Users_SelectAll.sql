﻿USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectAll]    Script Date: 3/22/2023 4:51:53 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Users_SelectAll]


AS

/*

	EXECUTE dbo.Users_SelectAll 

*/

BEGIN

	SELECT [Id]
		,[Email]
		,[FirstName]
		,[LastName]
		,[Mi]
		,[AvatarUrl]
		,[IsConfirmed]
		,[StatusTypeId]
		,[DateCreated]
		,[DateModified]
		,COUNT(1) OVER() TotalCount
	FROM [dbo].[Users]

	ORDER BY Id

END
GO
