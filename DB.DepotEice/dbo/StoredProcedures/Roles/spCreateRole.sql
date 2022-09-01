CREATE PROCEDURE [dbo].[spCreateRole]
	@name NVARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;
		
	INSERT INTO [dbo].[Roles] ([Name])
	OUTPUT inserted.Id
	VALUES (@name);

END
