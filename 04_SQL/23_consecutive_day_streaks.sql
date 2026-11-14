USE StreamingPlatformDB;
GO

WITH UniqueWatchDays AS (
    SELECT DISTINCT
        user_id,
        watch_date
    FROM dbo.WatchHistory
),
NumberedDays AS (
    SELECT
        user_id,
        watch_date,
        DATEADD(
            DAY,
            -ROW_NUMBER() OVER (
                PARTITION BY user_id
                ORDER BY watch_date
            ),
            watch_date
        ) AS Streak_Group
    FROM UniqueWatchDays
),
Streaks AS (
    SELECT
        user_id,
        MIN(watch_date) AS Streak_Start_Date,
        MAX(watch_date) AS Streak_End_Date,
        COUNT(*) AS Consecutive_Days
    FROM NumberedDays
    GROUP BY
        user_id,
        Streak_Group
),
LongestStreak AS (
    SELECT
        user_id,
        Streak_Start_Date,
        Streak_End_Date,
        Consecutive_Days,
        ROW_NUMBER() OVER (
            PARTITION BY user_id
            ORDER BY Consecutive_Days DESC, Streak_End_Date DESC
        ) AS Streak_Rank
    FROM Streaks
)
SELECT TOP 10
    user_id,
    Streak_Start_Date,
    Streak_End_Date,
    Consecutive_Days AS Longest_Streak_Days
FROM LongestStreak
WHERE Streak_Rank = 1
ORDER BY Longest_Streak_Days DESC, user_id;

