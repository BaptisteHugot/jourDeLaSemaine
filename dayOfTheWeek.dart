import 'dart:html';
​
/**
* Return the value as an Integer of the day for the Gregorian calendar.
* @param day The day of the date
* @param month The month of the date
* @param year The year of the date
* @return The value of the day
*/
int dayGregorianCalendar(int day, int month, int year) {
  return (day +
          ((13 * (month + 1)) / 5).floor() +
          year +
          (year / 4).floor() -
          (year / 100).floor() +
          (year / 400).floor()) %
      7;
}
​
/**
* Return the value as an Integer of the day for the Julian calendar.
* @param day The day of the date
* @param month The month of the date
* @param year The year of the date
* @return The value of the day
*/
int dayJulianCalendar(int day, int month, int year) {
  return (day +
          ((13 * (month + 1)) / 5).floor() +
          year +
          (year / 4).floor() +
          5) %
      7;
}
​
/**
* Return the value of the day as a String.
* @param day the integer returned by the Zeller's formulae
* @return String the name of the day (Monday to Sunday)
*/
String nameOfTheDay(int day) {
  String nameOfTheDay;
  switch (day) {
    case 0:
      {
        nameOfTheDay = "Saturday";
      }
      break;
    case 1:
      {
        nameOfTheDay = "Sunday";
      }
      break;
    case 2:
      {
        nameOfTheDay = "Monday";
      }
      break;
    case 3:
      {
        nameOfTheDay = "Tuesday";
      }
      break;
    case 4:
      {
        nameOfTheDay = "Wednesday";
      }
      break;
    case 5:
      {
        nameOfTheDay = "Thursday";
      }
      break;
    case 6:
      {
        nameOfTheDay = "Friday";
      }
      break;
  }
  return nameOfTheDay;
}
​
/**
* Function executed when a click is made on the button "Verify"
* @param event Click on the button
*/
void actionVerification(MouseEvent event) {
  try {
    querySelector('#display').text = '';
    DateTime date = (querySelector('#date') as InputElement).valueAsDate;
    int year = date.year;
    int month = date.month;
    int day = date.day;
​
    int gregorian = dayGregorianCalendar(day, month, year);
    int julian = dayJulianCalendar(day, month, year);
    querySelector('#display').text = day.toString() +
        "/" +
        month.toString() +
        "/" +
        year.toString() +
        " is a " +
        nameOfTheDay(gregorian) +
        " in the Gregorian calendar and a " +
        nameOfTheDay(julian) +
        " in the Julian calendar.";
  } catch (e) {
    // To catch the case of one field is null
    querySelector('#display').text = "Enter a correct date please!";
  }
}
​
/**
* Function executed when a click is made on the button "Erase"
* @param event Click on the button
*/
void actionDeletion(MouseEvent event) {
  querySelector('#display').text = '';
  (querySelector('#date') as InputElement).value = '';
}
​
/**
* Main function of the application
*/
void main() {
  querySelector('#verify').onClick.listen(actionVerification);
  querySelector('#erase').onClick.listen(actionDeletion);
}