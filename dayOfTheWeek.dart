/**
 * @file dayOfTheWeek.dart
 * @brief Fournit le nom du jour de la semaine pour une date donnée
 */

/**
 * Retourne la valeur en tant que nombre entier du jour dans le calendrier grégorien
 * @param day Le jour de la date choisie
 * @param month Le mois de la date choisie
 * @param year L'année de la date choisie
 * @return La valeur du jour
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

/**
 * Retourne la valeur en tant que nombre entier du jour dans le calendrier julien
 * @param day Le jour de la date choisie
 * @param month Le mois de la date choisie
 * @param year L'année de la date choisie
 * @return La valeur du jour
 */
int dayJulianCalendar(int day, int month, int year) {
  return (day +
      ((13 * (month + 1)) / 5).floor() +
      year +
      (year / 4).floor() +
      5) %
      7;
}

/**
 * Retourne la valeur du jour en tant que chaîne de caractères
 * @param day Le nombre entier retourné par l'application de la formule de Zeller
 * @return String Le nom du jour (lundi à dimanche)
 */
String nameOfTheDay(int day) {
  String nameOfTheDay = "";

  switch (day) {
    case 0:
      {
        nameOfTheDay = "samedi";
      }
      break;
    case 1:
      {
        nameOfTheDay = "dimanche";
      }
      break;
    case 2:
      {
        nameOfTheDay = "lundi";
      }
      break;
    case 3:
      {
        nameOfTheDay = "mardi";
      }
      break;
    case 4:
      {
        nameOfTheDay = "mercredi";
      }
      break;
    case 5:
      {
        nameOfTheDay = "jeudi";
      }
      break;
    case 6:
      {
        nameOfTheDay = "vendredi";
      }
      break;
  }

  return nameOfTheDay;
}