CREATE PROCEDURE [dbo].[spCreateUser]
	@email NVARCHAR(320),
	@password NVARCHAR(50),
	@salt NVARCHAR(100),
	@firstName NVARCHAR(50),
	@lastname NVARCHAR(100),
	@profilePicture NVARCHAR(255),
	@birthDate DATE
AS
BEGIN
	SET NOCOUNT ON;

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
		@firstName, @lastname,
		@profilePicture,
		@birthDate
	)
END;
