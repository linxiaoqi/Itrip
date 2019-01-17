package cn.itrip.service.ItripTradeEnds;


import cn.itrip.beans.pojo.ItripTradeEnds;
import cn.itrip.dao.ItripTradeEnds.ItripTradeEndsMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ItripTradeEndsServiceImpl implements  ItripTradeEndsService{

   @Resource
   private ItripTradeEndsMapper tradeEndsMapper;


    @Override
    public Integer itriptxModifyItripTradeEnds(Map<String, Object> param) throws Exception {
        return tradeEndsMapper.itriptxModifyItripTradeEnds(param);
    }

    @Override
    public List<ItripTradeEnds> getItripTradeEndsListByMap(Map<String, Object> param) throws Exception {
        return tradeEndsMapper.getItripTradeEndsListByMap(param);
    }
}
