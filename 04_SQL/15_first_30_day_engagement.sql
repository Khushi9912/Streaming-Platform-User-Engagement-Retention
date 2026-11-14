USE StreamingPlatformDB;
GO

WITH UserFirst30Days AS (
    SELECT
        u.user_id,
        MIN(wh.watch_date) AS First_Watch_Date
    FROM dbo.Users AS u
    LEFT JOIN dbo.WatchHistory AS wh
        ON u.user_id = wh.user_id
        AND wh.watch_date >= u.signup_date
        AND wh.watch_date < DATEADD(DAY, 30, u.signup_date)
    GROUP BY u.user_id
)
SELECT
    COUNT(*) AS Total_Users,
    SUM(CASE
        WHEN First_Watch_Date IS NOT NULL THEN 1
        ELSE 0
    END) AS Users_Who_Watched_Within_30_Days,
    ROUND(
        100.0 * SUM(CASE
            WHEN First_Watch_Date IS NOT NULL THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS First_30_Day_Engagement_Rate
FROM UserFirst30Days;