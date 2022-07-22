CREATE PROCEDURE [dbo].[spUpdateModule]
	@id INT,
	@name NVARCHAR(255),
	@description NVARCHAR(1000)
AS
	UPDATE [Modules]
	SET 
		[Name] = @name,
		[Description] = @description
	WHERE [Modules].[Id] = @id
GO;
