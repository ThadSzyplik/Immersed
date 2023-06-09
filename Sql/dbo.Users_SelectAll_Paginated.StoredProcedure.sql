﻿USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[Users_SelectAll_Paginated]    Script Date: 10/26/2022 6:25:15 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROC [dbo].[Users_SelectAll_Paginated]
	@PageIndex int
	,@PageSize int

AS

/*
	DECLARE @PageIndex int = 0
			,@PageSize int = 5

	EXECUTE dbo.Users_SelectAll_Paginated @PageIndex, @PageSize

*/

BEGIN

	DECLARE @offset int = @PageIndex * @PageSize

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

	OFFSET @offset ROWS
		FETCH NEXT @PageSize ROWS ONLY

END
GO
