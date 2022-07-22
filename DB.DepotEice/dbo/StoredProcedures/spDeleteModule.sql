CREATE PROCEDURE [dbo].[spDeleteModule]
	@id INT
AS
	DELETE FROM [Modules]
	WHERE [Modules].[Id] = @id
GO;
