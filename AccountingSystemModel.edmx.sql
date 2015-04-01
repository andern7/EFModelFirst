
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 03/28/2015 13:04:34
-- Generated from EDMX file: c:\users\wildfire\documents\visual studio 2013\Projects\EFModelFirst\EFModelFirst\AccountingSystemModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [AccountingSystem];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_InvoiceHeaderInvoiceDetail]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[InvoiceDetails] DROP CONSTRAINT [FK_InvoiceHeaderInvoiceDetail];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[InvoiceHeaders]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InvoiceHeaders];
GO
IF OBJECT_ID(N'[dbo].[InvoiceDetails]', 'U') IS NOT NULL
    DROP TABLE [dbo].[InvoiceDetails];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'InvoiceHeaders'
CREATE TABLE [dbo].[InvoiceHeaders] (
    [InvoiceHeaderId] int IDENTITY(1,1) NOT NULL,
    [Total] decimal(18,0)  NOT NULL
);
GO

-- Creating table 'InvoiceDetails'
CREATE TABLE [dbo].[InvoiceDetails] (
    [InvoiceDetailId] int IDENTITY(1,1) NOT NULL,
    [ItemDescription] nvarchar(max)  NOT NULL,
    [Quantity] int  NOT NULL,
    [Price] decimal(18,0)  NOT NULL,
    [InvoiceHeaderInvoiceHeaderId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [InvoiceHeaderId] in table 'InvoiceHeaders'
ALTER TABLE [dbo].[InvoiceHeaders]
ADD CONSTRAINT [PK_InvoiceHeaders]
    PRIMARY KEY CLUSTERED ([InvoiceHeaderId] ASC);
GO

-- Creating primary key on [InvoiceDetailId] in table 'InvoiceDetails'
ALTER TABLE [dbo].[InvoiceDetails]
ADD CONSTRAINT [PK_InvoiceDetails]
    PRIMARY KEY CLUSTERED ([InvoiceDetailId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [InvoiceHeaderInvoiceHeaderId] in table 'InvoiceDetails'
ALTER TABLE [dbo].[InvoiceDetails]
ADD CONSTRAINT [FK_InvoiceHeaderInvoiceDetail]
    FOREIGN KEY ([InvoiceHeaderInvoiceHeaderId])
    REFERENCES [dbo].[InvoiceHeaders]
        ([InvoiceHeaderId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InvoiceHeaderInvoiceDetail'
CREATE INDEX [IX_FK_InvoiceHeaderInvoiceDetail]
ON [dbo].[InvoiceDetails]
    ([InvoiceHeaderInvoiceHeaderId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------
