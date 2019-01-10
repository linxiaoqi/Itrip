package cn.solr.dao;

import cn.itrip.common.Page;
import cn.solr.entity.ItripHotelVO;
import org.apache.solr.client.solrj.SolrQuery;

import java.util.List;

public interface HotelDao {

    public List<ItripHotelVO> queryHotelList(Integer cityId, Integer count);

    public Page searchHotelPage(SolrQuery solrQuery, Integer sart, Integer end)throws Exception;
}
