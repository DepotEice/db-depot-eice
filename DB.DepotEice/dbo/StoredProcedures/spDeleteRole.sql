CREATE PROCEDURE [dbo].[spDeleteRole]
	@id UNIQUEIDENTIFIER
AS
	DELETE FROM [dbo].[Roles]
	WHERE [Id] = @id
GO