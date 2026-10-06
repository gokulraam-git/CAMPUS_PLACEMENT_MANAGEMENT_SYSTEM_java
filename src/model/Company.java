package model;

public class Company {

    private int companyId;
    private String companyName;
    private String email;
    private String phone;
    private String location;
    private String website;
    private String password;

    public Company() {
    }

    public Company(String companyName, String email,
                   String phone, String location,
                   String website, String password) {

        this.companyName = companyName;
        this.email = email;
        this.phone = phone;
        this.location = location;
        this.website = website;
        this.password = password;
    }

    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getWebsite() {
        return website;
    }

    public void setWebsite(String website) {
        this.website = website;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}