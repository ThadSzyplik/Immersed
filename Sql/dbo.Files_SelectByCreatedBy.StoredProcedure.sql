﻿USE [Immersed]
GO
/****** Object:  StoredProcedure [dbo].[Files_SelectByCreatedBy]    Script Date: 10/27/2022 3:45:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[Files_SelectByCreatedBy]
					@userid int
					,@PageIndex int 
					,@PageSize int 
AS

Declare @userid int = 17
				,@PageIndex int = 0
				,@PageSize int = 8
Execute dbo.Files_SelectByCreatedBy
				@userid
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

	Where f.CreatedBy = @userid
	ORDER BY f.Id

OfFSET @offSet Rows
Fetch Next @PageSize Rows ONLY

END
GO
