IF OBJECT_ID('dbo.dim_rider') IS NOT NULL
BEGIN
  DROP EXTERNAL TABLE [dbo].[dim_rider];
END
GO

CREATE EXTERNAL TABLE dbo.dim_rider
WITH (
    LOCATION     = 'dim_rider',
    DATA_SOURCE  = [projecttttt_myprojectt_dfs_core_windows_net],
    FILE_FORMAT  = [SynapseDelimitedTextFormat]
)
AS
SELECT DISTINCT
  TRY_CAST(r.rider_id AS int) AS RiderID,
  r.rider_id AS RiderKey,
  r.first AS FirstName,
  r.last AS LastName,
  r.address AS Address,
  TRY_CAST(r.date_of_birth AS date) AS Birthday,
  CASE WHEN LOWER(r.is_member) IN ('true','1','t','yes','y') THEN 1 ELSE 0 END AS IsMember,
  TRY_CAST(r.start_date AS date) AS Account_start_date,
  TRY_CAST(r.end_date AS date) AS Account_end_date
FROM dbo.stage_rider r
WHERE r.rider_id IS NOT NULL AND r.rider_id <> '';

SELECT TOP 10 * FROM dbo.dim_rider;