package cn.itrip.controller;

import cn.itrip.beans.dtos.Dto;
import cn.itrip.beans.pojo.ItripComment;
import cn.itrip.beans.pojo.ItripHotel;
import cn.itrip.beans.pojo.ItripImage;
import cn.itrip.beans.pojo.ItripLabelDic;
import cn.itrip.beans.vo.ItripImageVO;
import cn.itrip.beans.vo.ItripLabelDicVO;
import cn.itrip.beans.vo.comment.ItripAddCommentVO;
import cn.itrip.beans.vo.comment.ItripCountCommentVO;
import cn.itrip.beans.vo.comment.ItripHotelDescVO;
import cn.itrip.beans.vo.comment.ItripScoreCommentVO;
import cn.itrip.common.DtoUtil;
import cn.itrip.common.EmptyUtils;
import cn.itrip.service.comment.ItripCommentService;
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
@RequestMapping(value = "/api/comment")
public class CommentController {

    private Logger logger = Logger.getLogger(CommentController.class);

    @Resource
    private ItripCommentService commentService;


    /****
     * 查询酒店评分
     *
     * @param cityId
     * @return
     * @throws Exception
     */
    @ApiOperation(value = "查询酒店评分", httpMethod = "GET",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "查询酒店评分" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码：</p>" +
            "<p>10201 : hotelId不能为空 </p>" +
            "<p>10202 : 系统异常,获取失败</p>")
    @RequestMapping(value = "/gethotelscore/{cityId}", produces = "application/json", method = RequestMethod.GET)
    @ResponseBody
    public Dto<ItripScoreCommentVO> queryHotCity(@PathVariable Integer cityId) {
        ItripScoreCommentVO scoreCommentVO=null;
        try {
            if (EmptyUtils.isNotEmpty(cityId)){
                scoreCommentVO = commentService.getScoreList(cityId);
            }else {
                DtoUtil.returnFail("cityId不能为空", "10201");
            }
        }catch (Exception e){
            e.getStackTrace();
            DtoUtil.returnFail("获取酒店评分失败！","10201");
        }
        return DtoUtil.returnSuccess("获取酒店评分成功！",scoreCommentVO);
    }

    /****
     * 查询酒店评论数量
     *
     * @param cityId
     * @return
     * @throws Exception
     */
    @ApiOperation(value = "查询酒店评论数量", httpMethod = "GET",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "查询酒店评论数量" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码：</p>" +
            "<p>10201 : cityId不能为空 </p>" +
            "<p>10202 : 系统异常,获取失败</p>")
    @RequestMapping(value = "/getcount/{cityId}", produces = "application/json", method = RequestMethod.GET)
    @ResponseBody
    public Dto<ItripCountCommentVO> getcount(@PathVariable Integer cityId) {
        ItripCountCommentVO itripCountCommentVO = new ItripCountCommentVO();
        try {
            if (EmptyUtils.isNotEmpty(cityId)){
            Map param = new HashMap();
            param.put("hotelId", cityId);
            itripCountCommentVO.setAllcomment(commentService.getItripCountByMap(param));
            param.put("isOk",0);
            itripCountCommentVO.setImprove(commentService.getItripCountByMap(param));
            param.put("isOk",1);
            itripCountCommentVO.setIsok(commentService.getItripCountByMap(param));
            param.remove("isOk");
            param.put("isHavingImg","1");
            itripCountCommentVO.setHavingimg(commentService.getItripCountByMap(param));
          }
        }catch (Exception e){
            e.getStackTrace();
            DtoUtil.returnFail("cityId不能为空！","10201");
        }
        return DtoUtil.returnSuccess("获取评论数量成功！",itripCountCommentVO);
    }


    /****
     * 查询评论附带的图片
     *
     * @param commentId
     * @return
     * @throws Exception
     */
    @ApiOperation(value = "查询评论附带的图片", httpMethod = "GET",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "查询评论附带的图片" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码：</p>" +
            "<p>10201 : commentId不能为空 </p>" +
            "<p>10202 : 系统异常,获取失败</p>")
    @RequestMapping(value = "/getimg/{commentId}", produces = "application/json", method = RequestMethod.GET)
    @ResponseBody
    public Dto<ItripImageVO> getimg(@PathVariable Integer commentId) {
        List<ItripImageVO> imageVOS=null;
        List<ItripImage> images=null;
        try {
            if (EmptyUtils.isNotEmpty(commentId)){
                Map param = new HashMap();
                param.put("type",2);
                param.put("targetId",commentId);
                images = commentService.getCommentImgByMap(param);
                if (EmptyUtils.isNotEmpty(images)){
                    imageVOS = new ArrayList<>();
                    for (ItripImage image : images){
                        ItripImageVO itripImageVO =new ItripImageVO();
                        BeanUtils.copyProperties(image,itripImageVO);
                        imageVOS.add(itripImageVO);
                    }
                }
            }else {
                DtoUtil.returnFail("commentId不能为空！","10201");
            }
        }catch (Exception e){
            e.getStackTrace();
            DtoUtil.returnFail("系统错误！","10202");
        }
        return DtoUtil.returnSuccess("获取评论图片成功！",imageVOS);
    }


