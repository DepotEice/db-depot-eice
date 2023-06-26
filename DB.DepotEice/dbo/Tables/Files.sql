CREATE TABLE [dbo].[Files]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Key] NVARCHAR(255) NOT NULL,
	[Path] NVARCHAR(255) NULL,
	[Size] INT NULL,
	[Type] NVARCHAR(255) NOT NULL,
	[CreatedAt] DATETIME2 NOT NULL DEFAULT GETDATE(), 
	[UpdatedAt] DATETIME2 NULL, 
	[DeletedAt] DATETIME2 NULL
)

GO

CREATE TRIGGER [dbo].[Trigger_File_Update]
    ON [dbo].[Files]
    AFTER UPDATE
AS
BEGIN
   UPDATE [dbo].[Files]
   SET [UpdatedAt] = GETDATE()
   FROM Inserted i
   WHERE [dbo].[Files].[Id] = i.Id
END

GO

--CREATE TRIGGER [dbo].[Trigger_File_Delete]
--	ON [dbo].[Files]
--	INSTEAD OF DELETE
--AS
--BEGIN    
--	UPDATE [dbo].[Files]
--	SET
--		[Key] = NULL,
--		[Path] = NULL,
--		[Size] = NULL,
--		[Type] = NULL,
--		[UpdatedAt] = GETDATE(),
--		[DeletedAt] = GETDATE()
--	FROM deleted d
--	WHERE [dbo].[Files].[Id] = d.Id
--END
