package cn.itrip.controller;

import cn.itrip.beans.dtos.Dto;
import cn.itrip.beans.pojo.ItripHotelRoom;
import cn.itrip.beans.pojo.ItripImage;
import cn.itrip.beans.pojo.ItripLabelDic;
import cn.itrip.beans.pojo.ItripUser;
import cn.itrip.beans.vo.ItripImageVO;
import cn.itrip.beans.vo.ItripLabelDicVO;
import cn.itrip.beans.vo.hotelroom.ItripHotelRoomVO;
import cn.itrip.common.DtoUtil;
import cn.itrip.common.EmptyUtils;
import cn.itrip.common.ValidationToken;
import cn.itrip.service.hotelroom.ItripHotelRoomService;
import cn.itrip.service.image.ItripImageService;
import cn.itrip.service.labeldic.ItripLabelDicService;
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
@RequestMapping(value = "/api/hotelroom")
public class HotelroomController {

    private Logger logger = Logger.getLogger(HotelroomController.class);

    @Resource
    private ItripImageService itripImageService;


    @Resource
    private ItripLabelDicService itripLabelDicService;


    @Resource
    private ValidationToken validationToken;

    @Resource
    private ItripHotelRoomService hotelRoomService;


    /****
     * 查询酒店房型的图片
     *
     * @param
     * @return
     * @throws Exception
     */

    @ApiOperation(value = "查询酒店房型的图片", httpMethod = "GET",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "查询酒店房型图片" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码：</p>" +
            "<p>10201 : roomId不能为空 </p>" +
            "<p>10202 : 系统异常,获取失败</p>")
    @RequestMapping(value = "/getimg/{roomId}", produces = "application/json", method = RequestMethod.GET)
    @ResponseBody
    public Dto<ItripImageVO> getimg(@PathVariable Integer roomId) {
        List<ItripImageVO> itripImageVOS=null;
        List<ItripImage> itripImages=null;
        try {
            if (EmptyUtils.isNotEmpty(roomId)){
                Map param=new HashMap();
                param.put("type",1);
                param.put("targetId",roomId);
                itripImages=itripImageService.getItripImageListByMap(param);
                if (EmptyUtils.isNotEmpty(itripImages)){
                    itripImageVOS=new ArrayList<>();
                    for (ItripImage image:itripImages){
                        ItripImageVO itripImageVO=new ItripImageVO();
                        BeanUtils.copyProperties(image,itripImageVO);
                        itripImageVOS.add(itripImageVO);
                        logger.debug("获取酒店图片房型成功！"+itripImageVOS);
                    }
                }
            }else {
                DtoUtil.returnFail("roomId不能为空", "10201");
            }
        }catch (Exception e){
            DtoUtil.returnFail("系统异常", "10202");
            e.getStackTrace();
        }
        return DtoUtil.returnSuccess("获取酒店图片房型成功！",itripImageVOS);
    }


    /****
     * 查询所有床型
     *
     * @param
     * @return
     * @throws Exception
     */

    @ApiOperation(value = "查询所有床型", httpMethod = "GET",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "查询床型" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码：</p>" +
            "<p>10201 : roomId不能为空 </p>" +
            "<p>10202 : 系统异常,获取失败</p>")
    @RequestMapping(value = "/queryhotelroombed", produces = "application/json", method = RequestMethod.GET)
    @ResponseBody
    public Dto<ItripLabelDicVO> queryhotelroombed() {
        List<ItripLabelDicVO> itripLabelDicVOS=null;
        List<ItripLabelDic>  itripLabelDics=null;
        try {
            Map param =new HashMap();
            param.put("parentId",1);
            itripLabelDics = itripLabelDicService.getItripLabelDicListByMap(param);
            if (EmptyUtils.isNotEmpty(itripLabelDics)){
                itripLabelDicVOS=new ArrayList<>();
                for (ItripLabelDic dic:itripLabelDics){
                    ItripLabelDicVO vo=new ItripLabelDicVO();
                    BeanUtils.copyProperties(dic,vo);
                    itripLabelDicVOS.add(vo);
                }
            }
        }catch (Exception e){
            e.getStackTrace();
        }
        return DtoUtil.returnSuccess("获取成功！",itripLabelDicVOS);
    }


    /*@ApiOperation(value = "查询酒店房型列表", httpMethod = "POST",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "查询酒店房型列表" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码：</p>" +
            "<p>100401 : 查询酒店房型列表失败 </p>" +
            "<p>100000 : token失效，请重登录</p>")
    @RequestMapping(value = "/queryhotelroombyhotel", method = RequestMethod.POST)
    @ResponseBody
    public Dto<ItripHotelRoom> queryhotelroombyhotel(@RequestBody ItripHotelRoomVO hotelRoomVO, HttpServletRequest request) {
        String tokenString = request.getHeader("token");
        logger.info("tokenString>>>>>>>>>>>>>" + tokenString);
        ItripUser currentUser = validationToken.getCurrentUser(tokenString);
        List<ItripHotelRoom> rooms=null;
        ItripHotelRoomVO roomVO=new ItripHotelRoomVO();
        List<ItripHotelRoomVO> itripHotelRoomVOList=new ArrayList<>();
        try {
            *//*Map param= new HashMap();
            param.put("hotelId",hotelRoomVO.getHotelId());
            param.put("isBook",hotelRoomVO.getIsBook());
            param.put("isHavingBreakfast",hotelRoomVO.getIsHavingBreakfast());
            *//*
            hotelRoomVO.setHotelId(hotelRoomVO.getHotelId());
            hotelRoomVO.setIsBook(hotelRoomVO.getIsBook());
            hotelRoomVO.setIsHavingBreakfast(hotelRoomVO.getIsHavingBreakfast());
            rooms = hotelRoomService.getqueryhotelroomListByMap(hotelRoomVO);
            System.out.println(rooms.size());
            if (EmptyUtils.isNotEmpty(rooms)){
                for (ItripHotelRoom room : rooms){
                    BeanUtils.copyProperties(room,roomVO);
                    itripHotelRoomVOList.add(roomVO);
                }
            }
        }catch (Exception e){
            e.getStackTrace();
            DtoUtil.returnFail("系统异常！","10202");
        }
        return DtoUtil.returnSuccess("获取成功！",itripHotelRoomVOList);
    }*/

}
