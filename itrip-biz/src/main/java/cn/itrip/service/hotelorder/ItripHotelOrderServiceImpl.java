package cn.itrip.service.hotelorder;

import cn.itrip.beans.pojo.ItripHotelOrder;
import cn.itrip.beans.pojo.ItripUserLinkUser;
import cn.itrip.beans.vo.order.ItripPersonalOrderRoomVO;
import cn.itrip.dao.hotelorder.ItripHotelOrderMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.List;
import java.util.Map;


@Service
public class ItripHotelOrderServiceImpl implements ItripHotelOrderService{

    @Resource
    private ItripHotelOrderMapper hotelOrderMapper;


    @Override
    public ItripPersonalOrderRoomVO getpersonalorderroominfo(Integer hotelId) throws Exception {
        return hotelOrderMapper.getpersonalorderroominfo(hotelId);
    }

    @Override
    public List<ItripHotelOrder> getProorderInfoByMap(Map<String, Object> param) throws Exception {
        return hotelOrderMapper.getProorderInfoByMap(param);
    }

    @Override
    public Integer getProorderInfo(Map<String, Object> param) throws Exception {
        return hotelOrderMapper.getProorderInfo(param);
    }

    @Override
    public PageInfo getpersonalorderlist(Map<String, Object> param, Integer pageNo, Integer pageSize) throws Exception {
        PageHelper.startPage(pageNo,pageSize);
        List<ItripHotelOrder> itripHotelOrders = hotelOrderMapper.getProorderInfoByMap(param);
        PageInfo pageInfo = new PageInfo(itripHotelOrders);
        return pageInfo;
    }

    /*@Override
    public Integer addhotelorder(ItripHotelOrder itripHotelOrder) throws Exception {
        return hotelOrderMapper.addhotelorder(itripHotelOrder);
    }*/

    @Override
    public List<ItripHotelOrder> getpersonalorderinfo(Map<String, Object> param) throws Exception {
        return hotelOrderMapper.getpersonalorderinfo(param);
    }

    @Override
    public BigDecimal getOrderPayAmount(int count, Long roomId) throws Exception {
        return hotelOrderMapper.getOrderPayAmount(count,roomId);
    }

    @Override
    public Map<String, String> itriptxAddItripHotelOrder(ItripHotelOrder itripHotelOrder, List<ItripUserLinkUser> itripOrderLinkUserList) throws Exception {
        return hotelOrderMapper.itriptxAddItripHotelOrder(itripHotelOrder,itripOrderLinkUserList);
    }

    @Override
    public ItripHotelOrder getItripHotelOrderById(Long id) throws Exception {
        return hotelOrderMapper.getItripHotelOrderById(id);
    }

    @Override
    public boolean flushOrderStatus(Integer type) throws Exception {
        return hotelOrderMapper.flushOrderStatus(type);
    }

    @Override
    public Integer itriptxModifyItripHotelOrder(ItripHotelOrder itripHotelOrder) throws Exception {
        return hotelOrderMapper.itriptxModifyItripHotelOrder(itripHotelOrder);
    }

    @Override
    public List<ItripHotelOrder> getItripHotelOrderListByMap(Map<String, Object> param) throws Exception {
        return hotelOrderMapper.getItripHotelOrderListByMap(param);
    }

}
