CREATE FUNCTION [dbo].[fnCreateUserTokenValue]
(
	@securityStamp UNIQUEIDENTIFIER,
	@tokenType NVARCHAR(100)
)
RETURNS BINARY(32)
AS
BEGIN
	RETURN HASHBYTES('SHA2_256', CONCAT(@securityStamp, @tokenType))
END
