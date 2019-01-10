package cn.itrip.dao.hotelroom;

import cn.itrip.beans.pojo.ItripHotelRoom;
import cn.itrip.beans.vo.hotelroom.ItripHotelRoomVO;

import java.util.List;
import java.util.Map;

public interface ItripHotelRoomMapper {

    //查询房型列表
    public List<ItripHotelRoom> getqueryhotelroomListByMap(ItripHotelRoomVO roomVO)throws Exception;
}
