package cn.solr.entity;
import org.apache.solr.client.solrj.beans.Field;
import java.io.Serializable;

public class Hotel implements Serializable {

    @Field("id")
    private Long id;

    @Field("address")
    private String address;

    @Field
    private String hotelName;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }
}
