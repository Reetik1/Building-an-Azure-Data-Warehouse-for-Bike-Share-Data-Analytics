IF OBJECT_ID('dbo.fact_payment') IS NOT NULL
BEGIN
  DROP EXTERNAL TABLE [dbo].[fact_payment];
END
GO

CREATE EXTERNAL TABLE dbo.fact_payment
WITH (
    LOCATION     = 'fact_payment',
    DATA_SOURCE  = [projecttttt_myprojectt_dfs_core_windows_net],
    FILE_FORMAT  = [SynapseDelimitedTextFormat]
)
AS
SELECT
  p.payment_id AS PaymentID,
  dr.RiderID AS RiderID,
  CAST(CONVERT(varchar(8), TRY_CAST(p.[date] AS date), 112) AS int) AS DateID,
  TRY_CAST(p.amount AS decimal(18,2)) AS Amount
FROM dbo.stage_payment p
LEFT JOIN dbo.dim_rider dr ON p.account_number = dr.RiderKey;

SELECT TOP 10 * FROM dbo.fact_payment;