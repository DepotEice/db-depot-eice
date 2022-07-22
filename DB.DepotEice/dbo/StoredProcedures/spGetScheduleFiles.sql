CREATE PROCEDURE [dbo].[spGetScheduleFiles]
	@scheduleId INT
AS
	SELECT *
	FROM [dbo].[ScheduleFiles]
	WHERE [ScheduleId] = @scheduleId
GO
