CREATE PROCEDURE [dbo].[spGetMessage]
	@id INT
AS
	SELECT *
	FROM [dbo].[Messages]
	WHERE [Messages].[Id] = Id
GO;