    /***
     * 查询旅游类型列表
     *
     * @return
     * @throws Exception
     */
    @ApiOperation(value = "查询旅游类型列表", httpMethod = "GET",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "获取旅游类型列表的信息" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码: </p>" +
            "<p>10205: 系统异常,获取失败</p>")
    @RequestMapping(value = "/gettraveltype", produces = "application/json", method = RequestMethod.GET)
    @ResponseBody
    public Dto<ItripLabelDicVO> gettraveltype() {
        List<ItripLabelDicVO> labelDicVOS=null;
        List<ItripLabelDic> labelDics=null;
        ItripLabelDic dics=new ItripLabelDic();
        try {
            Map param = new HashMap();
            param.put("parentId",107);
            /*param.put("parentId",dics.getParentId());*/
            labelDics = commentService.getItripLabelDicListByMap(param);
            if (EmptyUtils.isNotEmpty(labelDics)){
                labelDicVOS =new ArrayList<>();
                for (ItripLabelDic dic : labelDics){
                    ItripLabelDicVO vo =new ItripLabelDicVO();
                    BeanUtils.copyProperties(dic,vo);
                    labelDicVOS.add(vo);
                    logger.debug("获取旅游类型列表成功！"+labelDicVOS);
                }
            }
        }catch (Exception e){
            e.getStackTrace();
            DtoUtil.returnFail("系统错误！","10201");
        }
        return DtoUtil.returnSuccess("获取旅游类型列表成功！",labelDicVOS);
    }

    /***
     * 查询酒店详情（评论）
     *
     * @return
     * @throws Exception
     */
    @ApiOperation(value = "查询酒店详情评论", httpMethod = "GET",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "获取酒店详情评论信息" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码: </p>" +
            "<p>10205: 系统异常,获取失败</p>")
    @RequestMapping(value = "/gethoteldesc/{hotelId}", produces = "application/json", method = RequestMethod.GET)
    @ResponseBody
    public Dto<ItripHotelDescVO> getvideodesc(@PathVariable Integer hotelId) {
        ItripHotelDescVO hotelDescVO=new ItripHotelDescVO();
        ItripHotel hotel=null;
        try {
            if (EmptyUtils.isNotEmpty(hotelId)){
                hotel = commentService.gethoteldesc(hotelId);
                hotelDescVO.setHotelId(hotel.getId());
                hotelDescVO.setHotelLevel(hotel.getHotelLevel());
                hotelDescVO.setHotelName(hotel.getHotelName());
                DtoUtil.returnSuccess("获取酒店详情成功！",hotelDescVO);
            }else {
                DtoUtil.returnFail("hotelId不能为空！","10202");
            }
        }catch (Exception e){
            e.getStackTrace();
            DtoUtil.returnFail("系统错误！","10201");
        }
        return DtoUtil.returnDataSuccess(hotelDescVO);
    }


    @ApiOperation(value = "新增评论", httpMethod = "POST",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class, notes = "新增评论" +
            "<p>成功：success = ‘true’ | 失败：success = ‘false’ 并返回错误码，如下：</p>" +
            "<p>错误码：</p>" +
            "<p>100401 : 新增评论失败！ </p>" +
            "<p>100000 : token失效，请重登录</p>")
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    @ResponseBody
    public Dto<ItripAddCommentVO> adduserlinkuser(@RequestBody ItripAddCommentVO addCommentVO, HttpServletRequest request) {
        ItripComment comment =new ItripComment();
        List<ItripAddCommentVO> addCommentVOS = new ArrayList<>();
        Integer result=0;
        try {
            comment.setHotelId(addCommentVO.getHotelId());
            comment.setOrderId(addCommentVO.getOrderId());
            comment.setProductId(addCommentVO.getProductId());
            comment.setProductType(addCommentVO.getProductType());
            comment.setIsHavingImg(addCommentVO.getIsHavingImg());
            comment.setPositionScore(addCommentVO.getPositionScore());
            comment.setFacilitiesScore(addCommentVO.getFacilitiesScore());
            comment.setHygieneScore(addCommentVO.getHygieneScore());
            comment.setServiceScore(addCommentVO.getServiceScore());
            comment.setIsOk(addCommentVO.getIsOk());
            comment.setContent(addCommentVO.getContent());
            comment.setTripMode(addCommentVO.getTripMode());
            Integer count = commentService.addCommentInfo(comment);
            if (addCommentVO.getItripImages()!=null){
                for (ItripImage image : addCommentVO.getItripImages()){
                    result =commentService.getItripAddCommentUrl(image);
                }
                if (count<1 || result <1){
                    return DtoUtil.returnFail("新增评论失败！","100201");
                }
            }else if (count<1){
                return DtoUtil.returnFail("新增评论失败！","100201");
            }
        }catch (Exception e){
            e.getStackTrace();
            DtoUtil.returnFail("系统错误！","100201");
        }
        return DtoUtil.returnSuccess("新增评论成功！");
    }

}
