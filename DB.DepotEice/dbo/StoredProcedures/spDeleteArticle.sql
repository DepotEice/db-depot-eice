CREATE PROCEDURE [dbo].[spDeleteArticle]
	@id INT
AS
	DELETE FROM [dbo].[Articles]
	WHERE [Id] = @id
GO
