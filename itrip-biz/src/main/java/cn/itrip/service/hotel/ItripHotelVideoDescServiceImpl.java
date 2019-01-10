package cn.itrip.service.hotel;

import cn.itrip.beans.pojo.ItripHotel;
import cn.itrip.dao.hotel.ItripHotelVideoDescVoMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ItripHotelVideoDescServiceImpl implements ItripHotelVideoDescService{

    @Resource
    private ItripHotelVideoDescVoMapper hotelVideoDescVoMapper;

    @Override
    public ItripHotel getHotelVideoById(Integer id) throws Exception {
        return hotelVideoDescVoMapper.getHotelVideoById(id);
    }

    @Override
    public List<String> tradingAreaNameList(Integer id) throws Exception {
        return hotelVideoDescVoMapper.tradingAreaNameList(id);
    }

    @Override
    public List<String> hotelFeatureList(Integer id) throws Exception {
        return hotelVideoDescVoMapper.hotelFeatureList(id);
    }
}
