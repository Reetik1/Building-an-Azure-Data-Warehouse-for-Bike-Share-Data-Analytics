IF OBJECT_ID('dbo.dim_date') IS NOT NULL
BEGIN
  DROP EXTERNAL TABLE [dbo].[dim_date];
END
GO

CREATE EXTERNAL TABLE dbo.dim_date
WITH (
    LOCATION     = 'dim_date',
    DATA_SOURCE  = [projecttttt_myprojectt_dfs_core_windows_net],
    FILE_FORMAT  = [SynapseDelimitedTextFormat]
)
AS
SELECT DISTINCT
  CAST(CONVERT(varchar(8), TRY_CAST(dt AS date), 112) AS int) AS DateID,
  TRY_CAST(dt AS date) AS FullDate,
  DATEPART(day, TRY_CAST(dt AS date)) AS [Day],
  DATEPART(month, TRY_CAST(dt AS date)) AS [Month],
  DATEPART(year, TRY_CAST(dt AS date)) AS [Year],
  DATENAME(weekday, TRY_CAST(dt AS date)) AS Day_of_week,
  DATEPART(quarter, TRY_CAST(dt AS date)) AS Quarter
FROM
(
  SELECT started_at AS dt FROM dbo.stage_trip
  UNION
  SELECT ended_at FROM dbo.stage_trip
  UNION
  SELECT [date] FROM dbo.stage_payment
) src
WHERE TRY_CAST(dt AS date) IS NOT NULL;



SELECT TOP 10 * FROM dbo.dim_date;