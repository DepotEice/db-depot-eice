CREATE PROCEDURE [dbo].[spGetUser]
	@id UNIQUEIDENTIFIER
AS
	SELECT *
	FROM [dbo].[Users]
	WHERE [Id] = @id
GO
