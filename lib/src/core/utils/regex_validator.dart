class RegexValidator {
  RegexValidator._();

  static final numberRegex = RegExp(r'^[0-9]+$');

  static final email = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  static final password = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*\W).*$');

  /// Matches one or more characters that are either letters (both uppercase and lowercase), spaces, or hyphens
  static RegExp suburbRegex =RegExp(r"^[A-Za-z\s\-\[\]\(\)]+$");

  /// Matches one or more characters that are either letters (both uppercase and lowercase), spaces, or hyphens
  static RegExp patternRegex = RegExp(r"^[A-Za-z0-9\s\-/'\p{L}().]+$");

  /// Matches one or more characters that are either letters (both uppercase and lowercase), numbers, spaces, hyphens, or forward slashes or dots
  static RegExp datePattern = RegExp(r'^(0[1-9]|[12][0-9]|3[01])/(0[1-9]|1[0-2])/\d{4}$');

  static RegExp licenseNumRegex = RegExp(r'^(?=[A-Z0-9]{4,9}$)(?=(?:.*[0-9]){4})(?=(?:[^A-Z]*[A-Z]){0,2}[^A-Z]*$)[A-Z0-9]{2}[0-9]{2}[A-Z0-9]{0,5}$');
  static RegExp licenseNumWhenNotAURegex = RegExp(r'^[A-Za-z0-9]{1,30}$');
  static RegExp alphanumericRegex = RegExp(r'^[a-zA-Z0-9]+$');
  static RegExp universityNameAndIssuingAuthorityPattern = RegExp(r'^[a-zA-Z0-9\s]*$');


}