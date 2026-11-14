USE StreamingPlatformDB;
GO

SELECT TOP 10
    u.user_id,
    u.subscription_plan,
    COUNT(wh.watch_id) AS Total_Watches,
    SUM(wh.watch_duration_minutes) AS Total_Watch_Minutes,
    ROUND(
        AVG(CAST(wh.completion_percentage AS FLOAT)),
        2
    ) AS Average_Completion_Percentage
FROM dbo.Users AS u
INNER JOIN dbo.WatchHistory AS wh
    ON u.user_id = wh.user_id
GROUP BY
    u.user_id,
    u.subscription_plan
ORDER BY
    Total_Watch_Minutes DESC;