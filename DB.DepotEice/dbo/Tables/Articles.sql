CREATE TABLE [dbo].[Articles]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Title] NVARCHAR(100) NOT NULL,
	[Body] TEXT NOT NULL,
	[CreatedAt] DATETIME2(7) NOT NULL DEFAULT GETDATE(),
	[UpdatedAt] DATETIME2(7) NULL,
	[DeletedAt] DATETIME2(7) NULL,
	[IsPinned] BIT NOT NULL DEFAULT 0,
	[UserId] UNIQUEIDENTIFIER NOT NULL,
	CONSTRAINT [FK_Articles_User] FOREIGN KEY ([UserId]) REFERENCES [Users]([Id])
)

GO

CREATE TRIGGER [dbo].[Trigger_Articles_Update]
    ON [dbo].[Articles]
    AFTER UPDATE
AS
BEGIN
   UPDATE [dbo].[Articles]
   SET [UpdatedAt] = GETDATE()
   FROM Inserted i
   WHERE [dbo].[Articles].[Id] = i.Id
END

GO

CREATE TRIGGER [dbo].[Trigger_Articles_Delete]
	ON [dbo].[Articles]
	FOR DELETE
AS
BEGIN
	SET NOCOUNT ON

	UPDATE [dbo].[Articles]
	SET [DeletedAt] = GETDATE()
	FROM deleted d
	WHERE [dbo].[Articles].[Id] = d.Id
END