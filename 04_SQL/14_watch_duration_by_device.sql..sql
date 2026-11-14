USE StreamingPlatformDB;
GO

SELECT
    device_type,
    COUNT(*) AS Total_Watches,
    ROUND(AVG(CAST(watch_duration_minutes AS FLOAT)), 2)
        AS Average_Watch_Minutes
FROM dbo.WatchHistory
GROUP BY device_type
ORDER BY Average_Watch_Minutes DESC;