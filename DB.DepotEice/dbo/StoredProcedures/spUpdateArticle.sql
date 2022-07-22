CREATE PROCEDURE [dbo].[spUpdateArticle]
	@id INT,
	@title NVARCHAR(100),
	@body TEXT
AS
	UPDATE [dbo].[Articles]
	SET
		[Title] = @title,
		[Body] = @body,
		[UpdatedAt] = GETDATE()
	WHERE [Id] = @id
GO
