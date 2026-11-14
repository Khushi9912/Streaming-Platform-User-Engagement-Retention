USE StreamingPlatformDB;
GO

SELECT
    ROUND(AVG(completion_percentage), 2) AS Average_Completion_Percentage,
    ROUND(MIN(completion_percentage), 2) AS Minimum_Completion,
    ROUND(MAX(completion_percentage), 2) AS Maximum_Completion
FROM dbo.WatchHistory;