CREATE PROCEDURE [dbo].[spGetRole]
	@id UNIQUEIDENTIFIER
AS
	SELECT *
	FROM [dbo].[Roles]
	WHERE [Id] = @id
GO
