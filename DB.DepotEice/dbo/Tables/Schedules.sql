﻿CREATE TABLE [dbo].[Schedules]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Title] NVARCHAR(100) NULL,
	[Details] TEXT NULL,
	[StartAt] DATETIME2 NOT NULL,
	[EndAt] DATETIME2 NOT NULL,
	[ModuleId] INT NOT NULL,

	CONSTRAINT [FK_Schedules_Module] FOREIGN KEY ([ModuleId]) REFERENCES [Modules]([Id]) ON DELETE CASCADE
)
