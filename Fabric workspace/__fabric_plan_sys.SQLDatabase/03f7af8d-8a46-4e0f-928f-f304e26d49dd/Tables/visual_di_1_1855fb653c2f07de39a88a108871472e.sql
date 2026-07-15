CREATE TABLE [03f7af8d-8a46-4e0f-928f-f304e26d49dd].[visual_di_1_1855fb653c2f07de39a88a108871472e] (
    [id]                     BIGINT           IDENTITY (1, 1) NOT NULL,
    [rowId]                  NVARCHAR (255)   NOT NULL,
    [colId]                  NVARCHAR (255)   NOT NULL,
    [scenarioId]             INT              NULL,
    [filterContextHash]      NVARCHAR (255)   NULL,
    [updatedAt]              INT              NOT NULL,
    [updatedBy]              NVARCHAR (128)   NOT NULL,
    [dim_dim_productProduct] NVARCHAR (255)   NULL,
    [dim_dim_dateYear]       NVARCHAR (255)   NULL,
    [dim_dim_dateMonth]      NVARCHAR (255)   NULL,
    [measure_1]              DECIMAL (30, 10) NULL,
    [measure_1_meta]         NVARCHAR (255)   NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    UNIQUE NONCLUSTERED ([rowId] ASC, [colId] ASC, [scenarioId] ASC, [filterContextHash] ASC)
);


GO

CREATE NONCLUSTERED INDEX [visual_di_1_1855fb653c2f07de39a88a108871472e_dim_dim_dateMonth]
    ON [03f7af8d-8a46-4e0f-928f-f304e26d49dd].[visual_di_1_1855fb653c2f07de39a88a108871472e]([dim_dim_dateMonth] ASC);


GO

CREATE NONCLUSTERED INDEX [visual_di_1_1855fb653c2f07de39a88a108871472e_dim_dim_dateYear]
    ON [03f7af8d-8a46-4e0f-928f-f304e26d49dd].[visual_di_1_1855fb653c2f07de39a88a108871472e]([dim_dim_dateYear] ASC);


GO

CREATE NONCLUSTERED INDEX [visual_di_1_1855fb653c2f07de39a88a108871472e_dim_dim_productProduct]
    ON [03f7af8d-8a46-4e0f-928f-f304e26d49dd].[visual_di_1_1855fb653c2f07de39a88a108871472e]([dim_dim_productProduct] ASC);


GO

