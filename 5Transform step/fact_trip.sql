IF OBJECT_ID('dbo.fact_trip') IS NOT NULL
BEGIN
  DROP EXTERNAL TABLE [dbo].[fact_trip];
END
GO

CREATE EXTERNAL TABLE dbo.fact_trip
WITH (
    LOCATION     = 'fact_trip',
    DATA_SOURCE  = [projecttttt_myprojectt_dfs_core_windows_net],
    FILE_FORMAT  = [SynapseDelimitedTextFormat]
)
AS
SELECT
  t.trip_id AS TripID,
  TRY_CAST(t.member_id AS int) AS RiderID,
  s_start.StationID AS StartStationID,
  s_end.StationID AS EndStationID,
  CAST(CONVERT(varchar(8), TRY_CAST(t.started_at AS date), 112) AS int) AS StartDateID,
  CAST(CONVERT(varchar(8), TRY_CAST(t.ended_at AS date), 112) AS int) AS EndDateID,
  t.rideable_type AS BikeType,
  DATEDIFF(minute, TRY_CAST(t.started_at AS datetime), TRY_CAST(t.ended_at AS datetime)) AS TripDurationMinutes,
  DATEDIFF(year, TRY_CAST(dr.Birthday AS date), TRY_CAST(t.started_at AS date)) AS RiderAgeAtTrip
FROM dbo.stage_trip t
LEFT JOIN dbo.dim_station s_start ON s_start.StationName = t.start_station
LEFT JOIN dbo.dim_station s_end   ON s_end.StationName   = t.end_station
LEFT JOIN dbo.dim_rider dr ON TRY_CAST(t.member_id AS int) = dr.RiderID;
GO

-- Test the new fact table

SELECT TOP 10 * FROM dbo.fact_trip;