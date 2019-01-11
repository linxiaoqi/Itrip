package cn.itrip.service.hotelorder;

import cn.itrip.beans.pojo.ItripHotelOrder;
import cn.itrip.beans.vo.order.ItripPersonalOrderRoomVO;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ItripHotelOrderService {

    //查询个人订单房型信息
    public ItripPersonalOrderRoomVO getpersonalorderroominfo(@Param("hotelId") Integer hotelId) throws Exception;

    //预生成订单信息
    public List<ItripHotelOrder> getProorderInfoByMap(Map<String, Object> param) throws Exception;

    public Integer getProorderInfo(Map<String, Object> param)throws Exception;

    //查询个人酒店订单列表
    public PageInfo getpersonalorderlist(Map<String, Object> param, Integer pageNo, Integer pageSize) throws Exception;

    //添加订单
    public Integer addhotelorder(ItripHotelOrder itripHotelOrder) throws Exception;

    //获取个人订单信息
    public List<ItripHotelOrder> getpersonalorderinfo(Map<String, Object> param) throws Exception;
}
