USE StreamingPlatformDB;
GO

SELECT
    u.subscription_plan,
    COUNT(wh.watch_id) AS Total_Watches,
    COUNT(DISTINCT u.user_id) AS Total_Users,
    COUNT(DISTINCT wh.user_id) AS Users_Who_Watched,
    ROUND(
        AVG(CAST(wh.watch_duration_minutes AS FLOAT)),
        2
    ) AS Average_Watch_Minutes
FROM dbo.Users AS u
LEFT JOIN dbo.WatchHistory AS wh
    ON u.user_id = wh.user_id
GROUP BY u.subscription_plan
ORDER BY Total_Watches DESC;