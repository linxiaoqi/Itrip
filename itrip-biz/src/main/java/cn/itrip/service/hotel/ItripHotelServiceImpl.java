package cn.itrip.service.hotel;

import cn.itrip.beans.pojo.ItripHotel;
import cn.itrip.beans.pojo.ItripImage;
import cn.itrip.dao.hotel.ItripHotelMapper;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ItripHotelServiceImpl implements ItripHotelService{

    @Resource
    private ItripHotelMapper itripHotelMapper;


    @Override
    public ItripHotel getItripHotelById() throws Exception {
        return itripHotelMapper.getItripHotelById();
    }

    @Override
    public ItripHotel getItripInfoById(Integer cityId) throws Exception {
        return itripHotelMapper.getItripInfoById(cityId);
    }

    @Override
    public List<ItripImage> getHotelImgById(Map<String, Object> param) throws Exception {
        return itripHotelMapper.getHotelImgById(param);
    }

}
