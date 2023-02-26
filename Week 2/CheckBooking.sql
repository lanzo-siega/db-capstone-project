DELIMITER //
CREATE PROCEDURE CheckBooking(IN bookdate DATE, IN tablenum INT)
BEGIN
SELECT
	(CASE
		WHEN (SELECT
				BookingID
			FROM 
				Bookings
			WHERE
				BookingDate = bookdate
                AND TableNo = tablenum) IS NOT NULL THEN 'Table is already booked'
			ELSE
				'Table is available'
			END
			) BookingStatus;
END //
DELIMITER ;