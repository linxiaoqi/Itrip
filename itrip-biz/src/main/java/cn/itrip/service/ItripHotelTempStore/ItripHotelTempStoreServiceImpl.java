package cn.itrip.service.ItripHotelTempStore;


import cn.itrip.beans.vo.store.StoreVO;
import cn.itrip.common.EmptyUtils;
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
        hotelTempStoreMapper.flushStore(param);
        return hotelTempStoreMapper.queryRoomStore(param);
    }

    @Override
    public boolean validateRoomStore(Map<String, Object> param) throws Exception {
        Integer count = (Integer) param.get("count");
        hotelTempStoreMapper.flushStore(param);
        List<StoreVO> storeVOList = hotelTempStoreMapper.queryRoomStore(param);
        if(EmptyUtils.isEmpty(storeVOList)){
            return false;
        }
        for (StoreVO vo : storeVOList) {
            if (vo.getStore() < count) {
                return false;
            }
        }
        return true;
    }

    @Override
    public boolean updateRoomStore(Map<String, Object> param) throws Exception {
        Integer flag = hotelTempStoreMapper.updateRoomStore(param);
        return flag == 0 ? false : true;
    }
}
