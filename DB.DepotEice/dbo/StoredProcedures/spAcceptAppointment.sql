CREATE PROCEDURE [dbo].[spAcceptAppointment]
	@id INT
AS
	UPDATE [dbo].[Appointments]
	SET
		[Accepted] = 1
	WHERE [Id] = @id
GO
