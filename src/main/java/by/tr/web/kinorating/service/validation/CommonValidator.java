package by.tr.web.kinorating.service.validation;

public class CommonValidator {
	
	private static final int MAX_LANG_LENGTH = 2;

	public static boolean isEmptyOrNull(String string) {
		if (string == null) {
			return true;
		}
		if (string.isEmpty()) {
			return true;
		}
		return false;
	}

	public static boolean validateLanguageName(String langName) {
		if (isEmptyOrNull(langName)) {
			return false;
		}
		if (langName.length() > MAX_LANG_LENGTH) {
			return false;
		}
		return true;
	}
	
	public static boolean validateStartIndexInRange(int start, int totalAmount) {
		if (start < 0 || start > totalAmount) {
			return false;
		}
		return true;		
	}
	
	public static boolean validateAmount(int amount) {
		if (amount <= 0) {
			return false;
		}
		return true;
	}
}
