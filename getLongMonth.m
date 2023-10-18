function [longMonth] = getLongMonth(threeDigitCode) 
    longMonth = "(NULL)";
    
    switch threeDigitCode
        case "Jan"
            longMonth = "January";
            
        case "Feb"
            longMonth = "February";
            
        case "Mar"
            longMonth = "March";
            
        case "Apr"
            longMonth = "April";
            
        case "May"
            longMonth = "May";
            
        case "Jun"
            longMonth = "June";
            
        case "Jul"
            longMonth = "July";
            
        case "Aug"
            longMonth = "August";

        case "Sep"
            longMonth = "September";
            
        case "Oct"
            longMonth = "October";
            
        case "Nov"
            longMonth = "November";
            
        case "Dec"
            longMonth = "December";
    end

end
