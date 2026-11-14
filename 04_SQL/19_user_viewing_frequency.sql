USE StreamingPlatformDB;
GO

SELECT TOP 10
    u.user_id,
    u.subscription_plan,
    COUNT(DISTINCT wh.watch_date) AS Active_Watch_Days,
    COUNT(wh.watch_id) AS Total_Watches,
    SUM(wh.watch_duration_minutes) AS Total_Watch_Minutes
FROM dbo.Users AS u
INNER JOIN dbo.WatchHistory AS wh
    ON u.user_id = wh.user_id
GROUP BY
    u.user_id,
    u.subscription_plan
ORDER BY
    Active_Watch_Days DESC,
    Total_Watch_Minutes DESC;