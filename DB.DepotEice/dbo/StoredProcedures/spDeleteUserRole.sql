CREATE PROCEDURE [dbo].[spDeleteUserRole]
	@roleId UNIQUEIDENTIFIER,
	@userId UNIQUEIDENTIFIER
AS
	DELETE FROM [dbo].[UsersRoles]
	WHERE ([UserId] = @userId) AND ([RoleId] = @roleId)
GO
