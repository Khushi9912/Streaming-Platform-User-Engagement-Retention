USE StreamingPlatformDB;
GO

SELECT COUNT(*) AS Total_Users
FROM dbo.Users_Staging;

INSERT INTO dbo.Users
(
    user_id,
    signup_date,
    country,
    subscription_plan,
    subscription_status
)
SELECT
    user_id,
    signup_date,
    country,
    subscription_plan,
    subscription_status
FROM dbo.Users_Staging;

SELECT COUNT(*) AS Total_Users
FROM dbo.Users;

DROP TABLE dbo.Users_Staging;
SELECT COUNT(*) AS Total_Users
FROM dbo.Users;