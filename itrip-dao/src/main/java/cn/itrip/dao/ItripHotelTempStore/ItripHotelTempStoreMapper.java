package cn.itrip.dao.ItripHotelTempStore;

import cn.itrip.beans.vo.store.StoreVO;

import java.util.List;
import java.util.Map;


public interface ItripHotelTempStoreMapper {

    public List<StoreVO> queryRoomStore(Map<String,Object> param)throws Exception;

    public boolean validateRoomStore(Map<String,Object> param)throws Exception;

    public Integer updateRoomStore(Map<String, Object> param) throws Exception;

    public void flushStore(Map<String, Object> paramMap) throws Exception;

}
