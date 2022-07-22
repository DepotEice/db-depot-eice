CREATE PROCEDURE [dbo].[spDeleteUser]
	@id UNIQUEIDENTIFIER
AS
	UPDATE [dbo].[Users]
	SET 
	[DeletedAt] = GETDATE(),
	[UpdatedAt] = GETDATE(),
	[SecurityStamp] = NEWID()
	WHERE [Id] = @id
GO
