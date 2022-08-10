CREATE PROCEDURE [dbo].[spAddUserToRole]
	@roleId UNIQUEIDENTIFIER,
	@userId UNIQUEIDENTIFIER
AS
BEGIN
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