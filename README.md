# Depot EICE - Database Project

## UML Diagram

![UML DIAGRAM](https://user-images.githubusercontent.com/56565073/180665428-999514de-fe86-4350-8443-c176654336ac.png)

## Tables Descriptions

### Appointments

Represent [user](###Users)'s appointments. A User can have 0 or more appointment but an appointment must have 1 User

**Relation**

[Users] 0,n ------ 1,1 [Appointments]

|Name     |Data type       |Nullable     |Default Value      |
|:-------:|:--------------:|:-----------:|:-----------------:|
|Id       |INT             |false        |                   |
|StartAt  |DATETIME2(7)    |false        |                   |
|EndAt    |DATETIME2(7)    |false        |                   |
|Accepted |BIT             |false        | 0                  |
|UserId   | UNIQUEIDENTIFIER |false        |                   |

**CONSTRAINTS**

- `FK_Appointments_User`
 
**FOREIGN KEYS**

- `[UserId]`: [Users](###Users)

### ArticleComments

Represent the comment written on an [article](###Articles) by a [user](###Users).

An Article can have 0 or more comments
An User can have 0 or more comments

**Relations**

[Articles] 0,n ------- 1,1 [

|Name     |Data type       |Nullable     |Default Value      |
|:-------:|:--------------:|:-----------:|:-----------------:|
|Note     |INT             |false        |                   |
|Review   |NVARCHAR(500)   |false        |                   |
|CreatedAt|DATETIME2(7)    |false        |GETDATE() [^1]     |
|UpdatedAt|DATETIME2(7)    |true         | |
| ArticleId | INT | false ||
| UserId | UNIQUEIDENTIFIER | false | |

**CONSTRAINTS**

- `FK_ArticleComments_Article`
- `FK_ArticleComments_User`

**FOREIGN KEYS**

- `[ArticleId]`: [Articles](###Articles)
- `[UserId]`: [Users](###Users)

### Articles

|Name     |Data type       |Nullable     |Default Value      |
|:-------:|:--------------:|:-----------:|:-----------------:|
| Id | INT | false | |
| Title | NVARCHAR(100) | false | |
| Body | TEXT | | false | |
| CreatedAt | DATETIME2(7) | false | GETDATE() [^1] |
| UpdatedAt | DATETIME2(7) | true | |
| Pinned | BIT | false | |
| UserId | UNIQUEIDENTIFIER | false | |

**CONSTRAINTS**

- `FK_Articles_User`

**FOREIGN KEYS**

- `[UserId]`: [Users](###Users)

### Messages

|Name     |Data type       |Nullable     |Default Value      |
|:-------:|:--------------:|:-----------:|:-----------------:|
| Id | INT | false | |
| SenderId | UNIQUEIDENTIFIER | false | |
| ReceiverId | UNIQUEIDENTIFIER | false | |
| Content | TEXT | false | |
| SentAt | DATETIME2(7) | false | GETDATE() [^1] |

**CONSTRAINTS**

- `FK_Messages_Sender`
- `FK_Messages_Receiver`

**FOREIGN KEYS**

- `SenderId` : [Users](###Users)
- `ReceiverId` : [Users](###Users)

### Modules

|Name     |Data type       |Nullable     |Default Value      |
|:-------:|:--------------:|:-----------:|:-----------------:|
| Id | INT | false | |
| Name | NVARCHAR(255) | false | |
| Description | NVARCHAR(1000) | false | |

### OpeningHours

|Name     |Data type       |Nullable     |Default Value      |
|:-------:|:--------------:|:-----------:|:-----------------:|
| Id | INT | false | |
| OpenAt | DATETIME2(7) | false | |
| CloseAt | DATETIME2(7) | false | |

### Roles

|Name     |Data type       |Nullable     |Default Value      |
|:-------:|:--------------:|:-----------:|:-----------------:|
| Id | UNIQUEIDENTIFIER | false | NEWID() [^2] |
| Name | NVARCHAR(50) | false | |

### ScheduleFiles

|Name     |Data type       |Nullable     |Default Value      |
|:-------:|:--------------:|:-----------:|:-----------------:|
| Id | INT | false | |
| FilePath | NVARCHAR(255) | false | |
| ScheduleId | INT | false | |

**CONSTRAINTS**

- `FK_ScheduleFiles_Schedule`

**FOREIGN KEYS**

- `ScheduleId`: [Schedules](###Schedules)

### Schedules

|Name     |Data type       |Nullable     |Default Value      |
|:-------:|:--------------:|:-----------:|:-----------------:|
| Id | INT | false | |
| Title | NVARCHAR(100) | true | |
| Details | TEXT | true | |
| StartsAt | DATETIME2(7) | false | |
| EndsAt | DATETIME2(7) | false | |
| ModuleId | INT | false | |

**CONSTRAINTS**

- `FK_Schedules_Module`

**FOREIGN KEYS**

- `[ModuleId]`: [Modules](###Modules)

### Users

|Name     |Data type       |Nullable     |Default Value      |
|:-------:|:--------------:|:-----------:|:-----------------:|
| Id | UNIQUEIDENTIFIER | false | NEWID() [^2] |
| Email | NVARCHAR(320) | false | |
| NormalizedEmail | NVARCHAR(320) | false | |
| PasswordHash | BINARY(32) | false | |
| FirstName | NVARCHAR(50) | false | |
| LastName | NVARCHAR(100) | false | |
| ProfilePicture | NVARCHAR(255) | false | |
| BirthDate | DATE | false | |
| ConcurrencyStamp | UNIQUEIDENTIFIER | false | NEWID() [^2] |
| SecurityStamp | UNIQUEIDENTIFIER | false | NEWID() [^2] |
| IsActive | BIT | false | 0 |
| CreatedAt | DATETIME2(7) | false | GETDATE() [^1] |
| UpdatedAt | DATETIME2(7) | true | |
| DeletedAt | DATETIME2(7) | true | |

### UsersModules

|Name     |Data type       |Nullable     |Default Value      |
|:-------:|:--------------:|:-----------:|:-----------------:|
| UserId | UNIQUEIDENTIFIER | false | |
| ModuleId | INT | false | |

PRIMARY KEY ([UserId], [ModuleId])

**CONSTRAINTS**

- `FK_UsersModules_User`
- `FK_UsersModules_Module`

**FOREIGN KEYS**

- `UserId` : [Users](###Users)
- `ModuleId`: [Modules](###Modules)

### UsersRoles

|Name     |Data type       |Nullable     |Default Value      |
|:-------:|:--------------:|:-----------:|:-----------------:|
| UserId | UNIQUEIDENTIFIER | false | |
| RoleId | UNIQUEIDENTIFIER | false | |

PRIMARY KEY ([UserId], [RoleId])

**CONSTRAINTS**

- `FK_UsersRoles_User`
- `FK_UsersRoles_Role`

**FOREIGN KEYS**

- `UserId`: [Users](###Users)
- `RoleId`: [Roles](###Roles)

### UsersTokens

|Name     |Data type       |Nullable     |Default Value      |
|:-------:|:--------------:|:-----------:|:-----------------:|
| Id | UNIQUEIDENTIFIER | false | NEWID() [^2] |
| Type | NVARCHAR(100) | false | |
| Value | NVARCHAR(64) | false | |
| DeliveryDate | DATETIME2(7) | false | GETDATE() [^1] |
| ExpirationDate | DATETIME2(7) | false | |
| UserId | UNIQUEIDENTIFIER | false | |

**CONSTRAINTS**

- `FK_UsersTokens_User`

**PRIMARY KEYS**

- `[UserId]`: [Users](###Users)

[^1]: The `GETDATE()` function in MSSQL will return the current `DATETIME2` value. Check [here](https://docs.microsoft.com/en-us/sql/t-sql/functions/getdate-transact-sql?view=sql-server-ver16) for more details
[^2]: The `NEWID()` function in MSSQL will generated a new UNIQUEIDENTIFIER. Check [here](https://docs.microsoft.com/en-us/sql/t-sql/functions/newid-transact-sql?view=sql-server-ver16) for more details
