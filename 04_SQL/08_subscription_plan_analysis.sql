USE StreamingPlatformDB;
GO

SELECT
    subscription_plan,
    COUNT(*) AS Total_Users,
    SUM(CASE
        WHEN subscription_status = 'Active' THEN 1
        ELSE 0
    END) AS Active_Users,
    SUM(CASE
        WHEN subscription_status = 'Cancelled' THEN 1
        ELSE 0
    END) AS Cancelled_Users
FROM dbo.Users
GROUP BY subscription_plan
ORDER BY Total_Users DESC;