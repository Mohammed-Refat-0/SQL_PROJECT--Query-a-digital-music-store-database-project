SELECT Genre.Name AS Genre,
       Avg(unitprice) AS average_track_price
FROM Genre
JOIN track ON track.GenreId=Genre.GenreId
GROUP BY Genre.name
ORDER BY 2 DESC
