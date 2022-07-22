CREATE PROCEDURE [dbo].[spDeleteOpeningHour]
	@id INT
AS
	DELETE FROM [dbo].[OpeningHours]
	WHERE [Id] = @id
GO
