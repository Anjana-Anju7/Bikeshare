
package model;

import java.sql.Timestamp;


public class ComplaintsModel {
    private BikeModel bike;
    private String category;
    private String description;
    private Timestamp date_reported;
    private UserModel user;

    /**
     * @return the bike
     */
    public BikeModel getBike() {
        return bike;
    }

    /**
     * @param bike the bike to set
     */
    public void setBike(BikeModel bike) {
        this.bike = bike;
    }

    /**
     * @return the category
     */
    public String getCategory() {
        return category;
    }

    /**
     * @param category the category to set
     */
    public void setCategory(String category) {
        this.category = category;
    }

    /**
     * @return the description
     */
    public String getDescription() {
        return description;
    }

    /**
     * @param description the description to set
     */
    public void setDescription(String description) {
        this.description = description;
    }


    /**
     * @return the date_reported
     */
    public Timestamp getDate_reported() {
        return date_reported;
    }

    /**
     * @param date_reported the date_reported to set
     */
    public void setDate_reported(Timestamp date_reported) {
        this.date_reported = date_reported;
    }

    /**
     * @return the user
     */
    public UserModel getUser() {
        return user;
    }

    /**
     * @param user the user to set
     */
    public void setUser(UserModel user) {
        this.user = user;
    }
}
