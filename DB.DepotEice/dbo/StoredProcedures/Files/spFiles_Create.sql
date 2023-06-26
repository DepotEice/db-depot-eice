CREATE PROCEDURE [dbo].[spFiles_Create]
	@key NVARCHAR(255),
	@path NVARCHAR(255),
	@size INT,
	@type NVARCHAR(255)
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [dbo].[Files]
	(
		[Key],
		[Path],
		[Size],
		[Type]
	)
	VALUES
	(
		@key,
		@path,
		@size,
		@type
	);

	SELECT SCOPE_IDENTITY();
END
