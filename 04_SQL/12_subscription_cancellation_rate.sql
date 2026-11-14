USE StreamingPlatformDB;
GO

SELECT
    subscription_plan,
    COUNT(*) AS Total_Users,
    SUM(CASE
        WHEN subscription_status = 'Cancelled' THEN 1
        ELSE 0
    END) AS Cancelled_Users,
    ROUND(
        100.0 * SUM(CASE
            WHEN subscription_status = 'Cancelled' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS Cancellation_Rate_Percent
FROM dbo.Users
GROUP BY subscription_plan
ORDER BY Cancellation_Rate_Percent DESC;