
USE StreamingPlatformDB;
GO

SELECT
    MONTH(watch_date) AS Watch_Month,
    COUNT(DISTINCT watch_date) AS Active_Days,
    COUNT(*) AS Total_Watches,
    CAST(
        COUNT(*) * 1.0 / COUNT(DISTINCT watch_date)
        AS DECIMAL(10,2)
    ) AS Average_Watches_Per_Active_Day
FROM dbo.WatchHistory
GROUP BY MONTH(watch_date)
ORDER BY Watch_Month;
