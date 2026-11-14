USE StreamingPlatformDB;
GO

SELECT
    c.type AS Content_Type,
    COUNT(wh.watch_id) AS Total_Watches,
    SUM(CASE
        WHEN wh.completion_percentage >= 90 THEN 1
        ELSE 0
    END) AS Watches_Completed_90_Percent,
    ROUND(
        100.0 * SUM(CASE
            WHEN wh.completion_percentage >= 90 THEN 1
            ELSE 0
        END) / COUNT(wh.watch_id),
        2
    ) AS Completion_90_Percent_Rate
FROM dbo.WatchHistory AS wh
INNER JOIN dbo.Content AS c
    ON wh.content_id = c.content_id
GROUP BY c.type
ORDER BY Completion_90_Percent_Rate DESC;