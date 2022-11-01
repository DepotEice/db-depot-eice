CREATE PROCEDURE [dbo].[spUsers_UpdatePassword]
	@userId UNIQUEIDENTIFIER,
	@password NVARCHAR(50),
	@salt NVARCHAR(MAX)
AS
	UPDATE [dbo].[Users]
	SET
		[PasswordHash] = [dbo].[fnHashPassword](@password, @salt),
		[ConcurrencyStamp] = NEWID(),
		[SecurityStamp] = NEWID()
	WHERE [Id] = @userId
GO
