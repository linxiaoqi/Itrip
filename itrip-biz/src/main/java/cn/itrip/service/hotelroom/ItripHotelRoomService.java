package cn.itrip.service.hotelroom;

import cn.itrip.beans.pojo.ItripHotelRoom;
import cn.itrip.beans.vo.hotelroom.ItripHotelRoomVO;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ItripHotelRoomService {

    //查询房型列表
    public List<ItripHotelRoomVO> getqueryhotelroomListByMap(Map<String,Object> param)throws Exception;

    public ItripHotelRoom getItripHotelRoomById(Long id)throws Exception;
}
