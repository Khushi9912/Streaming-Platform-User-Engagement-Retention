
USE StreamingPlatformDB;
GO

SELECT
    MIN(watch_date) AS Earliest_Date,
    MAX(watch_date) AS Latest_Date,
    COUNT(*) AS Total_Watches,
    COUNT(DISTINCT watch_date) AS Distinct_Watch_Dates
FROM dbo.WatchHistory;
