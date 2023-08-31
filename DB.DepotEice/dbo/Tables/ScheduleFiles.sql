CREATE TABLE [dbo].[ScheduleFiles]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[FileId] INT NOT NULL,
	[ScheduleId] INT NOT NULL,

	CONSTRAINT [FK_ScheduleFiles_Schedule] FOREIGN KEY ([ScheduleId]) REFERENCES [Schedules]([Id]),
	CONSTRAINT [FK_ScheduleFiles_File] FOREIGN KEY ([FileId]) REFERENCES [Files]([Id])
)
