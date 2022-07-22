CREATE PROCEDURE [dbo].[spGetUserTokens]
	@userId UNIQUEIDENTIFIER
AS
	SELECT *
	FROM [dbo].[UsersTokens]
	WHERE [UserId] = @userId
GO
