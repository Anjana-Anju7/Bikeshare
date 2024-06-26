
package model;


public class StationsModel {
    private String stationName;
    private int stationId;
    private String latitude;
    private String longitude;
    private int numBikes;
    public StationsModel() {
    }

    public String getStationName() {
        return stationName;
    }

    public void setStationName(String stationName) {
        this.stationName = stationName;
    }

    public int getStationId() {
        return stationId;
    }

    public void setStationId(int stationId) {
        this.stationId = stationId;
    }

    public String getLatitude() {
        return latitude;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public int getNumBikes() {
        return numBikes;
    }

    public void setNumBikes(int numBikes) {
        this.numBikes = numBikes;
    }
    
    
    
}
