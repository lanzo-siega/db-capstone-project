DELIMITER // 
CREATE PROCEDURE UpdateBooking (IN bookid INT, IN bookdate DATE)
BEGIN
	UPDATE Bookings
    SET BookingDate = bookdate 
    where BookingID = bookid;
END //