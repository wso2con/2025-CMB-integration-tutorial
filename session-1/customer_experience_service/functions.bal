import ballerina/time;

// Convert date string from "YYYY-MM-DD" format to "Month Day" format
function formatDateToMonthDay(string dateString) returns string|error {
    // Append time component to make it RFC 3339 compliant
    string rfc3339String = dateString + "T00:00:00Z";
    time:Civil civilDate = check time:civilFromString(rfc3339String);
    
    string monthName = getMonthName(civilDate.month);
    
    return monthName + " " + civilDate.day.toString();
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