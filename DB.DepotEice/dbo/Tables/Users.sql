CREATE TABLE [dbo].[Users]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    [ProfilePictureUrl] NVARCHAR(255) NOT NULL,
    [Email] NVARCHAR(256) NULL UNIQUE, 
    [NormalizedEmail] NVARCHAR(256) NULL UNIQUE,
    [EmailConfirmed] BIT NOT NULL DEFAULT 0,
    [PasswordHash] NVARCHAR(MAX) NULL, 
    [FirstName] NVARCHAR(50) NULL, 
    [Lastname] NVARCHAR(100) NULL,
    [BirthDate] DATE NULL, 
    [ConcurrencyStamp] UNIQUEIDENTIFIER NULL DEFAULT NEWID(), 
    [SecurityStamp] UNIQUEIDENTIFIER NULL DEFAULT NEWID(),
    [IsActive] BIT NOT NULL DEFAULT 0,
    [CreatedAt] DATETIME2 NOT NULL DEFAULT GETDATE(), 
    [UpdatedAt] DATETIME2 NULL, 
    [DeletedAt] DATETIME2 NULL
)

GO

CREATE TRIGGER [dbo].[Trigger_Users_Update]
    ON [dbo].[Users]
    AFTER UPDATE
AS
BEGIN
   UPDATE [dbo].[Users]
   SET [UpdatedAt] = GETDATE()
   FROM Inserted i
   WHERE [dbo].[Users].[Id] = i.Id
END

GO

-- TODO : Uncomment the next line when it works
--CREATE TRIGGER [dbo].[Trigger_Users_Delete]
--    ON [dbo].[Users]
--    INSTEAD OF DELETE
--AS
--BEGIN    
--    UPDATE [dbo].[Users]
--    SET
--        [FirstName] = NULL, 
--        [Lastname] = NULL, 
--        [BirthDate] = NULL,
--        [ConcurrencyStamp] = NULL,
--        [SecurityStamp] = NEWID(),
--        [DeletedAt] = GETDATE()
--    FROM deleted d
--    WHERE [dbo].[Users].[Id] = d.Id
--END