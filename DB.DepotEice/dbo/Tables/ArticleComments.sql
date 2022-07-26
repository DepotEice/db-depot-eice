CREATE TABLE [dbo].[ArticleComments]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Note] INT NOT NULL,
	[Review] NVARCHAR(500) NOT NULL,
	[CreatedAt] DATETIME2 NOT NULL DEFAULT GETDATE(),
	[UpdatedAt] DATETIME2 NULL,
	[ArticleId] INT NOT NULL,
	[UserId] UNIQUEIDENTIFIER NOT NULL,
	CONSTRAINT [FK_ArticleComments_Article] FOREIGN KEY ([ArticleId]) REFERENCES [Articles]([Id]),
	CONSTRAINT [FK_ArticleComments_User] FOREIGN KEY ([UserId]) REFERENCES [Users]([Id])
)

GO

CREATE TRIGGER [dbo].[Trigger_Comments_Update]
    ON [dbo].[ArticleComments]
    AFTER UPDATE
AS
BEGIN
   UPDATE [dbo].[ArticleComments]
   SET [UpdatedAt] = GETDATE()
   FROM Inserted i
   WHERE [dbo].[ArticleComments].[Id] = i.Id
END