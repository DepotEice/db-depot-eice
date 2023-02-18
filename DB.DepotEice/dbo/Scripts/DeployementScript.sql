/*
Modèle de script de post-déploiement							
--------------------------------------------------------------------------------------
 Ce fichier contient des instructions SQL qui seront ajoutées au script de compilation.		
 Utilisez la syntaxe SQLCMD pour inclure un fichier dans le script de post-déploiement.			
 Exemple :      :r .\monfichier.sql								
 Utilisez la syntaxe SQLCMD pour référencer une variable dans le script de post-déploiement.		
 Exemple :      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

/********************************** ROLES CREATION ***********************************/

IF NOT EXISTS (SELECT * FROM [dbo].[Roles] WHERE [Roles].[Name] = ('Guest'))
    BEGIN
        INSERT INTO [dbo].[Roles] ([Name]) VALUES ('Guest');
    END

IF NOT EXISTS (SELECT * FROM [dbo].[Roles] WHERE [Roles].[Name] = ('Student'))
    BEGIN
        INSERT INTO [dbo].[Roles] ([Name]) VALUES ('Student');
    END

IF NOT EXISTS (SELECT * FROM [dbo].[Roles] WHERE [Roles].[Name] = ('Teacher'))
    BEGIN
        INSERT INTO [dbo].[Roles] ([Name]) VALUES ('Teacher');
    END

IF NOT EXISTS (SELECT * FROM [dbo].[Roles] WHERE [Roles].[Name] = ('Direction'))
    BEGIN
        INSERT INTO [dbo].[Roles] ([Name]) VALUES ('Direction');
    END


/********************************** USER CREATION ***********************************/

IF NOT EXISTS (SELECT * FROM UserRoles 
                JOIN Roles ON roles.Id = UserRoles.RoleId
                JOIN Users ON users.Id = UserRoles.UserId
                WHERE Roles.Name = ('Guest') AND Users.Email LIKE ('guest@email.com'))

    BEGIN
		INSERT INTO [dbo].[Users]
		(
			ProfilePictureUrl,
			Email, 
			NormalizedEmail,
			PasswordHash,
			FirstName,
			Lastname,
			BirthDate,
			EmailConfirmed,
			IsActive
		)
		VALUES 
		(
			'NO_PICTURE.svg)',
			'guest@email.com',
			UPPER('guest@email.com'),
			[dbo].[fnHashPassword]('Password_187', '5C2iqv9FSwEIqiD9ZOrDCQhvK8OFnVJUCelLsikTZBUk4xuZnt4HlFj1PbbiHimx58LAGtZc9+tbEI9pyT9x4A=='),
			'Phillipe',
			'Leclerc',
			GETDATE(),
			1,
			1
		);

		DECLARE @guestRoleId UNIQUEIDENTIFIER = (SELECT [Roles].[Id] 
													FROM [dbo].[Roles] 
													WHERE [Roles].[Name] = ('Guest'))

		DECLARE @guestUserId AS UNIQUEIDENTIFIER = (SELECT [Users].[Id]
														FROM [dbo].[Users]
														WHERE [Users].[Email] LIKE ('guest@email.com'))


		INSERT INTO [dbo].[UserRoles]
		(
			RoleId,
			UserId
		)
		VALUES
		(
			@guestRoleId,
			@guestUserId
		);
	END

IF NOT EXISTS (SELECT * FROM UserRoles 
                JOIN Roles ON roles.Id = UserRoles.RoleId
                JOIN Users ON users.Id = UserRoles.UserId
                WHERE Roles.Name = ('Student') AND Users.Email LIKE ('student@email.com'))
    
	BEGIN
        INSERT INTO [dbo].[Users]
		(
			ProfilePictureUrl,
			Email, 
			NormalizedEmail,
			PasswordHash,
			FirstName,
			Lastname,
			BirthDate,
			EmailConfirmed,
			IsActive
		)
		VALUES 
		(
			'NO_PICTURE.svg)',
			'student@email.com',
			UPPER('student@email.com'),
			[dbo].[fnHashPassword]('Password_187', '5C2iqv9FSwEIqiD9ZOrDCQhvK8OFnVJUCelLsikTZBUk4xuZnt4HlFj1PbbiHimx58LAGtZc9+tbEI9pyT9x4A=='),
			'Jean',
			'Jaures',
			GETDATE(),
			1,
			1
		);

		DECLARE @studentRoleId UNIQUEIDENTIFIER = (SELECT [Roles].[Id] 
													FROM [dbo].[Roles] 
													WHERE [Roles].[Name] = ('Student'));

		DECLARE @studentUserId AS UNIQUEIDENTIFIER = (SELECT [Users].[Id]
														FROM [dbo].[Users]
														WHERE [Users].[Email] LIKE ('student@email.com'));

		INSERT INTO [dbo].[UserRoles]
		(
			RoleId,
			UserId
		)
		VALUES
		(
			@studentRoleId,
			@studentUserId
		);
	END

