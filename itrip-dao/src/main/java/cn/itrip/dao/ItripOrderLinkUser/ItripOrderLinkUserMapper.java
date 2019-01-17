package cn.itrip.dao.ItripOrderLinkUser;

import cn.itrip.beans.vo.order.ItripOrderLinkUserVo;

import java.util.List;
import java.util.Map;

public interface ItripOrderLinkUserMapper {

    public List<ItripOrderLinkUserVo> getItripOrderLinkUserListByMap(Map<String,Object> param)throws Exception;
}
