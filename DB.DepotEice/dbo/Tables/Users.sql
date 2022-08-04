CREATE TABLE [dbo].[Users]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(), 
    [Email] NVARCHAR(320) NOT NULL UNIQUE, 
    [NormalizedEmail] NVARCHAR(320) NOT NULL UNIQUE,
    [PasswordHash] BINARY(32) NOT NULL, 
    [FirstName] NVARCHAR(50) NOT NULL, 
    [Lastname] NVARCHAR(100) NOT NULL,
    [ProfilePicture] NVARCHAR(255) NOT NULL, 
    [BirthDate] DATE NOT NULL, 
    [ConcurrencyStamp] UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(), 
    [SecurityStamp] UNIQUEIDENTIFIER NOT NULL DEFAULT NEWID(),
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
