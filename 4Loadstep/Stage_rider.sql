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

CREATE EXTERNAL TABLE dbo.stage_rider (
	[rider_id] nvarchar(4000),
	[first] nvarchar(4000),
	[last] nvarchar(4000),
	[address] nvarchar(4000),
	[date_of_birth] nvarchar(4000),
	[start_date] nvarchar(4000),
	[end_date] nvarchar(4000),
	[is_member] nvarchar(4000)
	)
	WITH (
	LOCATION = 'Source/public.rider.csv',
	DATA_SOURCE = [projecttttt_myprojectt_dfs_core_windows_net],
	FILE_FORMAT = [SynapseDelimitedTextFormat]
	)
GO


SELECT TOP 100 * FROM dbo.stage_rider
GO