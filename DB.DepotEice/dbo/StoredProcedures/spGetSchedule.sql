CREATE PROCEDURE [dbo].[spGetSchedule]
	@id INT
AS
	SELECT *
	FROM [dbo].[Schedules]
	WHERE [Id] = @id
GO
