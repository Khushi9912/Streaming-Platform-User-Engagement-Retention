USE StreamingPlatformDB;
GO

SELECT
    c.type AS Content_Type,
    COUNT(wh.watch_id) AS Total_Watches,
    COUNT(DISTINCT c.content_id) AS Unique_Titles_Watched,
    ROUND(
        AVG(CAST(wh.completion_percentage AS FLOAT)),
        2
    ) AS Average_Completion_Percentage,
    ROUND(
        AVG(CAST(wh.watch_duration_minutes AS FLOAT)),
        2
    ) AS Average_Watch_Minutes
FROM dbo.WatchHistory AS wh
INNER JOIN dbo.Content AS c
    ON wh.content_id = c.content_id
GROUP BY c.type
ORDER BY Total_Watches DESC;