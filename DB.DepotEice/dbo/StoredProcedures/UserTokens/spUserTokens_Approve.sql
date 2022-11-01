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
  @type NVARCHAR(100)
AS
BEGIN

  DECLARE @value NVARCHAR(MAX) = (SELECT [dbo].[UserTokens].[Value] 
                  FROM [dbo].[UserTokens] 
                  WHERE [dbo].[UserTokens].Id = @id)

  DECLARE @userId UNIQUEIDENTIFIER = (SELECT [dbo].[UserTokens].[UserId]
                                        FROM [dbo].[UserTokens]
                                        WHERE [dbo].[UserTokens].[Id] = @id)

  DECLARE @expirationDate DATETIME2(7) = (SELECT [dbo].[UserTokens].[ExpirationDate]
                                            FROM [dbo].[UserTokens]
                                            WHERE [dbo].[UserTokens].[Id] = @id)

  DECLARE @userSecurityStamp UNIQUEIDENTIFIER = (SELECT [dbo].[Users].[SecurityStamp]
                                                    FROM [dbo].[Users]
                                                    WHERE [dbo].[Users].[Id] = @userId)

  IF (@value = [dbo].[fnCreateUserTokenValue](@userSecurityStamp, @type) 
    AND CAST(@expirationDate AS DATETIME2(7)) > GETDATE())
    BEGIN
        UPDATE [dbo].[Users]
        SET [SecurityStamp] = NEWID()
        WHERE [dbo].[Users].[Id] = @userId;

        SELECT 1;
    END
  ELSE
    SELECT 0;
END;