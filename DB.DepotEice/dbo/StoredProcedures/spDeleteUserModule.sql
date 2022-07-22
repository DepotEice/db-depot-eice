CREATE PROCEDURE [dbo].[spDeleteUserModule]
	@moduleId INT,
	@userId UNIQUEIDENTIFIER
AS
	DELETE FROM [dbo].[UsersModules]
	WHERE ([UserId] = @userId) AND ([ModuleId] = @moduleId)
GO
