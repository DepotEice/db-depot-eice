﻿CREATE TABLE [dbo].[Modules]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Name] NVARCHAR(255) NOT NULL,
	[Description] NVARCHAR(1000) NOT NULL
)
