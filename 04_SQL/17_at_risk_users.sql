USE StreamingPlatformDB;
GO

WITH UserActivity AS (
    SELECT
        u.user_id,
        u.subscription_plan,
        u.subscription_status,
        MAX(wh.watch_date) AS Last_Watch_Date
    FROM dbo.Users AS u
    LEFT JOIN dbo.WatchHistory AS wh
        ON u.user_id = wh.user_id
    GROUP BY
        u.user_id,
        u.subscription_plan,
        u.subscription_status
)
SELECT
    user_id,
    subscription_plan,
    Last_Watch_Date,
    DATEDIFF(
        DAY,
        Last_Watch_Date,
        '2025-12-31'
    ) AS Days_Since_Last_Watch
FROM UserActivity
WHERE subscription_status = 'Active'
  AND (
      Last_Watch_Date IS NULL
      OR Last_Watch_Date < DATEADD(DAY, -30, '2025-12-31')
  )
ORDER BY Days_Since_Last_Watch DESC;