﻿CREATE TABLE [dbo].[UserTokens]
(
	[Id] UNIQUEIDENTIFIER NOT NULL PRIMARY KEY DEFAULT NEWID(),
	[Type] NVARCHAR(100) NOT NULL,
	[Value] NVARCHAR(MAX) NOT NULL,
	[DeliveryDate] DATETIME2 NOT NULL DEFAULT GETDATE(),
	[ExpirationDate] DATETIME2 NOT NULL,
	[UserId] UNIQUEIDENTIFIER NOT NULL,

	CONSTRAINT [FK_UserTokens_User] 
		FOREIGN KEY ([UserId]) 
		REFERENCES [Users]([Id]) 
		ON DELETE CASCADE
)
