USE StreamingPlatformDB;
GO

-- 1. Validate watch records and unique IDs
SELECT
    COUNT(*) AS Total_Watch_Records,
    COUNT(DISTINCT user_id) AS Unique_Users,
    COUNT(DISTINCT content_id) AS Unique_Content
FROM dbo.WatchHistory;

-- 2. Check for invalid user references
SELECT COUNT(*) AS Invalid_User_References
FROM dbo.WatchHistory AS wh
LEFT JOIN dbo.Users AS u
    ON wh.user_id = u.user_id
WHERE u.user_id IS NULL;

-- 3. Check for invalid content references
SELECT COUNT(*) AS Invalid_Content_References
FROM dbo.WatchHistory AS wh
LEFT JOIN dbo.Content AS c
    ON wh.content_id = c.content_id
WHERE c.content_id IS NULL;
