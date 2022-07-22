CREATE PROCEDURE [dbo].[spGetAppointment]
	@id INT
AS
	SELECT * 
	FROM [Appointments] 
	WHERE [Appointments].[Id] = @id
GO;
