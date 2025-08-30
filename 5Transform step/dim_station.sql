IF OBJECT_ID('dbo.dim_station') IS NOT NULL
BEGIN
  DROP EXTERNAL TABLE [dbo].[dim_station];
END
GO

CREATE EXTERNAL TABLE dbo.dim_station
WITH (
    LOCATION     = 'dim_station',
    DATA_SOURCE  = [projecttttt_myprojectt_dfs_core_windows_net],
    FILE_FORMAT  = [SynapseDelimitedTextFormat]
)
AS
SELECT
  ROW_NUMBER() OVER (ORDER BY station_name) AS StationID,
  station_name AS StationName,
  NULL AS Latitude,
  NULL AS Longitude
FROM
(
  SELECT start_station AS station_name FROM dbo.stage_trip
  UNION
  SELECT end_station FROM dbo.stage_trip
) s
WHERE station_name IS NOT NULL AND station_name <> '';

SELECT TOP 10 * FROM dbo.dim_station;