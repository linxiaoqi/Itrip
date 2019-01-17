package cn.itrip.service.hotel;

import cn.itrip.beans.pojo.ItripHotel;
import cn.itrip.beans.pojo.ItripImage;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ItripHotelService {
    public ItripHotel getItripHotelById()throws Exception;

    public ItripHotel getItripInfoById(@Param("cityId") Integer cityId)throws Exception;

    //查询酒店图片
    public List<ItripImage> getHotelImgById(Map<String, Object> param) throws Exception;

    public ItripHotel getItripHotelByIds(@Param("id") Long id)throws Exception;
}
