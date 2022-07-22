CREATE PROCEDURE [dbo].[spCreateModule]
	@name NVARCHAR(255),
	@description NVARCHAR(1000)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Modules]
	(
		[Name],
		[Description]
	)
	VALUES
	(
		@name,
		@description
	);

	SELECT SCOPE_IDENTITY();
END
