
package model;

public class RatesModel {
    private BikeModel bike;
    private int rate;

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
     * @return the rate
     */
    public int getRate() {
        return rate;
    }

    /**
     * @param rate the rate to set
     */
    public void setRate(int rate) {
        this.rate = rate;
    }
}
