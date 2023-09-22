SELECT sum(t1.Above_AVG_TRACK_LENGTH*t1.quantity_sold) AS number_of_tracks_solds_above_average_length,
       sum(t1.Below_AVG_TRACK_LENGTH*t1.quantity_sold) AS number_of_tracks_solds_below_avf_length
FROM
  (SELECT InvoiceLine.TrackId,
          sum(InvoiceLine.Quantity) AS quantity_sold,
          InvoiceLine.UnitPrice,
          Track.Milliseconds,
          CASE
              WHEN Track.Milliseconds> 393599.212103911 THEN 1
              ELSE 0
          END AS Above_AVG_TRACK_LENGTH,
          CASE
              WHEN Track.Milliseconds<393599.212103911 THEN 1
              ELSE 0
          END AS Below_AVG_TRACK_LENGTH
   FROM track
   JOIN InvoiceLine ON track.TrackId=InvoiceLine.TrackId
   GROUP BY InvoiceLine.TrackId) t1
