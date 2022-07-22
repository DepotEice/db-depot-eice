CREATE PROCEDURE [dbo].[spGetUserModules]
	@userId UNIQUEIDENTIFIER
AS
	SELECT modules.[Id], modules.[Name], modules.[Description]
	FROM [dbo].[UsersModules] as userModules
	INNER JOIN [Users] AS users ON users.Id = userModules.[UserId]
	INNER JOIN [Modules] AS modules ON modules.Id = userModules.[ModuleId]
	WHERE users.[Id] = @userId
GO
