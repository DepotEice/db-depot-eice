CREATE PROCEDURE [dbo].[spMessages_GetByRequestUserId]
	@UserId INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT
        m.[Id],
        IIF([SenderId] = @UserId, [ReceiverId], [SenderId]) as 'UserId',
        IIF([SenderId] = @UserId, (SELECT [FirstName], [Lastname] FROM dbo.Users WHERE [Id] = ReceiverId), (SELECT [FirstName], [Lastname] FROM dbo.Users WHERE [Id] = SenderId)) as 'Username',
        [Content],
        [SentAt]
    FROM dbo.[Messages] m
        INNER JOIN (
            SELECT MAX([Id]) as [Id]
            FROM dbo.[Messages]
            WHERE [ReceiverId] = @UserId or [SenderId] = @UserId
            GROUP BY IIF([ReceiverId] > [SenderId], [ReceiverId], [SenderId]), IIF([ReceiverId] < [SenderId], [ReceiverId], [SenderId])
        ) s ON m.[Id] = s.[Id]
    ORDER BY [SentAt] DESC
END