IF NOT EXISTS (SELECT * FROM UserRoles 
                JOIN Roles ON roles.Id = UserRoles.RoleId
                JOIN Users ON users.Id = UserRoles.UserId
                WHERE Roles.Name = ('Teacher') AND Users.Email LIKE ('teacher@email.com'))
	
	BEGIN
        INSERT INTO [dbo].[Users]
		(
			ProfilePictureUrl,
			Email, 
			NormalizedEmail,
			PasswordHash,
			FirstName,
			Lastname,
			BirthDate,
			EmailConfirmed,
			IsActive
		)
		VALUES 
		(
			'NO_PICTURE.svg)',
			'teacher@email.com',
			UPPER('teacher@email.com'),
			[dbo].[fnHashPassword]('Password_187', '5C2iqv9FSwEIqiD9ZOrDCQhvK8OFnVJUCelLsikTZBUk4xuZnt4HlFj1PbbiHimx58LAGtZc9+tbEI9pyT9x4A=='),
			'Samuel',
			'Legrand',
			GETDATE(),
			1,
			1
		);

		DECLARE @teacherRoleId UNIQUEIDENTIFIER = (SELECT [Roles].[Id] 
													FROM [dbo].[Roles] 
													WHERE [Roles].[Name] = ('Teacher'))

		DECLARE @teacherUserId AS UNIQUEIDENTIFIER = (SELECT [Users].[Id]
														FROM [dbo].[Users]
														WHERE [Users].[Email] LIKE ('teacher@email.com'));

		INSERT INTO [dbo].[UserRoles]
		(
			RoleId,
			UserId
		)
		VALUES
		(
			@teacherRoleId,
			@teacherUserId
		);
	END

IF NOT EXISTS (SELECT * FROM UserRoles 
                JOIN Roles ON roles.Id = UserRoles.RoleId
                JOIN Users ON users.Id = UserRoles.UserId
                WHERE Roles.Name = ('Direction') AND Users.Email LIKE ('direction@email.com'))
	
	BEGIN
        INSERT INTO [dbo].[Users]
		(
			ProfilePictureUrl,
			Email, 
			NormalizedEmail,
			PasswordHash,
			FirstName,
			Lastname,
			BirthDate,
			EmailConfirmed,
			IsActive
		)
		VALUES 
		(
			'NO_PICTURE.svg)',
			'direction@email.com',
			UPPER('direction@email.com'),
			[dbo].[fnHashPassword]('Password_187', '5C2iqv9FSwEIqiD9ZOrDCQhvK8OFnVJUCelLsikTZBUk4xuZnt4HlFj1PbbiHimx58LAGtZc9+tbEI9pyT9x4A=='),
			'Paul',
			'Magnat',
			GETDATE(),
			1,
			1
		);

		DECLARE @directionRoleId UNIQUEIDENTIFIER = (SELECT [Roles].[Id] 
													FROM [dbo].[Roles] 
													WHERE [Roles].[Name] = ('Direction'))

		DECLARE @directionUserId AS UNIQUEIDENTIFIER = (SELECT [Users].[Id]
														FROM [dbo].[Users]
														WHERE [Users].[Email] LIKE ('direction@email.com'));

		INSERT INTO [dbo].[UserRoles]
		(
			RoleId,
			UserId
		)
		VALUES
		(
			@directionRoleId,
			@directionUserId
		);
	END