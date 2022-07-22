CREATE PROCEDURE [dbo].[spCreateArticleComment]
	@note INT,
	@review NVARCHAR(500),
	@articleId INT,
	@userId UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON;
	
	INSERT INTO [dbo].[ArticleComments]
	(
		Note,
		Review,
		ArticleId,
		UserId
	)
	VALUES
	(
		@note,
		@review,
		@articleId,
		@userId
	);

	SELECT SCOPE_IDENTITY();
END
