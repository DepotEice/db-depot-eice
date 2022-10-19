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