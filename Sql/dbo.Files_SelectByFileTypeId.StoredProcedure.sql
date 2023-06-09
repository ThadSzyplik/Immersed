﻿USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[Files_SelectByFileTypeId]    Script Date: 3/2/2023 8:16:00 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Files_SelectByFileTypeId]
					@Id int
					,@PageIndex int 
					,@PageSize int 
AS

/*
Select *
From dbo.Files

Declare @Id int = 2
				,@PageIndex int = 0
				,@PageSize int = 50
Execute dbo.Files_SelectByFileTypeId
				@Id
				,@PageIndex
				,@PageSize

*/

BEGIN

Declare @offset int = @PageIndex * @PageSize

					SELECT f.Id as Id
						  ,f.[Name]
						  ,f.[Url]
						  ,ft.Id as FileTypeId
						  ,ft.Name as FileTypeName						  					  
						  ,[CreatedBy]
						  ,[DateCreated]
						  ,[IsDeleted]
						  ,TotalCount = COUNT(1) OVER()


	FROM [dbo].[Files] as f inner join dbo.FileTypes as ft
						on f.FileTypeId = ft.Id

	WHERE IsDeleted = 0
	ORDER BY ft.Id

OfFSET @offSet Rows
Fetch Next @PageSize Rows ONLY

END
GO
