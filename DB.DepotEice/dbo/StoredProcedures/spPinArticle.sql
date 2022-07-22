CREATE PROCEDURE [dbo].[spPinArticle]
	@id INT,
	@pinned BIT
AS
	UPDATE [dbo].[Articles]
	SET
		[Pinned] = @pinned
	WHERE [Id] = @id
GO
