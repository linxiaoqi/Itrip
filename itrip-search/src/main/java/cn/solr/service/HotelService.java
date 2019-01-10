package cn.solr.service;

import cn.itrip.beans.vo.hotel.SearchHotelVO;
import cn.itrip.common.Page;
import cn.solr.entity.ItripHotelVO;

import java.util.List;

public interface HotelService {

    public List<ItripHotelVO> queryHotelList(Integer cityId, Integer count);

    public Page<ItripHotelVO> getItripSearchHotel(SearchHotelVO searchHotelVO, Integer pageNo, Integer pageSize) throws Exception;
}
