CREATE PROCEDURE [dbo].[spDeleteAppointment]
	@id INT
AS
	DELETE FROM [Appointments]
	WHERE [Appointments].[Id] = @id
GO;
