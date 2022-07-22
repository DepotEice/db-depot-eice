CREATE PROCEDURE [dbo].[spActivateUser]
	@id UNIQUEIDENTIFIER,
	@isActive BIT
AS
BEGIN
	UPDATE 
		[dbo].[Users]
	SET
		[IsActive] = @isActive,
		[SecurityStamp] = NEWID(),
		[UpdatedAt] = GETDATE()
	WHERE
		[Id] = @id
END
