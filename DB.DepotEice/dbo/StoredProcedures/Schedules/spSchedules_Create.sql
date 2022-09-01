CREATE PROCEDURE [dbo].[spSchedules_Create]
	@title NVARCHAR(100) NULL,
	@details TEXT NULL,
	@startsAt DATETIME2,
	@endsAt DATETIME2,
	@moduleId INT
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Schedules]
	(
		Title,
		Details,
		StartsAt,
		EndsAt,
		ModuleId
	)
	VALUES
	(
		@title,
		@details,
		@startsAt,
		@endsAt,
		@moduleId
	);

	SELECT SCOPE_IDENTITY();
END
