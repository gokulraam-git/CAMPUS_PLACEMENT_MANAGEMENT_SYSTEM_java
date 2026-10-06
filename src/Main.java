import menu.StudentMenu;
import menu.CompanyMenu;
import java.util.Scanner;
import menu.AdminMenu;
public class Main {

    public static void main(String[] args) {

        Scanner sc = new Scanner(System.in);

        while (true) {

            System.out.println(
                    "\n===================================="
            );

            System.out.println(
                    " CAMPUS PLACEMENT MANAGEMENT SYSTEM"
            );

            System.out.println(
                    "===================================="
            );

            System.out.println("1. Student");
            System.out.println("2. Company");
            System.out.println("3. Admin");
            System.out.println("4. Exit");

            System.out.print("Choice: ");

            String choice = sc.nextLine();

            switch (choice) {

                case "1":

                    new StudentMenu(sc).show();
                    break;

                case "2":

                    new CompanyMenu(sc).show();

                    break;

                case "3":

                    new AdminMenu(sc).show();

                    break;

                case "4":

                    System.out.println(
                            "Thank you."
                    );

                    sc.close();
                    return;

                default:

                    System.out.println(
                            "Invalid choice."
                    );
            }
        }
    }
}