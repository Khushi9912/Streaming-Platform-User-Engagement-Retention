USE StreamingPlatformDB;
GO

WITH TitlePlanWatches AS (
    SELECT
        u.subscription_plan,
        c.title,
        c.type,
        COUNT(wh.watch_id) AS Total_Watches
    FROM dbo.WatchHistory AS wh
    INNER JOIN dbo.Users AS u
        ON wh.user_id = u.user_id
    INNER JOIN dbo.Content AS c
        ON wh.content_id = c.content_id
    GROUP BY
        u.subscription_plan,
        c.title,
        c.type
),
RankedTitles AS (
    SELECT
        subscription_plan,
        title,
        type,
        Total_Watches,
        ROW_NUMBER() OVER (
            PARTITION BY subscription_plan
            ORDER BY Total_Watches DESC, title
        ) AS Title_Rank
    FROM TitlePlanWatches
)
SELECT
    subscription_plan,
    title,
    type,
    Total_Watches
FROM RankedTitles
WHERE Title_Rank <= 5
ORDER BY subscription_plan, Title_Rank;