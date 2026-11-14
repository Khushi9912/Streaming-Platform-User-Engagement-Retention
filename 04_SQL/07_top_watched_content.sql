USE StreamingPlatformDB;
GO

SELECT TOP 10
    c.title,
    c.type,
    COUNT(wh.watch_id) AS Total_Watches
FROM dbo.WatchHistory AS wh
INNER JOIN dbo.Content AS c
    ON wh.content_id = c.content_id
GROUP BY
    c.title,
    c.type
ORDER BY
    Total_Watches DESC;