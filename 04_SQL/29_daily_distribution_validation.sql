
USE StreamingPlatformDB;
GO

SELECT
    DAY(watch_date) AS Day_Of_Month,
    COUNT(*) AS Total_Watches
FROM dbo.WatchHistory
GROUP BY DAY(watch_date)
ORDER BY Day_Of_Month;
