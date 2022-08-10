CREATE PROCEDURE [dbo].[spApproveToken]
	@id UNIQUEIDENTIFIER,
	@type NVARCHAR(100),
	@userSecurityStamp UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @value NVARCHAR(32) = (SELECT [dbo].[UsersTokens].[Value] 
									FROM [dbo].[UsersTokens] 
									WHERE [dbo].[UsersTokens].Id = @id);

	IF @value = [dbo].[fnCreateUserTokenValue](@userSecurityStamp, @type)
		RETURN 1;
	ELSE
		RETURN 0;
END;
