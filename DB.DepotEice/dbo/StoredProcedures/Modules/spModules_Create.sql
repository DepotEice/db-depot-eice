CREATE PROCEDURE [dbo].[spModules_Create]
	@name NVARCHAR(255),
	@description NVARCHAR(1000)
AS
BEGIN
	SET NoCount ON;

	INSERT INTO [dbo].[Modules] ([Name], [Description])
	VALUES (@name, @description);

	SELECT SCOPE_IDENTITY();
END
