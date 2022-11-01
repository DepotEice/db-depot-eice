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
    SELECT 1;
  ELSE
    SELECT 0;
END;