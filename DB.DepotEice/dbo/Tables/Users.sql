CREATE TABLE [dbo].[Users]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
    [ProfilePictureId] INT NULL,
    [Email] NVARCHAR(256) NULL UNIQUE, 
    [NormalizedEmail] NVARCHAR(256) NULL UNIQUE,
    [SchoolEmail] NVARCHAR(256) NULL,
    [NormalizedSchoolEmail] NVARCHAR(256) NULL,
    [EmailConfirmed] BIT NOT NULL DEFAULT 0,
    [PasswordHash] NVARCHAR(MAX) NULL, 
    [FirstName] NVARCHAR(50) NULL, 
    [Lastname] NVARCHAR(100) NULL,
    [Gender] NVARCHAR(10) NULL,
    [BirthDate] DATETIME NULL,
    [MobileNumber] NVARCHAR(15) NULL,
    [PhoneNumber] NVARCHAR(15) NULL,
    [ConcurrencyStamp] UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(), 
    [SecurityStamp] UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
    [IsActive] BIT NOT NULL DEFAULT 0,
    [CreatedAt] DATETIME2 NOT NULL DEFAULT GETDATE(), 
    [UpdatedAt] DATETIME2 NULL, 
    [DeletedAt] DATETIME2 NULL,

    CONSTRAINT [FK_Users_File] FOREIGN KEY ([ProfilePictureId]) REFERENCES [Files]([Id]) ON DELETE SET NULL,
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