package cn.itrip.service.comment;

import cn.itrip.beans.pojo.ItripComment;
import cn.itrip.beans.pojo.ItripHotel;
import cn.itrip.beans.pojo.ItripImage;
import cn.itrip.beans.pojo.ItripLabelDic;
import cn.itrip.beans.vo.comment.ItripScoreCommentVO;
import cn.itrip.beans.vo.comment.ItripSearchCommentVO;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ItripCommentService {

    //查询酒店评分
    public ItripScoreCommentVO getScoreList(@Param("cityId") Integer cityId);

    //查询酒店评论数量
    public Integer getItripCountByMap(Map<String, Object> param)throws Exception;

    //查询评论附带的图片
    public List<ItripImage> getCommentImgByMap(Map<String, Object> param) throws Exception;

    public List<ItripLabelDic>	getItripLabelDicListByMap(Map<String, Object> param)throws Exception;

    //查询酒店详情（评论）
    public ItripHotel gethoteldesc(@Param("hotelId") Integer hotelId) throws Exception;

    //新增评论
    public Integer getItripAddCommentUrl(ItripImage image) throws Exception;

    //新增评论
    public Integer addCommentInfo(ItripComment comment) throws Exception;

    //查询评论内容列表
    public PageInfo getcommentlist(ItripSearchCommentVO searchCommentVO) throws Exception;

   /* //添加评论
    public ItripComment addCommentInfoByMap(Map<String ,Object> param) throws Exception;*/
}
