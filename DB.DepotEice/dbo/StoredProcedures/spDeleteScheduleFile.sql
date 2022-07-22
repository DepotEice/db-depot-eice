CREATE PROCEDURE [dbo].[spDeleteScheduleFile]
	@id INT
AS
	DELETE FROM [dbo].[ScheduleFiles]
	WHERE [Id] = @id
GO
