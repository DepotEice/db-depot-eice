CREATE PROCEDURE [dbo].[spDeleteSchedule]
	@id INT
AS
	DELETE FROM [dbo].[Schedules]
	WHERE [Id] = @id
GO
