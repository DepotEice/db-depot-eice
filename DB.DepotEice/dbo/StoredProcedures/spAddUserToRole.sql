CREATE PROCEDURE [dbo].[spAddUserToRole]
	@roleId UNIQUEIDENTIFIER,
	@userId UNIQUEIDENTIFIER
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[UsersRoles]
	(
		UserId,
		RoleId
	)
	VALUES
	(
		@userId,
		@roleId
	);
END