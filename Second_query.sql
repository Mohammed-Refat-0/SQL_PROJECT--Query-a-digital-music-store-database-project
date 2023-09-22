SELECT genre.Name,
       count(*) AS number_of_tracks
FROM Track
JOIN Genre ON genre.GenreId=Track.GenreId
GROUP BY genre.Name
ORDER BY count(*) DESC
