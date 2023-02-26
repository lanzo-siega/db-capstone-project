

DELIMITER //
CREATE PROCEDURE AddValidBooking(IN bookdate DATE, IN tablenum INT)
BEGIN
START TRANSACTION;
SET @alreadybooked = (SELECT
	(CASE
		WHEN (SELECT
				BookingID
			FROM 
				Bookings
			WHERE
				BookingDate = bookdate
                AND TableNo = tablenum) IS NOT NULL THEN 1
			ELSE 0
			END
			));
IF
	@alreadybooked = 0 THEN 
		INSERT INTO Bookings (BookingDate,TableNo) VALUES (bookdate,tablenum);
ELSE
	SELECT 'Table is already booked. Booking Cancelled.' BookingStatus;
END IF;
COMMIT;
END //
DELIMITER ;