--CREATE PROCEDURE [dbo].[spUserTokens_Approve]
--	@id UNIQUEIDENTIFIER,
--	@type NVARCHAR(100),
--	@userSecurityStamp UNIQUEIDENTIFIER
--AS
--BEGIN
--	SET NOCOUNT ON;

--	DECLARE @value NVARCHAR(32) = (SELECT [dbo].[UserTokens].[Value] 
--									FROM [dbo].[UserTokens] 
--									WHERE [dbo].[UserTokens].Id = @id);

--	IF @expirationDate < GETDATE()
--		RETURN 0;										
--	ELSE IF @value = [dbo].[fnCreateUserTokenValue](@userSecurityStamp, @type)
--		SELECT 1;
--	ELSE
--		SELECT 0;
--END;

CREATE PROCEDURE [dbo].[spUserTokens_Approve]
  @id UNIQUEIDENTIFIER,
  @type NVARCHAR(100),
  @userSecurityStamp UNIQUEIDENTIFIER
AS
BEGIN
  SET NOCOUNT ON;

  DECLARE @value NVARCHAR(32) = (SELECT [dbo].[UserTokens].[Value] 
                  FROM [dbo].[UserTokens] 
                  WHERE [dbo].[UserTokens].Id = @id);

  IF @value = [dbo].[fnCreateUserTokenValue](@userSecurityStamp, @type)
    RETURN 1;
  ELSE
    RETURN 0;
END;