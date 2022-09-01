CREATE PROCEDURE [dbo].[spArticleCreate]
	@title NVARCHAR(100),
	@body TEXT,
	@pinned BIT,
	@userId UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT INTO [dbo].[Articles] ([Title], [Body], [IsPinned], [UserId])
	VALUES (@title, @body, @pinned, @userId);

	SELECT SCOPE_IDENTITY();
END
