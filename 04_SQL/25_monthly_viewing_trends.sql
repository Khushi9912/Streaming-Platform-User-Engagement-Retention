USE StreamingPlatformDB;
GO

SELECT
    YEAR(watch_date) AS Watch_Year,
    MONTH(watch_date) AS Watch_Month,
    COUNT(*) AS Total_Watches,
    COUNT(DISTINCT user_id) AS Unique_Users,
    ROUND(
        AVG(CAST(watch_duration_minutes AS FLOAT)),
        2
    ) AS Average_Watch_Minutes
FROM dbo.WatchHistory
GROUP BY
    YEAR(watch_date),
    MONTH(watch_date)
ORDER BY
    Watch_Year,
    Watch_Month;