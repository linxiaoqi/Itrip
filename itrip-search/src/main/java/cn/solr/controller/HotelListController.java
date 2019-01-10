package cn.solr.controller;

import cn.itrip.beans.dtos.Dto;
import cn.itrip.beans.vo.hotel.SearchHotCityVO;
import cn.itrip.beans.vo.hotel.SearchHotelVO;
import cn.itrip.common.DtoUtil;
import cn.itrip.common.EmptyUtils;
import cn.itrip.common.Page;
import cn.solr.entity.ItripHotelVO;
import cn.solr.service.HotelService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Api(value = "API", basePath = "/http://api.itrap.com/api")
@RequestMapping(value = "/api/hotellist")

public class HotelListController {

    private Logger logger = Logger.getLogger(HotelListController.class);

    @Resource
    private HotelService hotelService;


    /**
     * 根据热门城市查询6个酒店
     *
     * @return
     * @throws Exception
     */
    @ApiOperation(value = "根据热门城市查询6个酒店接口", httpMethod = "POST",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "根据热门城市查询6个酒店")
    @RequestMapping(value = "/searchItripHotelListByHotCity", method = RequestMethod.POST)
    @ResponseBody
    public Dto<ItripHotelVO> queryUserLinkUser(@RequestBody SearchHotCityVO vo) {
        if(EmptyUtils.isEmpty(vo)||EmptyUtils.isEmpty(vo.getCityId())){
            return DtoUtil.returnFail("根据热门城市查询6个酒店查询失败","20004");
        }
        Map<String,Object> param=new HashMap<>();
        param.put("cityId",vo.getCityId());
        System.out.println(vo.getCityId()+">>>>>>>>>>>>>"+vo.getCount());
        List<ItripHotelVO> list=hotelService.queryHotelList(vo.getCityId(),vo.getCount());
        System.out.println("llist>>>>" + list.size());
        System.out.println("method"+list);
        return DtoUtil.returnSuccess("据热门城市查询6个酒店查询成功！",list);
    }


    /**
     * 搜索酒店（分页）
     *
     * @return
     * @throws Exception
     */
    @ApiOperation(value = "搜索酒店（分页）接口", httpMethod = "POST",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "搜索酒店（分页）")
    @RequestMapping(value = "/searchItripHotelPage", method = RequestMethod.POST)
    @ResponseBody
    public Dto<Page<ItripHotelVO>> queryHotelPage(@RequestBody SearchHotelVO vo) {
        System.out.println("SearchHotelVO>>>>>"+vo.getPageNo()+">>>>"+vo.getPageSize());
        Page page=new Page<SearchHotelVO>();
        if(EmptyUtils.isEmpty(vo)||EmptyUtils.isEmpty(vo.getDestination())){
            return DtoUtil.returnFail("搜索酒店（分页）失败","20004");
        }
        System.out.println(vo.getHotelLevel()+">>>>>>>>>>>>>"+vo.getDestination());
        try {
            page=hotelService.getItripSearchHotel(vo,vo.getPageNo(),vo.getPageSize());
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("method>>>"+page.getBeginPos()+">>>>>"+page.getTotal());
        System.out.println("method>>>"+page.getRows()+">>>"+page.getCurPage());
        return DtoUtil.returnSuccess("搜索酒店（分页）成功！",page);
    }
}
