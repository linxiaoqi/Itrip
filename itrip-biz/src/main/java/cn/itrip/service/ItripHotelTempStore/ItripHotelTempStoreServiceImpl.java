package cn.itrip.service.ItripHotelTempStore;


import cn.itrip.beans.vo.store.StoreVO;
import cn.itrip.dao.ItripHotelTempStore.ItripHotelTempStoreMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ItripHotelTempStoreServiceImpl implements ItripHotelTempStoreService{


    @Resource
    private ItripHotelTempStoreMapper hotelTempStoreMapper;

    @Override
    public List<StoreVO> queryRoomStore(Map<String, Object> param) throws Exception {
        return hotelTempStoreMapper.queryRoomStore(param);
    }

    @Override
    public boolean validateRoomStore(Map<String, Object> param) throws Exception {
        return hotelTempStoreMapper.validateRoomStore(param);
    }

    @Override
    public boolean updateRoomStore(Map<String, Object> param) throws Exception {
        return hotelTempStoreMapper.updateRoomStore(param);
    }
}
