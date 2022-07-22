CREATE PROCEDURE [dbo].[spGetModuleSchedules]
	@moduleId INT
AS
	SELECT *
	FROM [dbo].[Schedules]
	WHERE [ModuleId] = @moduleId
GO
