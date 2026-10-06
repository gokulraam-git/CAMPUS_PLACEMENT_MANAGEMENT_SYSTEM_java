package util;

public class ConsoleUtil {

    private ConsoleUtil() {
    }

    public static void printHeader(String title) {

        System.out.println();
        System.out.println("==========================================");
        System.out.println(" " + title);
        System.out.println("==========================================");
    }

    public static void printSuccess(String message) {
        System.out.println("[SUCCESS] " + message);
    }

    public static void printError(String message) {
        System.out.println("[ERROR] " + message);
    }

    public static void printInfo(String message) {
        System.out.println("[INFO] " + message);
    }

    public static void printSeparator() {
        System.out.println("------------------------------------------");
    }
}