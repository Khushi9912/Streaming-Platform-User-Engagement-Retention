
USE StreamingPlatformDB;
GO

SELECT
    COUNT(*) AS Total_Watches,
    SUM(CASE
        WHEN w.watch_date < u.signup_date THEN 1
        ELSE 0
    END) AS Watches_Before_Signup,
    SUM(CASE
        WHEN w.watch_date >= u.signup_date THEN 1
        ELSE 0
    END) AS Watches_On_Or_After_Signup
FROM dbo.WatchHistory w
INNER JOIN dbo.Users u
    ON w.user_id = u.user_id;
