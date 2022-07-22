CREATE PROCEDURE [dbo].[spGetArticleComments]
	@articleId INT
AS
	SELECT *
	FROM [dbo].[ArticleComments]
	WHERE [ArticleComments].[ArticleId] = @articleId
GO
