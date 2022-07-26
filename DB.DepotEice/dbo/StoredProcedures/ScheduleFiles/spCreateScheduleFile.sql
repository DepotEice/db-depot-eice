﻿CREATE PROCEDURE [dbo].[spCreateScheduleFile]
	@filePath NVARCHAR(255),
	@scheduleId INT
AS
BEGIN
	SET NoCount ON;

	INSERT INTO [dbo].[ScheduleFiles] (FilePath, ScheduleId)
	VALUES (@filePath, @scheduleId);

	SELECT SCOPE_IDENTITY();
END