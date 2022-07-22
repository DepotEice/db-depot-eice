CREATE PROCEDURE [dbo].[spGetUserToken]
	@id UNIQUEIDENTIFIER
AS
	SELECT *
	FROM [dbo].[UsersTokens]
	WHERE [Id] = @id
GO
