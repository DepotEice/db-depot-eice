CREATE PROCEDURE [dbo].[spUpdateOpeningHours]
	@id INT,
	@openAt DATETIME2,
	@closeAt DATETIME2
AS
	UPDATE [dbo].[OpeningHours]
	SET
		[OpenAt] = @openAt,
		[CloseAt] = @closeAt
	WHERE [Id] = @id
GO
