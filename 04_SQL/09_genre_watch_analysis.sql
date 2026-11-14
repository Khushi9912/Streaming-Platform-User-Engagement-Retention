USE StreamingPlatformDB;
GO

SELECT TOP 10
    LTRIM(RTRIM(g.value)) AS Genre,
    COUNT(wh.watch_id) AS Total_Watches
FROM dbo.WatchHistory AS wh
INNER JOIN dbo.Content AS c
    ON wh.content_id = c.content_id
CROSS APPLY STRING_SPLIT(c.genre, ',') AS g
GROUP BY LTRIM(RTRIM(g.value))
ORDER BY Total_Watches DESC;
