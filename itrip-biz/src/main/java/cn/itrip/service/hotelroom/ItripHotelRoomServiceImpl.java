package cn.itrip.service.hotelroom;

import cn.itrip.beans.pojo.ItripHotelRoom;
import cn.itrip.beans.vo.hotelroom.ItripHotelRoomVO;
import cn.itrip.dao.hotelroom.ItripHotelRoomMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service
public class ItripHotelRoomServiceImpl implements ItripHotelRoomService{

   @Resource
   private ItripHotelRoomMapper hotelRoomMapper;


    @Override
    public List<ItripHotelRoom> getqueryhotelroomListByMap(ItripHotelRoomVO roomVO)throws Exception{
        return hotelRoomMapper.getqueryhotelroomListByMap(roomVO);
    }
}
