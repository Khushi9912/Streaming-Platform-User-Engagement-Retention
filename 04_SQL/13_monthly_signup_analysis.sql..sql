USE StreamingPlatformDB;
GO

SELECT
    YEAR(signup_date) AS Signup_Year,
    MONTH(signup_date) AS Signup_Month,
    COUNT(*) AS Total_Signups
FROM dbo.Users
GROUP BY
    YEAR(signup_date),
    MONTH(signup_date)
ORDER BY
    Signup_Year,
    Signup_Month;