USE StreamingPlatformDB;
GO

SELECT
    device_type,
    COUNT(*) AS Total_Watches,
    COUNT(DISTINCT user_id) AS Unique_Users
FROM dbo.WatchHistory
GROUP BY device_type
ORDER BY Total_Watches DESC;
