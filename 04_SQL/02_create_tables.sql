USE StreamingPlatformDB;
GO
CREATE TABLE Users (
    user_id VARCHAR(10) PRIMARY KEY,
    signup_date DATE NOT NULL,
    country VARCHAR(100) NOT NULL,
    subscription_plan VARCHAR(20) NOT NULL,
    subscription_status VARCHAR(20) NOT NULL
);
GO
CREATE TABLE Content (
    content_id VARCHAR(10) PRIMARY KEY,
    title VARCHAR(500) NOT NULL,
    type VARCHAR(20) NOT NULL,
    director VARCHAR(500),
    country VARCHAR(500) NOT NULL,
    release_year INT NOT NULL,
    rating VARCHAR(20) NOT NULL,
    duration_value INT,
    duration_unit VARCHAR(20),
    genre VARCHAR(500) NOT NULL
);

CREATE TABLE WatchHistory (
    watch_id VARCHAR(10) PRIMARY KEY,
    user_id VARCHAR(10) NOT NULL,
    content_id VARCHAR(10) NOT NULL,
    watch_date DATE NOT NULL,
    watch_duration_minutes INT NOT NULL,
    completion_percentage DECIMAL(5,2) NOT NULL,
    device_type VARCHAR(20) NOT NULL,

    CONSTRAINT FK_WatchHistory_Users
        FOREIGN KEY (user_id)
        REFERENCES Users(user_id),

    CONSTRAINT FK_WatchHistory_Content
        FOREIGN KEY (content_id)
        REFERENCES Content(content_id)
);
GO

