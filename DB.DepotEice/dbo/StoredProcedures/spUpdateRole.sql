CREATE PROCEDURE [dbo].[spUpdateRole]
	@id UNIQUEIDENTIFIER,
	@name NVARCHAR(50)
AS
	UPDATE 
		[dbo].[Roles]
	SET
		[Name] = @name
	WHERE 
		[Id] = @id
GO
