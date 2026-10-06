package auth;

public class SessionManager {

    private static Object currentUser;
    private static String currentRole;

    private SessionManager() {
    }

    public static void login(
            Object user,
            String role) {

        currentUser = user;
        currentRole = role;
    }

    public static void logout() {

        currentUser = null;
        currentRole = null;
    }

    public static Object getCurrentUser() {
        return currentUser;
    }

    public static String getCurrentRole() {
        return currentRole;
    }

    public static boolean isLoggedIn() {
        return currentUser != null;
    }
}