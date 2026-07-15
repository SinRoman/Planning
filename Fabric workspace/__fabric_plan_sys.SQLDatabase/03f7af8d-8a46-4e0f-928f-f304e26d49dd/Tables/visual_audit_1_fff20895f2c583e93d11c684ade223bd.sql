CREATE TABLE [03f7af8d-8a46-4e0f-928f-f304e26d49dd].[visual_audit_1_fff20895f2c583e93d11c684ade223bd] (
    [id]                      BIGINT          IDENTITY (1, 1) NOT NULL,
    [rowId]                   NVARCHAR (2048) NOT NULL,
    [colId]                   NVARCHAR (2048) NOT NULL,
    [scenarioGuid]            NVARCHAR (255)  NULL,
    [measureGuid]             NVARCHAR (255)  NULL,
    [filterContextHash]       NVARCHAR (255)  NULL,
    [action]                  NVARCHAR (255)  NULL,
    [meta]                    NVARCHAR (MAX)  NULL,
    [oldValue]                NVARCHAR (MAX)  NULL,
    [newValue]                NVARCHAR (MAX)  NULL,
    [updatedAt]               INT             NOT NULL,
    [updatedByUPN]            NVARCHAR (320)  NOT NULL,
    [updatedBy]               NVARCHAR (128)  NOT NULL,
    [dim_dim_regionContinent] NVARCHAR (255)  NULL,
    [dim_dim_regionCountry]   NVARCHAR (255)  NULL,
    [dim_dim_dateYear]        NVARCHAR (255)  NULL,
    [dim_dim_dateMonthName]   NVARCHAR (255)  NULL,
    PRIMARY KEY CLUSTERED ([id] ASC)
);


GO

CREATE NONCLUSTERED INDEX [visual_audit_1_fff20895f2c583e93d11c684ade223bd_dim_dim_dateMonthName]
    ON [03f7af8d-8a46-4e0f-928f-f304e26d49dd].[visual_audit_1_fff20895f2c583e93d11c684ade223bd]([dim_dim_dateMonthName] ASC);


GO

CREATE NONCLUSTERED INDEX [visual_audit_1_fff20895f2c583e93d11c684ade223bd_dim_dim_dateYear]
    ON [03f7af8d-8a46-4e0f-928f-f304e26d49dd].[visual_audit_1_fff20895f2c583e93d11c684ade223bd]([dim_dim_dateYear] ASC);


GO

CREATE NONCLUSTERED INDEX [visual_audit_1_fff20895f2c583e93d11c684ade223bd_dim_dim_regionContinent]
    ON [03f7af8d-8a46-4e0f-928f-f304e26d49dd].[visual_audit_1_fff20895f2c583e93d11c684ade223bd]([dim_dim_regionContinent] ASC);


GO

CREATE NONCLUSTERED INDEX [visual_audit_1_fff20895f2c583e93d11c684ade223bd_dim_dim_regionCountry]
    ON [03f7af8d-8a46-4e0f-928f-f304e26d49dd].[visual_audit_1_fff20895f2c583e93d11c684ade223bd]([dim_dim_regionCountry] ASC);


GO

