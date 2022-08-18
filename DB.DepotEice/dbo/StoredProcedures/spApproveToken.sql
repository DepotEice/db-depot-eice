CREATE PROCEDURE [dbo].[spApproveToken]
	@id UNIQUEIDENTIFIER,
	@type NVARCHAR(100),
	@userSecurityStamp UNIQUEIDENTIFIER
AS
BEGIN
	DECLARE @expirationDate DATETIME2(7) = (SELECT [dbo].[UsersTokens].[ExpirationDate]
											FROM [dbo].[UsersTokens]
											WHERE [dbo].[UsersTokens].[Id] = @id)
	
	DECLARE @value NVARCHAR(100) = (SELECT [dbo].[UsersTokens].[Value] 
									FROM [dbo].[UsersTokens] 
									WHERE [dbo].[UsersTokens].Id = @id);

	IF @expirationDate < GETDATE()
		RETURN 0;										
	ELSE IF @value = [dbo].[fnCreateUserTokenValue](@userSecurityStamp, @type)
		SELECT 1;
	ELSE
		SELECT 0;
END;
