CREATE TABLE [dbo].[UserModules]
(
	[UserId] UNIQUEIDENTIFIER NOT NULL,
	[ModuleId] INT NOT NULL,
	[IsAccepted] BIT NULL,
	CONSTRAINT [PK_UserModules] PRIMARY KEY ([UserId], [ModuleId]),
	CONSTRAINT [FK_UserModules_User] FOREIGN KEY ([UserId]) REFERENCES [Users]([Id]),
	CONSTRAINT [FK_UserModules_Module] FOREIGN KEY ([ModuleId]) REFERENCES [Modules]([Id]) ON DELETE CASCADE
)
