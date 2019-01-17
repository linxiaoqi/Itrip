package cn.itrip.service.ItripOrderLinkUser;

import cn.itrip.beans.vo.order.ItripOrderLinkUserVo;
import cn.itrip.dao.ItripOrderLinkUser.ItripOrderLinkUserMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class ItripOrderLinkUserServiceImpl implements ItripOrderLinkUserService{

   @Resource
   private ItripOrderLinkUserMapper orderLinkUserMapper;

    @Override
    public List<ItripOrderLinkUserVo> getItripOrderLinkUserListByMap(Map<String, Object> param) throws Exception {
        return orderLinkUserMapper.getItripOrderLinkUserListByMap(param);
    }
}
