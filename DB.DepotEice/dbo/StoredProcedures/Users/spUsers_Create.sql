CREATE PROCEDURE [dbo].[spUsers_Create]
	@email NVARCHAR(256),
	@password NVARCHAR(MAX),
	@salt NVARCHAR(256),
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
		[dbo].[fnHashPassword](@password, @salt),
		@firstname,
		@lastname,
		@profilePicture,
		@birthdate
	)
END;
