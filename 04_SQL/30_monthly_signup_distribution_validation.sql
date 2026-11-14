
USE StreamingPlatformDB;
GO

SELECT
    MONTH(signup_date) AS Signup_Month,
    COUNT(*) AS New_Users
FROM dbo.Users
GROUP BY MONTH(signup_date)
ORDER BY Signup_Month;
