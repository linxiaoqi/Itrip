package cn.itrip.controller;

import cn.itrip.beans.dtos.Dto;
import cn.itrip.beans.pojo.ItripAreaDic;
import cn.itrip.beans.pojo.ItripHotel;
import cn.itrip.beans.pojo.ItripImage;
import cn.itrip.beans.pojo.ItripLabelDic;
import cn.itrip.beans.vo.ItripAreaDicVO;
import cn.itrip.beans.vo.ItripImageVO;
import cn.itrip.beans.vo.ItripLabelDicVO;
import cn.itrip.beans.vo.hotel.HotelVideoDescVO;
import cn.itrip.beans.vo.hotel.ItripSearchDetailsHotelVO;
import cn.itrip.beans.vo.hotel.ItripSearchFacilitiesHotelVO;
import cn.itrip.beans.vo.hotel.ItripSearchPolicyHotelVO;
import cn.itrip.common.DtoUtil;
import cn.itrip.common.EmptyUtils;
import cn.itrip.service.areadic.ItripAreaDicService;
import cn.itrip.service.comment.ItripCommentService;
import cn.itrip.service.hotel.ItripHotelService;
import cn.itrip.service.hotel.ItripHotelVideoDescService;
import cn.itrip.service.labeldic.ItripLabelDicService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.log4j.Logger;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 酒店信息Controller
 * <p/>
 * 包括API接口：
 * 1、根据酒店id查询酒店拓展属性
 * 2、根据酒店id查询酒店介绍，酒店政策，酒店设施
 * 3、根据酒店id查询酒店特色属性列表
 * 4、根据type 和target id 查询酒店图片
 * 5、查询热门城市
 * 6、查询热门商圈列表（搜索-酒店列表）
 * 7、查询数据字典特色父级节点列表（搜索-酒店列表）
 * 8、根据酒店id查询酒店特色、商圈、酒店名称（视频文字描述）
 * <p/>
 * 注：错误码（100201 ——100300）
 * <p/>
 * Created by hanlu on 2017/5/9.
 */

@Controller
@Api(value = "API", basePath = "/http://api.itrap.com/api")
@RequestMapping(value = "/api/hotel")
public class HotelController {

    private Logger logger = Logger.getLogger(HotelController.class);

    @Resource
    private ItripAreaDicService itripAreaDicService;

    @Resource
    private ItripLabelDicService itripLabelDicService;

    @Resource
    private ItripHotelService itripHotelService;

    @Resource
    private ItripHotelVideoDescService hotelVideoDescService;

    @Resource
    private ItripCommentService commentService;

    /****
     * 查询热门城市的接口
     *
     * @param type
     * @return
     * @throws Exception
     */
    @ApiOperation(value = "查询热门城市", httpMethod = "GET",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "查询国内、国外的热门城市(1:国内 2:国外)" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码：</p>" +
            "<p>10201 : hotelId不能为空 </p>" +
            "<p>10202 : 系统异常,获取失败</p>")
    @RequestMapping(value = "/queryhotcity/{type}", produces = "application/json", method = RequestMethod.GET)
    @ResponseBody
    public Dto<ItripAreaDicVO> queryHotCity(@PathVariable Integer type) {
        List<ItripAreaDic> itripAreaDics = null;
        List<ItripAreaDicVO> itripAreaDicVOs = null;
        try {
            if (EmptyUtils.isNotEmpty(type)) {
                Map param = new HashMap();
                param.put("isHot", 1);
                param.put("isChina", type);
                itripAreaDics = itripAreaDicService.getItripAreaDicListByMap(param);
                if (EmptyUtils.isNotEmpty(itripAreaDics)) {
                    itripAreaDicVOs = new ArrayList();
                    for (ItripAreaDic dic : itripAreaDics) {
                        ItripAreaDicVO vo = new ItripAreaDicVO();
                        BeanUtils.copyProperties(dic, vo);
                        itripAreaDicVOs.add(vo);
                    }
                }

            } else {
                DtoUtil.returnFail("type不能为空", "10201");
            }
        } catch (Exception e) {
            DtoUtil.returnFail("系统异常", "10202");
            e.printStackTrace();
        }
        return DtoUtil.returnDataSuccess(itripAreaDicVOs);
    }


    /***
     * 查询酒店特色列表
     *
     * @return
     * @throws Exception
     */
    @ApiOperation(value = "查询酒店特色列表", httpMethod = "GET",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "获取酒店特色(用于查询页列表)" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码: </p>" +
            "<p>10205: 系统异常,获取失败</p>")
    @RequestMapping(value = "/queryhotelfeature", produces = "application/json", method = RequestMethod.GET)
    @ResponseBody
    public Dto<ItripLabelDicVO> queryHotelFeature() {
        List<ItripLabelDic> itripLabelDics = null;
        List<ItripLabelDicVO> itripAreaDicVOs = null;
        try {
            Map param = new HashMap();
            param.put("parentId", 16);
            itripLabelDics = itripLabelDicService.getItripLabelDicListByMap(param);
            if (EmptyUtils.isNotEmpty(itripLabelDics)) {
                itripAreaDicVOs = new ArrayList();
                for (ItripLabelDic dic : itripLabelDics) {
                    ItripLabelDicVO vo = new ItripLabelDicVO();
                    BeanUtils.copyProperties(dic, vo);
                    itripAreaDicVOs.add(vo);
                }
            }

        } catch (Exception e) {
            DtoUtil.returnFail("系统异常", "10205");
            e.printStackTrace();
        }
        return DtoUtil.returnDataSuccess(itripAreaDicVOs);
    }


