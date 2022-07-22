CREATE PROCEDURE [dbo].[spGetScheduleFile]
	@id INT
AS
	SELECT *
	FROM [dbo].[ScheduleFiles]
	WHERE [Id] = @id
GO
