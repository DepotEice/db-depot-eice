CREATE PROCEDURE [dbo].[spUpdateScheduleHours]
	@id INT,
	@startsAt DATETIME2,
	@endsAt DATETIME2
AS
	UPDATE
		[dbo].[Schedules]
	SET
		[StartsAt] = @startsAt,
		[EndsAt] = @endsAt
	WHERE
		[Id] = @id
GO
