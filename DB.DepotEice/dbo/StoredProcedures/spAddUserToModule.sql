CREATE PROCEDURE [dbo].[spAddUserToModule]
	@moduleId INT,
	@userId UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[UsersModules]
	(
		UserId,
		ModuleId
	)
	VALUES
	(
		@userId,
		@moduleId
	);
END