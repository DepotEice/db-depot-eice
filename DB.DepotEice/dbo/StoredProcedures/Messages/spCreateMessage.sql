CREATE PROCEDURE [dbo].[spCreateMessage]
	@content NVARCHAR(1000),
	@senderId UNIQUEIDENTIFIER,
	@receiverId UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Messages] (Content, SenderId, ReceiverId)
	VALUES (@content, @senderId, @receiverId);

	SELECT SCOPE_IDENTITY();
END