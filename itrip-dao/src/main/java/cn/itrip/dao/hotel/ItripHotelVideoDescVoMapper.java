package cn.itrip.dao.hotel;

import cn.itrip.beans.pojo.ItripHotel;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ItripHotelVideoDescVoMapper {
    public ItripHotel getHotelVideoById(@Param("id") Integer id) throws Exception;

    public List<String> tradingAreaNameList(@Param("id") Integer id) throws Exception;

    public List<String> hotelFeatureList(@Param("id") Integer id) throws Exception;
}
