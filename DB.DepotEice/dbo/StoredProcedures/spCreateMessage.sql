CREATE PROCEDURE [dbo].[spCreateMessage]
	@body NVARCHAR(1000),
	@userFromId UNIQUEIDENTIFIER,
	@userToId UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Messages]
	(
		Content,
		SenderId,
		ReceiverId
	)
	VALUES
	(
		@body,
		@userFromId,
		@userToId
	);

	SELECT SCOPE_IDENTITY();
END