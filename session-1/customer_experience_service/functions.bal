import ballerina/time;

// Function to convert date string to readable format
function formatDateToWords(string dateString) returns string|error {
    // Append default time to make it a valid RFC 3339 timestamp
    string fullTimestamp = dateString + "T00:00:00Z";
    
    // Parse the timestamp string to Civil record
    time:Civil civil = check time:civilFromString(fullTimestamp);
    
    // Get month name from month number
    string monthName = getMonthName(civil.month);
    
    // Return formatted string
    return monthName + " " + civil.day.toString();
}

// Helper function to convert month number to month name
function getMonthName(int monthNumber) returns string {
    match monthNumber {
        1 => {
            return "January";
        }
        2 => {
            return "February";
        }
        3 => {
            return "March";
        }
        4 => {
            return "April";
        }
        5 => {
            return "May";
        }
        6 => {
            return "June";
        }
        7 => {
            return "July";
        }
        8 => {
            return "August";
        }
        9 => {
            return "September";
        }
        10 => {
            return "October";
        }
        11 => {
            return "November";
        }
        12 => {
            return "December";
        }
        _ => {
            return "Invalid";
        }
    }
}