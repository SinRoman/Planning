CREATE TABLE [03f7af8d-8a46-4e0f-928f-f304e26d49dd].[visual_di_2_fdb010e715d09c47a8c955c31995f8aa] (
    [id]                             BIGINT           IDENTITY (1, 1) NOT NULL,
    [rowId]                          NVARCHAR (255)   NOT NULL,
    [colId]                          NVARCHAR (255)   NOT NULL,
    [scenarioId]                     INT              NULL,
    [filterContextHash]              NVARCHAR (255)   NULL,
    [updatedAt]                      INT              NOT NULL,
    [updatedBy]                      NVARCHAR (128)   NOT NULL,
    [dim_dim_productProductCategory] NVARCHAR (255)   NULL,
    [dim_dim_dateYear]               NVARCHAR (255)   NULL,
    [dim_dim_dateQuarter]            NVARCHAR (255)   NULL,
    [measure_4]                      DECIMAL (30, 10) NULL,
    [measure_4_meta]                 NVARCHAR (255)   NULL,
    PRIMARY KEY CLUSTERED ([id] ASC),
    UNIQUE NONCLUSTERED ([rowId] ASC, [colId] ASC, [scenarioId] ASC, [filterContextHash] ASC)
);


GO

CREATE NONCLUSTERED INDEX [visual_di_2_fdb010e715d09c47a8c955c31995f8aa_dim_dim_dateQuarter]
    ON [03f7af8d-8a46-4e0f-928f-f304e26d49dd].[visual_di_2_fdb010e715d09c47a8c955c31995f8aa]([dim_dim_dateQuarter] ASC);


GO

CREATE NONCLUSTERED INDEX [visual_di_2_fdb010e715d09c47a8c955c31995f8aa_dim_dim_dateYear]
    ON [03f7af8d-8a46-4e0f-928f-f304e26d49dd].[visual_di_2_fdb010e715d09c47a8c955c31995f8aa]([dim_dim_dateYear] ASC);


GO

CREATE NONCLUSTERED INDEX [visual_di_2_fdb010e715d09c47a8c955c31995f8aa_dim_dim_productProductCategory]
    ON [03f7af8d-8a46-4e0f-928f-f304e26d49dd].[visual_di_2_fdb010e715d09c47a8c955c31995f8aa]([dim_dim_productProductCategory] ASC);


GO

