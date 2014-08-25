CREATE TABLE [Production].[Categories]
(
[categoryid] [int] NOT NULL IDENTITY(1, 1),
[categoryname] [nvarchar] (15) COLLATE Latin1_General_CI_AS NOT NULL,
[description] [nvarchar] (200) COLLATE Latin1_General_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [Production].[Categories] ADD CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED  ([categoryid]) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [categoryname] ON [Production].[Categories] ([categoryname]) ON [PRIMARY]
GO
