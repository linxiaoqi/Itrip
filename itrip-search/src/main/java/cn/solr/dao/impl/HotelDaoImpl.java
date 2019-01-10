package cn.solr.dao.impl;

import cn.itrip.beans.vo.hotel.SearchHotelVO;
import cn.itrip.common.Page;
import cn.solr.dao.BaseDao;
import cn.solr.dao.HotelDao;
import cn.solr.entity.ItripHotelVO;
import org.apache.solr.client.solrj.SolrQuery;

import java.util.List;

public class HotelDaoImpl implements HotelDao {
    public static String url = "http://localhost:8080/solr/hotel/";

    private BaseDao<ItripHotelVO> hotelBaseDao = new BaseDao<ItripHotelVO>(url);
    private BaseDao<SearchHotelVO> pageDao=new BaseDao<SearchHotelVO>(url);


    public List<ItripHotelVO> queryHotelList(Integer cityId, Integer count) {
        SolrQuery solrQuery=new SolrQuery("cityId:"+cityId);
        System.out.println("method queryHotelList============="+cityId);
        List<ItripHotelVO> list = hotelBaseDao.queryList(solrQuery,count, ItripHotelVO.class);
        System.out.println("list>>>>>"+list);
        return list;
    }

    public Page searchHotelPage(SolrQuery solrQuery, Integer sart, Integer count){
        Page<SearchHotelVO> page=new Page<>();
        Page<SearchHotelVO> pageInfo=pageDao.queryList(solrQuery,sart,count,SearchHotelVO.class);
        page.setBeginPos(pageInfo.getBeginPos());
        page.setCurPage(pageInfo.getCurPage());
        page.setTotal(pageInfo.getTotal());
        page.setPageSize(pageInfo.getPageSize());
        page.setPageCount(pageInfo.getPageCount());
        System.out.println(">>>"+page.getTotal()+">>>"+page.getBeginPos()+">>>"+page.getPageSize()+">>"+page.getCurPage()+">>"+page.getPageCount()+">>>"+page.getRows());
        return page;
    }
}