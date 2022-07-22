CREATE PROCEDURE [dbo].[spCreateUserToken]
	@type NVARCHAR(100),
	@expirationDate DATETIME2,
	@userId UNIQUEIDENTIFIER,
	@userSecurityStamp UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[UsersTokens]
	(
		[Type],
		[Value],
		[ExpirationDate],
		[UserId]
	)
	OUTPUT inserted.Id
	VALUES
	(
		@type,
		[dbo].[fnCreateUserTokenValue](@userSecurityStamp, @type),
		@expirationDate,
		@userId
	);

END

