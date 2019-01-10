package cn.itrip.service.hotelroom;

import cn.itrip.beans.pojo.ItripHotelRoom;
import cn.itrip.beans.vo.hotelroom.ItripHotelRoomVO;

import java.util.List;

public interface ItripHotelRoomService {

    //查询房型列表
    public List<ItripHotelRoom> getqueryhotelroomListByMap(ItripHotelRoomVO roomVO)throws Exception;
}
