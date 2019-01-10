package cn.itrip.auth.controller;

import cn.itrip.auth.service.UserService;
import cn.itrip.beans.dtos.Dto;
import cn.itrip.beans.pojo.ItripUser;
import cn.itrip.beans.vo.userinfo.ItripUserVO;
import cn.itrip.common.DtoUtil;
import cn.itrip.common.ErrorCode;
import cn.itrip.common.MD5;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import javax.annotation.Resource;
import java.util.regex.Pattern;

@Controller
@RequestMapping(value = "api")
public class SmsController {

    @Resource
    private UserService userService;

    @ApiIgnore
    @RequestMapping("/iphoneregister")
    public String showRegisterForm() {
        return "register";
    }

    /**
     * 电话号码注册
     * @param userVO
     * @return
     */
    @ApiOperation(value = "使用电话号码注册",httpMethod = "POST",
    protocols = "HTTP",produces = "application/json",
    response = Dto.class,notes = "使用电话号码注册")
    @RequestMapping(value="/registerbyphone",method=RequestMethod.POST,produces = "application/json")
    public @ResponseBody
    Dto phoneRegister(@ApiParam(name="userVO",value="用户实体",required=true)
                      @RequestBody ItripUserVO userVO){
        System.out.println("用户电话号码是否成功！");
        if(!validPhone(userVO.getUserCode())){
            return  DtoUtil.returnFail("请使用正确的手机注册",ErrorCode.AUTH_ILLEGAL_USERCODE);
        }
        try {
        ItripUser user=new ItripUser();
        user.setUserCode(userVO.getUserCode());
        user.setUserPassword(userVO.getUserPassword());
        user.setUserType(0);
        user.setUserName(userVO.getUserName());

            if(null==userService.findByUsername(user.getUserCode())){
               user.setUserPassword(MD5.getMd5(user.getUserPassword(),32));
               userService.itriptxCreateUserByPhone(user);
               System.out.println("手机注册成功！");
               return DtoUtil.returnSuccess();
            }else {
                return DtoUtil.returnFail("手机用户已存在，注册失败",ErrorCode.AUTH_USER_ALREADY_EXISTS);
            }
        }catch (Exception e){
            e.printStackTrace();
            return DtoUtil.returnFail(e.getMessage(),ErrorCode.AUTH_UNKNOWN);
        }
    }

    /**
     * 验证是否合法的手机号
     * @param phone
     * @return
     */
    private boolean validPhone(String phone) {
        String regex="^1[3578]{1}\\d{9}$";
        return Pattern.compile(regex).matcher(phone).find();
    }


    /**
     * 检查用户是否已注册
     * @param name
     * @return
     */
    @ApiOperation(value="用户名验证",httpMethod = "GET",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class,notes="验证是否已存在该用户名")
    @RequestMapping(value="/ckusrPhone",method=RequestMethod.GET,produces= "application/json")
    public @ResponseBody
    Dto checkUser(
            @ApiParam(name="name",value="被检查的用户名",defaultValue="15197569037")
            @RequestParam String name) {
        System.out.println("用户名注册名是否唯一！");
        try {
            if(!validPhone(name))
                return  DtoUtil.returnFail("请使用正确的手机注册",ErrorCode.AUTH_ILLEGAL_USERCODE);
            if (null == userService.findByUsername(name)) {
                return DtoUtil.returnSuccess("手机号码可用");
            } else {
                return DtoUtil.returnFail("手机号码已存在，注册失败", ErrorCode.AUTH_USER_ALREADY_EXISTS);
            }
        } catch (Exception e) {
            e.printStackTrace();
            return DtoUtil.returnFail(e.getMessage(), ErrorCode.AUTH_UNKNOWN);
        }
    }

    /**
     *手机激活
     * @param user
     * @param code
     * @return
     */
    @ApiOperation(value="手机册用户激活",httpMethod = "POST",
            protocols = "HTTP", produces = "application/json",
            response = Dto.class,notes="手机激活")
    @RequestMapping(value="/validatephone",method=RequestMethod.PUT,produces= "application/json")
    public @ResponseBody
    Dto activate(
            @ApiParam(name="user",value="注册手机地址",defaultValue="15197569037")
            @RequestParam String user,
            @ApiParam(name="code",value="激活码",defaultValue="123456")
            @RequestParam String code){
        try {
            if(userService.validatePhone(user, code)) {
                return DtoUtil.returnSuccess("激活成功");
            }else{
                return DtoUtil.returnFail("激活失败","10001");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return DtoUtil.returnFail("激活失败", ErrorCode.AUTH_ACTIVATE_FAILED);
        }
    }

    @RequestMapping(value = "/iphoneregister.html")
    public String register() {
        return "register/iphoneregister";
    }

}
