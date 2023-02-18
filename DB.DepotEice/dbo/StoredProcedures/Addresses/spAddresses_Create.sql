CREATE PROCEDURE [dbo].[spAddresses_Create]
	@Street NVARCHAR(150),
	@HouseNumber NVARCHAR(15),
	@Appartment NVARCHAR(15),
	@City NVARCHAR(100),
	@State NVARCHAR(100),
	@ZipCode NVARCHAR(15),
	@Country NVARCHAR(100),
	@IsPrimary BIT,
	@UserId UNIQUEIDENTIFIER
AS
	SET NOCOUNT ON;
	
	INSERT INTO [dbo].[Addresses]
	(
		[Street],
		[HouseNumber],
		[Appartment],
		[City],
		[State],
		[ZipCode],
		[Country],
		[IsPrimary],
		[UserId]
	)
	VALUES
	(
		@Street,
		@HouseNumber,
		@Appartment,
		@City,
		@State,
		@ZipCode,
		@Country,
		@IsPrimary,
		@UserId
	)

	SELECT SCOPE_IDENTITY();
