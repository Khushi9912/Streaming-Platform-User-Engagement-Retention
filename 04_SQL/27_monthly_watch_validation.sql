
USE StreamingPlatformDB;
GO

SELECT
    MONTH(watch_date) AS Watch_Month,
    COUNT(*) AS Total_Watches
FROM dbo.WatchHistory
GROUP BY MONTH(watch_date)
ORDER BY Watch_Month;
