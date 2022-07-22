CREATE PROCEDURE [dbo].[spUpdateUserPassword]
	@id UNIQUEIDENTIFIER,
	@oldPassword NVARCHAR(50),
	@newPassword NVARCHAR(50),
	@salt NVARCHAR(100)
AS
BEGIN
	DECLARE @actualPassword BINARY(32) = (SELECT [PasswordHash] FROM [dbo].[Users] WHERE [Id] = @id);
	DECLARE @hashedPassword BINARY(32) = ([dbo].[fnHashPassword](@oldPassword, @salt))

	IF @actualPassword = @hashedPassword
		UPDATE 
			[dbo].[Users]
		SET
			[PasswordHash] = [dbo].[fnHashPassword](@newPassword, @salt),
			[SecurityStamp] = NEWID(),
			[UpdatedAt] = GETDATE()
		WHERE
			[Id] = @id;
END