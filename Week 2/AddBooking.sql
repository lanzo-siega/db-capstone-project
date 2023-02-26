DELIMITER // 
CREATE PROCEDURE AddBooking (IN bookID INT, IN custID INT, IN bookdate DATE, IN tablenum INT)
BEGIN
	INSERT INTO Bookings (BookingID, GuestID, BookingDate, TableNo)
    VALUES
    (bookID, custID, bookdate, tablenum);
END //