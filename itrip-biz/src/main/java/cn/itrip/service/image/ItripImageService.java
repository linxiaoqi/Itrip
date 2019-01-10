package cn.itrip.service.image;

import cn.itrip.beans.pojo.ItripImage;

import java.util.List;
import java.util.Map;

public interface ItripImageService {

    public List<ItripImage> getItripImageListByMap(Map<String, Object> param)throws Exception;
}
