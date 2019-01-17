package cn.itrip.service.hotelroom;

import cn.itrip.beans.pojo.ItripHotelRoom;
import cn.itrip.beans.vo.hotelroom.ItripHotelRoomVO;
import cn.itrip.dao.hotelroom.ItripHotelRoomMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Service
public class ItripHotelRoomServiceImpl implements ItripHotelRoomService{

   @Resource
   private ItripHotelRoomMapper hotelRoomMapper;


    @Override
    public List<ItripHotelRoomVO> getqueryhotelroomListByMap(Map<String, Object> param) throws Exception {
        return hotelRoomMapper.getqueryhotelroomListByMap(param);
    }

    @Override
    public ItripHotelRoom getItripHotelRoomById(Long id) throws Exception {
        return hotelRoomMapper.getItripHotelRoomById(id);
    }
}