    /***
     * 查看城市商圈
     *
     * @return
     * @throws Exception
     */
    @ApiOperation(value = "查询城市商圈", httpMethod = "GET",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "获取城市商圈" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码: </p>" +
            "<p>10205: 系统异常,获取失败</p>")
    @RequestMapping(value = "/querytradearea/{type}", produces = "application/json", method = RequestMethod.GET)
    @ResponseBody
    public Dto<ItripAreaDic> queryTradeArea(@PathVariable Integer type) {
        List<ItripAreaDic> itripAreaDics = null;
        List<ItripAreaDicVO> itripAreaDicVOs = new ArrayList<>();
        try {
            if (EmptyUtils.isNotEmpty(type)){
                Map param =new HashMap();
                /*param.put("isHot",1);
                param.put("isTradingArea",type);*/
                param.put("parent",2);
                param.put("isTradingArea",1);
                param.put("isChaina",type);
                itripAreaDics=itripAreaDicService.getItripAreaDicListByMap(param);
                if (EmptyUtils.isNotEmpty(itripAreaDics)){
                    itripAreaDicVOs=new ArrayList<>();
                    for (ItripAreaDic dic: itripAreaDics){
                        ItripAreaDicVO vo =new ItripAreaDicVO();
                        BeanUtils.copyProperties(dic,vo);
                        itripAreaDicVOs.add(vo);
                    }
                }
            }else {
                DtoUtil.returnFail("type不能为空", "10201");
            }
        }catch (Exception e){
            DtoUtil.returnFail("系统异常", "10202");
            e.printStackTrace();
        }
        return DtoUtil.returnDataSuccess(itripAreaDicVOs);
    }


    /***
     * 查看酒店视频信息
     *
     * @return
     * @throws Exception
     */
    @ApiOperation(value = "查询酒店视频信息", httpMethod = "GET",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "获取酒店视频信息" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码: </p>" +
            "<p>10205: 系统异常,获取失败</p>")
    @RequestMapping(value = "/getvideodesc/{cityId}", produces = "application/json", method = RequestMethod.GET)
    @ResponseBody
    public Dto<HotelVideoDescVO> getvideodesc(@PathVariable Integer cityId) {
       HotelVideoDescVO hotelVideoDescVO = new HotelVideoDescVO();
       ItripHotel itripHotel=new ItripHotel();
        try {
            if (EmptyUtils.isNotEmpty(cityId)){
                itripHotel= hotelVideoDescService.getHotelVideoById(cityId);
                List<String> hotelFeatureList=hotelVideoDescService.hotelFeatureList(cityId);
                List<String> tradingAreaNameList=hotelVideoDescService.tradingAreaNameList(cityId);
                hotelVideoDescVO.setHotelName(itripHotel.getHotelName());
                hotelVideoDescVO.setTradingAreaNameList(tradingAreaNameList);
                hotelVideoDescVO.setHotelFeatureList(hotelFeatureList);
                return DtoUtil.returnSuccess("获取酒店视频文字描述成功成功！",hotelVideoDescVO);
            }else {
                DtoUtil.returnFail("type不能为空", "10201");
            }
        }catch (Exception e){
            DtoUtil.returnFail("系统异常", "10202");
            e.printStackTrace();
        }
        return DtoUtil.returnDataSuccess(hotelVideoDescVO);
    }



    /***
     * 查看酒店描述与特色
     *
     * @return
     * @throws Exception
     */
    @ApiOperation(value = "查询酒店描述与特色", httpMethod = "GET",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "获取酒店描述与特色等信息" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码: </p>" +
            "<p>10205: 系统异常,获取失败</p>")
    @RequestMapping(value = "/queryhoteldetails/{cityId}", produces = "application/json", method = RequestMethod.GET)
    @ResponseBody
    public Dto<ItripSearchDetailsHotelVO> queryHotelDetails(@PathVariable Integer cityId, HttpServletRequest request) {
        ItripHotel hotel=null;
        try {
            ItripSearchDetailsHotelVO vo=new ItripSearchDetailsHotelVO();
            if (EmptyUtils.isNotEmpty(cityId)){
                hotel= itripHotelService.getItripHotelById();
                System.out.println(hotel.getDetails()+">>>>");
                List<ItripSearchDetailsHotelVO> itripLabelDicVOS=itripLabelDicService.getItripHotelDatail(cityId);
                System.out.println(itripLabelDicVOS.size());
                vo.setName("酒店介绍");
                vo.setDescription(hotel.getDetails());
                itripLabelDicVOS.add(vo);
                logger.debug("查询酒店描述和特色成功！");
                return DtoUtil.returnSuccess("获取酒店信息成功！",itripLabelDicVOS);
            }
        }catch (Exception e){
            e.printStackTrace();
            return DtoUtil.returnFail("获取酒店信息失败", "100401");
        }
        return DtoUtil.returnDataSuccess("获取酒店描述和特色成功！");
    }


