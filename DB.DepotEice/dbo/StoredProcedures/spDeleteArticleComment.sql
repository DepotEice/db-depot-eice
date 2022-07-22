CREATE PROCEDURE [dbo].[spDeleteArticleComment]
	@id INT
AS
	DELETE FROM [dbo].[ArticleComments]
	WHERE [Id] = @id;
GO
