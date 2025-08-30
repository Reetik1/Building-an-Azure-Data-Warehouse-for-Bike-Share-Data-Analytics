IF NOT EXISTS (SELECT * FROM sys.external_file_formats WHERE name = 'SynapseDelimitedTextFormat') 
	CREATE EXTERNAL FILE FORMAT [SynapseDelimitedTextFormat] 
	WITH ( FORMAT_TYPE = DELIMITEDTEXT ,
	       FORMAT_OPTIONS (
			 FIELD_TERMINATOR = ',',
			 FIRST_ROW = 2,
			 USE_TYPE_DEFAULT = FALSE
			))
GO

IF NOT EXISTS (SELECT * FROM sys.external_data_sources WHERE name = 'projecttttt_myprojectt_dfs_core_windows_net') 
	CREATE EXTERNAL DATA SOURCE [projecttttt_myprojectt_dfs_core_windows_net] 
	WITH (
		LOCATION = 'abfss://projecttttt@myprojectt.dfs.core.windows.net' 
	)
GO

CREATE EXTERNAL TABLE dbo.stage_trip (
	[trip_id] nvarchar(4000),
	[rideable_type] nvarchar(4000),
	[started_at] nvarchar(4000),
	[ended_at] nvarchar(4000),
	[start_station] nvarchar(4000),
	[end_station] nvarchar(4000),
	[member_id] nvarchar(4000)
	)
	WITH (
	LOCATION = 'Source/public.trip.csv',
	DATA_SOURCE = [projecttttt_myprojectt_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.stage_trip
GO