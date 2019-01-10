package cn.itrip.controller;

import cn.itrip.beans.dtos.Dto;
import cn.itrip.beans.pojo.ItripHotelOrder;
import cn.itrip.beans.vo.order.ItripPersonalHotelOrderVO;
import cn.itrip.beans.vo.order.ItripPersonalOrderRoomVO;
import cn.itrip.beans.vo.order.ItripSearchOrderVO;
import cn.itrip.beans.vo.order.PreAddOrderVO;
import cn.itrip.common.DtoUtil;
import cn.itrip.common.EmptyUtils;
import cn.itrip.common.Page;
import cn.itrip.common.WeekUtils;
import cn.itrip.service.hotelorder.ItripHotelOrderService;
import com.github.pagehelper.PageInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@Api(value = "API", basePath = "/http://api.itrap.com/api")
@RequestMapping(value = "/api/hotelorder")
public class HotelOrderController {

    private Logger logger = Logger.getLogger(HotelOrderController.class);

    @Resource
    private ItripHotelOrderService orderService;


    /****
     * 查询个人订单房型信息
     * @param hotelId
     * @return
     * @throws Exception
     */
    @ApiOperation(value = "查询个人订单房型信息", httpMethod = "GET",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "查询个人订单房型信息" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码：</p>" +
            "<p>10201 : hotelId不能为空 </p>" +
            "<p>10202 : 系统异常,获取失败</p>")
    @RequestMapping(value = "/getpersonalorderroominfo/{hotelId}", produces = "application/json", method = RequestMethod.GET)
    @ResponseBody
    public Dto<ItripPersonalOrderRoomVO> queryHotCity(@PathVariable Integer hotelId) {
        ItripPersonalOrderRoomVO roomVO=new ItripPersonalOrderRoomVO();
        try {
            if (EmptyUtils.isNotEmpty(hotelId)){
                roomVO = orderService.getpersonalorderroominfo(hotelId);
                roomVO.setCheckInWeek(WeekUtils.getWeekOfDate(roomVO.getCheckInDate()));
                roomVO.setCheckOutWeek(WeekUtils.getWeekOfDate(roomVO.getCheckOutDate()));
            }else {
                DtoUtil.returnFail("hotelId不能为空！","10202");
            }
        }catch (Exception e){
            e.getStackTrace();
            DtoUtil.returnFail("系统错误！","10201");
        }
        return DtoUtil.returnSuccess("获取个人订单房型信息成功！",roomVO);
    }


    /****
     * 预生成订单信息
     * @return
     * @throws Exception
     */
    @ApiOperation(value = "预生成订单信息", httpMethod = "POST",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "预生成订单信息" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码：</p>" +
            "<p>100401 : 预生成订单信息失败 </p>" +
            "<p>100000 : token失效，请重登录</p>")
    @RequestMapping(value = "/getpreorderinfo", method = RequestMethod.POST)
    @ResponseBody
    public Dto<PreAddOrderVO> getpreorderinfo(@RequestBody PreAddOrderVO preAddOrderVO, HttpServletRequest request) {
        List<PreAddOrderVO> preAddOrderVOS=new ArrayList<>();
        List<ItripHotelOrder> hotelOrders=null;
        PreAddOrderVO vo =new PreAddOrderVO();
        try {
            Map param =new HashMap();
            param.put("checkInDate",preAddOrderVO.getCheckInDate());
            param.put("checkOutDate",preAddOrderVO.getCheckOutDate());
            param.put("count",preAddOrderVO.getCount());
            param.put("hotelId",preAddOrderVO.getHotelId());
            param.put("roomId",preAddOrderVO.getRoomId());
            hotelOrders=orderService.getProorderInfoByMap(param);
            if (EmptyUtils.isNotEmpty(hotelOrders)){
                for (ItripHotelOrder order: hotelOrders){
                    BeanUtils.copyProperties(order,vo);
                    preAddOrderVOS.add(vo);
                }
            }
            Map params = new HashMap();
            param.put("hotelId",preAddOrderVO.getHotelId());
            param.put("roomId",preAddOrderVO.getRoomId());
            Integer vm=orderService.getProorderInfo(param);
            if (EmptyUtils.isNotEmpty(vm)){
                for (PreAddOrderVO vos:preAddOrderVOS){
                    vo.setStore(vm);
                }
            }
        }catch (Exception e){
            e.getStackTrace();
            DtoUtil.returnFail("系统错误！","100201");
        }
        return DtoUtil.returnSuccess("获取成功！",vo);
    }


