CREATE PROCEDURE [dbo].[spAddresses_Update]
	@Street NVARCHAR(150),
	@HouseNumber NVARCHAR(15),
	@Appartment NVARCHAR(15),
	@City NVARCHAR(100),
	@State NVARCHAR(100),
	@ZipCode NVARCHAR(15),
	@Country NVARCHAR(100),
	@IsPrimary BIT,
	@AddressId INT
AS
	UPDATE [dbo].[Addresses]
	SET
		[Street] = @Street,
		[HouseNumber] = @HouseNumber,
		[Appartment] = @Appartment,
		[City] = @City,
		[State] = @State,
		[ZipCode] = @ZipCode,
		[Country] = @Country,
		[IsPrimary] = @IsPrimary
	WHERE [Id] = @AddressId

