CREATE PROCEDURE [dbo].[spUpdateSchedule]
	@id INT,
	@title NVARCHAR(100),
	@details TEXT
AS
	UPDATE
		[dbo].[Schedules]
	SET
		[Title] = @title,
		[Details] = @details
	WHERE
		[Id] = @id
GO
