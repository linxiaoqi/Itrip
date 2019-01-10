package cn.itrip.service.comment;

import cn.itrip.beans.pojo.ItripComment;
import cn.itrip.beans.pojo.ItripHotel;
import cn.itrip.beans.pojo.ItripImage;
import cn.itrip.beans.pojo.ItripLabelDic;
import cn.itrip.beans.vo.comment.ItripScoreCommentVO;
import cn.itrip.dao.comment.ItripCommentMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


@Service
public class ItripCommentServiceImpl implements ItripCommentService {

    @Resource
    private ItripCommentMapper itripCommentMapper;

    @Override
    public ItripScoreCommentVO getScoreList(Integer cityId) {
        return itripCommentMapper.getScoreList(cityId);
    }

    @Override
    public Integer getItripCountByMap(Map<String, Object> param) throws Exception {
        return itripCommentMapper.getItripCountByMap(param);
    }

    @Override
    public List<ItripImage> getCommentImgByMap(Map<String, Object> param) throws Exception {
        return itripCommentMapper.getCommentImgByMap(param);
    }

    @Override
    public List<ItripLabelDic> getItripLabelDicListByMap(Map<String, Object> param) throws Exception {
        return itripCommentMapper.getItripLabelDicListByMap(param);
    }

    @Override
    public ItripHotel gethoteldesc(Integer hotelId) throws Exception {
        return itripCommentMapper.gethoteldesc(hotelId);
    }

    @Override
    public Integer getItripAddCommentUrl(ItripImage image) throws Exception {
        return itripCommentMapper.getItripAddCommentUrl(image);
    }

    @Override
    public Integer addCommentInfo(ItripComment comment) throws Exception {
        return itripCommentMapper.addCommentInfo(comment);
    }

}