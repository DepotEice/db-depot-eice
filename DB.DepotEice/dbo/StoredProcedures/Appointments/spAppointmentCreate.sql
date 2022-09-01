CREATE PROCEDURE [dbo].[spAppointmentCreate]
	@startAt DATETIME,
	@endAt DATETIME,
	@userId NVARCHAR(36)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Appointments]
	(
		[StartAt],
		[EndAt],
		[UserId]
	)
	VALUES 
	(
		@startAt,
		@endAt,
		@userId
	);

	SELECT SCOPE_IDENTITY();
END
