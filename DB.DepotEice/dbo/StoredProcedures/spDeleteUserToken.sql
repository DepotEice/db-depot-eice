CREATE PROCEDURE [dbo].[spDeleteUserToken]
	@id UNIQUEIDENTIFIER
AS
	DELETE FROM [dbo].[UsersTokens]
	WHERE [Id] = @id
GO
