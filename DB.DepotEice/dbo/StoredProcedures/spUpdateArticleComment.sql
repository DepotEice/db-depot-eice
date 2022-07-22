CREATE PROCEDURE [dbo].[spUpdateArticleComment]
	@id INT,
	@note INT,
	@review NVARCHAR(500)
AS
	UPDATE [dbo].[ArticleComments]
	SET
		[Note] = @note,
		[Review] = @review,
		[UpdatedAt] = GETDATE()
	WHERE [Id] = @id
GO