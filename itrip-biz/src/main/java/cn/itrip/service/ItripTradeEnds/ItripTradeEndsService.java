package cn.itrip.service.ItripTradeEnds;

import cn.itrip.beans.pojo.ItripTradeEnds;

import java.util.List;
import java.util.Map;

public interface ItripTradeEndsService {

    public Integer itriptxModifyItripTradeEnds(Map<String,Object> param)throws Exception;

    public List<ItripTradeEnds> getItripTradeEndsListByMap(Map<String,Object> param)throws Exception;
}