    /****
     * 查询个人酒店订单列表
     * @return
     * @throws Exception
     */
    /*@ApiOperation(value = "查询个人酒店订单列表", httpMethod = "POST",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "查询个人酒店订单列表" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码：</p>" +
            "<p>100401 : 查询个人酒店订单列表失败 </p>" +
            "<p>100000 : token失效，请重登录</p>")
    @RequestMapping(value = "/getpersonalorderlist", method = RequestMethod.POST)
    @ResponseBody
    public Dto<ItripPersonalHotelOrderVO>getpreorderinfo(@RequestBody ItripSearchOrderVO searchOrderVO, HttpServletRequest request) {
        List<ItripPersonalHotelOrderVO> personalHotelOrderVOS = new ArrayList<>();
        List<ItripHotelOrder> hotelOrders =new ArrayList<>();
        Page page =new Page();
        try {
            Map param = new HashMap();
            if (searchOrderVO.getOrderStatus()!=-1){
                param.put("orderStatus", searchOrderVO.getOrderStatus());
            }
            if (searchOrderVO.getOrderType()!=-1){
                param.put("orderType", searchOrderVO.getOrderType());
            }
            PageInfo pageInfo = orderService.getpersonalorderlist(param,searchOrderVO.getPageNo(),searchOrderVO.getPageSize());
            hotelOrders = pageInfo.getList();
            if (EmptyUtils.isNotEmpty(hotelOrders)) {
                for (ItripHotelOrder order : hotelOrders){
                    ItripPersonalHotelOrderVO personalHotelOrderVO =new ItripPersonalHotelOrderVO();
                    BeanUtils.copyProperties(order,personalHotelOrderVO);
                    personalHotelOrderVOS.add(personalHotelOrderVO);
                }
            }
            page.setBeginPos(1);
            page.setCurPage(pageInfo.getPageNum());
            page.setTotal((int) pageInfo.getTotal());
            page.setPageSize(pageInfo.getPageSize());
            page.setPageCount(pageInfo.getSize());
            page.setRows(personalHotelOrderVOS);
        } catch (Exception e) {
            DtoUtil.returnFail("系统异常", "10205");
            e.printStackTrace();
        }
        return DtoUtil.returnSuccess("获取个人酒店订单列表成功",page);
    }*/


    /****
     * 获取个人订单信息
     * @return
     * @throws Exception
     */
    @ApiOperation(value = "获取个人订单信息", httpMethod = "Get",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "获取个人订单信息" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码：</p>" +
            "<p>100401 : 获取个人订单信息失败 </p>" +
            "<p>100000 : token失效，请重登录</p>")
    @RequestMapping(value = "/getpersonalorderinfo/{orderId}", method = RequestMethod.GET)
    @ResponseBody
    public Dto<ItripPersonalHotelOrderVO> getpersonalorderinfo(@PathVariable Integer orderId) {
        List<ItripHotelOrder> hotelOrders=new ArrayList<>();
        List<ItripPersonalHotelOrderVO> personalHotelOrderVOS =new ArrayList<>();
        ItripPersonalHotelOrderVO itripPersonalHotelOrderVO =new ItripPersonalHotelOrderVO();
        try {
            Map param = new HashMap();
            param.put("orderId",orderId);
            hotelOrders = orderService.getpersonalorderinfo(param);
            if (EmptyUtils.isNotEmpty(hotelOrders)){
                for (ItripHotelOrder hotelOrder : hotelOrders){
                    itripPersonalHotelOrderVO.setId(hotelOrder.getId());
                    itripPersonalHotelOrderVO.setBookType(hotelOrder.getBookType());
                    itripPersonalHotelOrderVO.setCreationDate(hotelOrder.getCreationDate());
                    itripPersonalHotelOrderVO.setNoticePhone(hotelOrder.getNoticePhone());
                    itripPersonalHotelOrderVO.setOrderNo(hotelOrder.getOrderNo());
                    itripPersonalHotelOrderVO.setOrderStatus(hotelOrder.getOrderStatus());
                    itripPersonalHotelOrderVO.setPayAmount(hotelOrder.getPayAmount());
                    itripPersonalHotelOrderVO.setPayType(hotelOrder.getPayType());
                    itripPersonalHotelOrderVO.setProcessNode(hotelOrder.getHotelName());
                    itripPersonalHotelOrderVO.setRoomPayType(hotelOrder.getPayType());
                }
            }
            if (itripPersonalHotelOrderVO.getOrderStatus()==0){
                itripPersonalHotelOrderVO.setProcessNode("2");
                itripPersonalHotelOrderVO.setOrderProcess("待支付");
            }else if (itripPersonalHotelOrderVO.getOrderStatus()==1){
                itripPersonalHotelOrderVO.setProcessNode("3");
                itripPersonalHotelOrderVO.setOrderProcess("订单已取消");
            }else if (itripPersonalHotelOrderVO.getOrderStatus()==2){
                itripPersonalHotelOrderVO.setProcessNode("3");
                itripPersonalHotelOrderVO.setOrderProcess("支付成功！");
            }else if (itripPersonalHotelOrderVO.getOrderStatus()==3){
                itripPersonalHotelOrderVO.setProcessNode("4");
                itripPersonalHotelOrderVO.setOrderProcess("已消费！");
            }else if (itripPersonalHotelOrderVO.getOrderStatus()==4) {
                itripPersonalHotelOrderVO.setProcessNode("5");
                itripPersonalHotelOrderVO.setOrderProcess("订单点评");
            }
            DtoUtil.returnSuccess("获取个人订单信息成功！",itripPersonalHotelOrderVO);
        }catch (Exception e){
            e.getStackTrace();
            DtoUtil.returnFail("系统错误！","100201");
        }
        return DtoUtil.returnSuccess("获取个人订单信息成功！",itripPersonalHotelOrderVO);
    }



}
