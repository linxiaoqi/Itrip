package cn.solr.dao;

import cn.itrip.common.Constants;
import cn.itrip.common.EmptyUtils;
import cn.itrip.common.Page;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.apache.solr.client.solrj.impl.XMLResponseParser;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocumentList;

import java.io.IOException;
import java.util.List;

public class BaseDao<T> {
    private HttpSolrClient httpSolrClient = null;
    private QueryResponse queryResponse = null;

    public BaseDao(String url) {
        //初始化HttpSolrClient
        httpSolrClient = new HttpSolrClient(url);
        // 设置响应解析器
        httpSolrClient.setParser(new XMLResponseParser());
        // 建立连接的最长时间
        httpSolrClient.setConnectionTimeout(500);
    }


    public List<T> queryList(SolrQuery query,Integer count, Class clazz) {
        List<T> list = null;
        try {
            query.setStart(0);
            query.setRows(EmptyUtils.isEmpty(count)?Constants.DEFAULT_PAGE_SIZE:count);
            queryResponse = httpSolrClient.query(query);
            list = queryResponse.getBeans(clazz);
        } catch (SolrServerException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return list;
    }

    public Page<T> queryList(SolrQuery query, Integer sizeNo, Integer count, Class clazz) {
        System.out.println("BaseDao>>>"+query+">>"+sizeNo+">>>>"+count+">>>>"+clazz);
        List<T> list = null;
        Page<T> page=null;
        try {
            Integer rows = EmptyUtils.isEmpty(count) ? Constants.DEFAULT_PAGE_SIZE : count;
            Integer currPage = EmptyUtils.isEmpty(sizeNo) ? Constants.DEFAULT_PAGE_NO-1 : count;
            Integer start = currPage*rows;
            query.setStart(start);
            query.setRows(rows);
            System.out.println(">>query>>>"+query);
            queryResponse = httpSolrClient.query(query);
            //封装了多条数据的document集合
            SolrDocumentList docs = queryResponse.getResults();
            //把结果封装成一个page对象
            page = new Page(currPage + 1, query.getRows(),
                    new Long(docs.getNumFound()).intValue());
            list = queryResponse.getBeans(clazz);
            System.out.println("list>>>>"+list);
            page.setRows(list);
            System.out.println("pageInfo>>>>"+page);
        } catch (SolrServerException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return page;
    }
}
