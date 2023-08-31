CREATE PROCEDURE [dbo].[spArticleCreate]
	@mainImageId INT,
	@title NVARCHAR(100),
	@body TEXT,
	@pinned BIT,
	@userId UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT INTO 
		[dbo].[Articles] 
		(
			[MainImageId], 
			[Title], [Body], 
			[IsPinned], 
			[UserId]
		)
	VALUES 
		(
			@mainImageId, 
			@title, 
			@body, 
			@pinned, 
			@userId
		);

	SELECT SCOPE_IDENTITY();
END