    /***
     * 查看酒店设施
     *
     * @return
     * @throws Exception
     */
    @ApiOperation(value = "查询酒店设施", httpMethod = "GET",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "获取酒店设施" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码: </p>" +
            "<p>10205: 系统异常,获取失败</p>")
    @RequestMapping(value = "/queryhotelfacilities/{cityId}", produces = "application/json", method = RequestMethod.GET)
    @ResponseBody
    public Dto<ItripSearchFacilitiesHotelVO> queryHotelFacilities(@PathVariable Integer cityId,HttpServletRequest request) {
        ItripSearchFacilitiesHotelVO vo=new ItripSearchFacilitiesHotelVO();
        ItripHotel itripHotel=null;
        try {
            if (EmptyUtils.isNotEmpty(cityId)){
                itripHotel=itripHotelService.getItripInfoById(cityId);
                logger.debug(itripHotel);
                vo.setFacilities(itripHotel.getFacilities());
                System.out.println("获取信息成功！"+vo);
                return DtoUtil.returnSuccess("获取酒店设施信息成功！！",vo.getFacilities());
            }else {
                DtoUtil.returnFail("cityId不能为空", "10201");
            }
        }catch (Exception e){
            e.printStackTrace();
            return DtoUtil.returnFail("获取酒店设施失败", "100401");
        }
        return DtoUtil.returnDataSuccess("获取酒店设施成功！");
    }


    /***
     * 查看酒店政策
     *
     * @return
     * @throws Exception
     */
    @ApiOperation(value = "查询酒店政策", httpMethod = "GET",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "获取酒店政策" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码: </p>" +
            "<p>10205: 系统异常,获取失败</p>")
    @RequestMapping(value = "/queryhotelpolicy/{cityId}", produces = "application/json", method = RequestMethod.GET)
    @ResponseBody
    public Dto<ItripSearchPolicyHotelVO> queryhotelpolicy(@PathVariable Integer cityId, HttpServletRequest request) {
        ItripSearchPolicyHotelVO vo=new ItripSearchPolicyHotelVO();
        ItripHotel itripHotel=null;
        try {
            if (EmptyUtils.isNotEmpty(cityId)){
                itripHotel=itripHotelService.getItripInfoById(cityId);
                logger.debug(itripHotel);
                vo.setHotelPolicy(itripHotel.getHotelPolicy());
                System.out.println("获取酒店政策信息成功！"+vo);
                return DtoUtil.returnSuccess("获取酒店政策信息成功！！",vo.getHotelPolicy());
            }else {
                DtoUtil.returnFail("cityId不能为空", "10201");
            }
        }catch (Exception e){
            e.printStackTrace();
            return DtoUtil.returnFail("获取酒店政策失败", "100401");
        }
        return DtoUtil.returnDataSuccess("获取酒店政策成功！");
    }


    /****
     * 查询酒店图片
     *
     * @param roomId
     * @return
     * @throws Exception
     */
    @ApiOperation(value = "查询酒店图片", httpMethod = "GET",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "查询酒店图片" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码：</p>" +
            "<p>10201 : roomId不能为空 </p>" +
            "<p>10202 : .系统异常,获取失败</p>")
    @RequestMapping(value = "/getimg/{roomId}", produces = "application/json", method = RequestMethod.GET)
    @ResponseBody
    public Dto<ItripImageVO> getimg(@PathVariable Integer roomId) {
        List<ItripImageVO> itripImageVOS = null;
        List<ItripImage> image=null;
        try {
            if (EmptyUtils.isNotEmpty(roomId)){
                Map param = new HashMap();
                param.put("type",0);
                param.put("targetId",roomId);
                image = itripHotelService.getHotelImgById(param);
                if (EmptyUtils.isNotEmpty(image)){
                    for (ItripImage image1 : image){
                        itripImageVOS = new ArrayList<>();
                        ItripImageVO imageVO =new ItripImageVO();
                        BeanUtils.copyProperties(image1,imageVO);
                        itripImageVOS.add(imageVO);
                    }
                }
            }else {
                DtoUtil.returnFail("roomId不能为空！","10202");
            }
        }catch (Exception e){
            e.getStackTrace();
            DtoUtil.returnFail("系统错误！","10201");
        }
        return DtoUtil.returnSuccess("获取酒店图片成功！",itripImageVOS);
    }

}
