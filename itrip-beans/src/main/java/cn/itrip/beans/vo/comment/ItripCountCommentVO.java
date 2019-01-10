package cn.itrip.beans.vo.comment;

import cn.itrip.beans.pojo.ItripImage;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import io.swagger.models.auth.In;

/**
 * 页面输入-查询酒店评论数量VO
 * Created by hanlu on 2017/5/7.
 */
@ApiModel(value = "ItripCountCommentVO",description = "查询酒店评论数量VO")
public class ItripCountCommentVO {

    @ApiModelProperty("[必填]")
    private Integer improve;

    @ApiModelProperty("[必填] 是否满意")
    private Integer isok;

    @ApiModelProperty("[必填] 是否包含图片")
    private Integer havingimg;

    @ApiModelProperty("[必填]")
    private Integer allcomment;

    public Integer getImprove() {
        return improve;
    }

    public void setImprove(Integer improve) {
        this.improve = improve;
    }

    public Integer getIsok() {
        return isok;
    }

    public void setIsok(Integer isok) {
        this.isok = isok;
    }

    public Integer getHavingimg() {
        return havingimg;
    }

    public void setHavingimg(Integer havingimg) {
        this.havingimg = havingimg;
    }

    public Integer getAllcomment() {
        return allcomment;
    }

    public void setAllcomment(Integer allcomment) {
        this.allcomment = allcomment;
    }
}
