CREATE PROCEDURE [dbo].[spCreateScheduleFile]
	@fileId INT,
	@scheduleId INT
AS
BEGIN
	SET NoCount ON;

	INSERT INTO 
		[dbo].[ScheduleFiles] 
		(
			[FileId],
			[ScheduleId]
		)
	VALUES 
		(
			@fileId, 
			@scheduleId
		);

	SELECT SCOPE_IDENTITY();
END