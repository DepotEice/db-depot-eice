CREATE PROCEDURE [dbo].[spGetUserRoles]
	@userId UNIQUEIDENTIFIER
AS
	SELECT roles.[Id], roles.[Name]
	FROM [dbo].[UsersRoles] AS userRoles
	INNER JOIN [dbo].[Users] AS users ON users.Id = userRoles.UserId
	INNER JOIN [dbo].[Roles] AS roles ON roles.Id = userRoles.RoleId
	WHERE users.Id = @userId
GO
