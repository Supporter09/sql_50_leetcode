SELECT DISTINCT author_id AS id
FROM Views V
WHERE V.author_id = V.viewer_id
ORDER BY author_id ASC;
