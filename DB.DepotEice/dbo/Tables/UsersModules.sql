CREATE TABLE [dbo].[UsersModules]
(
	[UserId] UNIQUEIDENTIFIER NOT NULL,
	[ModuleId] INT NOT NULL,
	[IsAccepted] BIT NULL,
	CONSTRAINT [PK_UsersModules] PRIMARY KEY ([UserId], [ModuleId]),
	CONSTRAINT [FK_UsersModules_User] FOREIGN KEY ([UserId]) REFERENCES [Users]([Id]),
	CONSTRAINT [FK_UsersModules_Module] FOREIGN KEY ([ModuleId]) REFERENCES [Modules]([Id])
)
