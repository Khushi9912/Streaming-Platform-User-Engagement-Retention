USE StreamingPlatformDB;
GO

SELECT
    u.subscription_status,
    COUNT(DISTINCT u.user_id) AS Total_Users,
    COUNT(wh.watch_id) AS Total_Watches,
    ROUND(
        AVG(CAST(wh.watch_duration_minutes AS FLOAT)),
        2
    ) AS Average_Watch_Minutes,
    ROUND(
        AVG(CAST(wh.completion_percentage AS FLOAT)),
        2
    ) AS Average_Completion_Percentage
FROM dbo.Users AS u
LEFT JOIN dbo.WatchHistory AS wh
    ON u.user_id = wh.user_id
GROUP BY u.subscription_status
ORDER BY Total_Watches DESC;