USE StreamingPlatformDB;
GO

SELECT
    watch_date,
    COUNT(*) AS Total_Watches
FROM dbo.WatchHistory
WHERE watch_date >= '2025-12-01'
  AND watch_date < '2026-01-01'
GROUP BY watch_date
ORDER BY Total_Watches DESC;