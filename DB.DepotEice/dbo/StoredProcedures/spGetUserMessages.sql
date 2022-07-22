CREATE PROCEDURE [dbo].[spUserMessages]
	@userId UNIQUEIDENTIFIER
AS
	SELECT *
	FROM [Messages]
	WHERE ([ReceiverId] = @userId) OR ([SenderId] = @userId)
GO