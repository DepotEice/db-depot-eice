CREATE PROCEDURE [dbo].[spUsers_Create]
	@email NVARCHAR(256),
	@passwordHash NVARCHAR(MAX),
	@firstname NVARCHAR(50),
	@lastname NVARCHAR(100),
	@profilePicture NVARCHAR(256),
	@birthdate DATE
AS
BEGIN
	SET NoCount ON;

	INSERT INTO [dbo].[Users]
	(
		Email, 
		NormalizedEmail,
		PasswordHash,
		FirstName,
		Lastname,
		ProfilePicture,
		BirthDate
	)
	OUTPUT inserted.Id
	VALUES 
	(
		@email,
		UPPER(@email),
		@passwordHash,
		@firstname,
		@lastname,
		@profilePicture,
		@birthdate
	)
END;
