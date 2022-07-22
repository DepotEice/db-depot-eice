CREATE PROCEDURE [dbo].[spGetModule]
	@id INT
AS
	SELECT *
	FROM [dbo].[Modules]
	WHERE [Modules].[Id] = @id
GO
