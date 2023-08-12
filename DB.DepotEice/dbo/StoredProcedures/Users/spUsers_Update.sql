CREATE PROCEDURE [dbo].[spUsers_Update]
	@id UNIQUEIDENTIFIER,
	@profilePictureId INT,
	@firstName NVARCHAR(50),
	@lastName NVARCHAR(100),
	@birthDate DATETIME,
	@mobileNumber NVARCHAR(15),
	@phoneNumber NVARCHAR(15),
	@gender NVARCHAR(10)
AS
	UPDATE [dbo].[Users]
	SET
		[FirstName] = @firstName,
		[ProfilePictureId] = @profilePictureId,
 		[Lastname] = @lastName,
		[BirthDate] = @birthDate,
		[MobileNumber] = @mobileNumber,
		[PhoneNumber] = @phoneNumber,
		[Gender] = @gender,
		[ConcurrencyStamp] = NEWID()
	WHERE [Id] = @id
GO
