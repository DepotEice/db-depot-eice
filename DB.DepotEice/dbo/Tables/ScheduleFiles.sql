CREATE TABLE [dbo].[ScheduleFiles]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[FilePath] NVARCHAR(255) NOT NULL,
	[ScheduleId] INT NOT NULL,
	CONSTRAINT [FK_ScheduleFiles_Schedule] FOREIGN KEY ([ScheduleId]) REFERENCES [Schedules]([Id])
)
