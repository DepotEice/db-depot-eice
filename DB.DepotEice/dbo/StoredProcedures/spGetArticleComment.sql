CREATE PROCEDURE [dbo].[spGetArticleComment]
	@id INT
AS
	SELECT *
	FROM [Appointments]
	WHERE [Appointments].[Id] = @id
GO;
