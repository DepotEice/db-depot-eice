CREATE TABLE [dbo].[ArticleComments]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Note] INT NOT NULL,
	[Review] NVARCHAR(500) NOT NULL,
	[UserId] UNIQUEIDENTIFIER NOT NULL,
	[ArticleId] INT NOT NULL,
	[CreatedAt] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[UpdatedAt] DATETIME2(7) NULL,
	[DeletedAt] DATETIME2(7) NULL,

	CONSTRAINT [FK_ArticleComments_Article] FOREIGN KEY ([ArticleId]) REFERENCES [Articles]([Id]),
	CONSTRAINT [FK_ArticleComments_User] FOREIGN KEY ([UserId]) REFERENCES [Users]([Id])
)

GO

CREATE TRIGGER [dbo].[Trigger_ArticleComments_Update]
    ON [dbo].[ArticleComments]
    AFTER UPDATE
AS
BEGIN
	SET NoCount ON
	
	UPDATE [dbo].[ArticleComments]
	SET [UpdatedAt] = GETDATE()
	FROM Inserted i
	WHERE [dbo].[ArticleComments].[Id] = i.Id
END

GO

CREATE TRIGGER [dbo].[Trigger_ArticleComments_Delete]
	ON [dbo].[ArticleComments]
    FOR DELETE
AS
BEGIN
	SET NoCount ON
	
	UPDATE [dbo].[ArticleComments]
	SET [DeletedAt] = GETDATE()
	FROM deleted d
	WHERE [dbo].[ArticleComments].[Id] = d.Id
END