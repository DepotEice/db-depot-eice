CREATE PROCEDURE [dbo].[spGetArticle]
	@id INT
AS
	SELECT *
	FROM [Articles]
	WHERE [Articles].[Id] = @id
GO;
