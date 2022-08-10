﻿CREATE FUNCTION [dbo].[fnCreateUserTokenValue]
(
	@securityStamp UNIQUEIDENTIFIER,
	@tokenType NVARCHAR(100)
)
RETURNS NVARCHAR(100)
AS
BEGIN
	RETURN CONVERT(NVARCHAR(100), HASHBYTES('SHA2_256', CONCAT(@securityStamp, @tokenType)), 1)
END
