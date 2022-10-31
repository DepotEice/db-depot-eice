CREATE PROCEDURE [dbo].[spCreateOpeningHours]
	@openAt DATETIME2,
	@closeAt DATETIME2
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[OpeningHours]
	(
		OpenAt,
		CloseAt
	)
	VALUES
	(
		@openAt,
		@closeAt
	);

	SELECT SCOPE_IDENTITY();
END
