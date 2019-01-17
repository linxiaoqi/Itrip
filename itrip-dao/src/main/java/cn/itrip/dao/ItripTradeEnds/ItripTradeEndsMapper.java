package cn.itrip.dao.ItripTradeEnds;

import cn.itrip.beans.pojo.ItripTradeEnds;

import java.util.List;
import java.util.Map;

public interface ItripTradeEndsMapper {

    public Integer itriptxModifyItripTradeEnds(Map<String,Object> param)throws Exception;

    public List<ItripTradeEnds> getItripTradeEndsListByMap(Map<String,Object> param)throws Exception;
}
