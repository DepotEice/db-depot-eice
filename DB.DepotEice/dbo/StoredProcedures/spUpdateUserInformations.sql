CREATE PROCEDURE [dbo].[spUpdateUserInformations]
	@id UNIQUEIDENTIFIER,
	@firstName NVARCHAR(50),
	@lastName NVARCHAR(100),
	@profilePicture NVARCHAR(255),
	@birthDate DATE
AS
	UPDATE
		[dbo].[Users]
	SET
		[FirstName] = @firstName,
		[Lastname] = @lastName,
		[ProfilePicture] = @profilePicture,
		[BirthDate] = @birthDate,
		[ConcurrencyStamp] = NEWID(),
		[UpdatedAt] = GETDATE()
	WHERE
		[Id] = @id
GO
