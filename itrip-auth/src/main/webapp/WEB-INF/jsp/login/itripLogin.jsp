<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/5
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html xmlns:wb="http://open.weibo.com/wb">
<head>
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <meta http-equiv="X-UA-Compatible" content="edge">
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <meta name="description" content="">
    <meta name="Keywords" content="">
    <meta name="viewport" content="width=1200, initial-scale=0.8">
    <meta name="applicable-device" content="pc">
    <title>iTrip爱去 - 登录</title>
    <link rel="shortcut icon" href="https://pic.itrip.com/img/favicon.ico">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/itripcss/select2.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/itripcss/it_reset_201810290004.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.request.contextPath}/itripcss/it_login_201810290004.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.8.3.min.js"/>
    <script type="text/javascript" async=""
            src="${pageContext.request.contextPath}/itripjs/conversion_async.js"></script>
    <script type="text/javascript" async="" src="${pageContext.request.contextPath}/itripjs/mv.js"></script>
    <script type="text/javascript" async=""
            src="${pageContext.request.contextPath}/itripjs/mba.js"></script>
    <script async="" src="${pageContext.request.contextPath}/itripjs/gio.js"></script>
    <script type="text/javascript" async=""
            src="${pageContext.request.contextPath}/itripjs/mvl.js"></script>
    <script type="text/javascript" async="" src="${pageContext.request.contextPath}/itripjs/js.js"></script>
    <script async="" src="${pageContext.request.contextPath}/itripjs/analytics.js"></script>
    <script async="" src="${pageContext.request.contextPath}/itripjs/fbevents.js"></script>
    <script src="${pageContext.request.contextPath}/itripjs/hm.js"></script>
    <script src="${pageContext.request.contextPath}/itripjs/wb.js" type="text/javascript"
            charset="utf-8"></script>
    <script charset="UTF-8" src="${pageContext.request.contextPath}/itripjs/query.txt"></script>
    <script type="text/javascript" async="async" charset="utf-8"
            src="${pageContext.request.contextPath}/itripjs/userinfo.php"></script>
    <script type="text/javascript" async="async" charset="utf-8"
            src="${pageContext.request.contextPath}/itripjs/zh_cn.js" data-requiremodule="lang"></script>
    <script type="text/javascript" async="async" charset="utf-8"
            src="${pageContext.request.contextPath}/itripjs/chat.js"
            data-requiremodule="chatManage"></script>
    <script type="text/javascript" async="async" charset="utf-8"
            src="${pageContext.request.contextPath}/itripjs/mqtt31.js" data-requiremodule="MQTT"></script>
    <script type="text/javascript" async="async" charset="utf-8"
            src="${pageContext.request.contextPath}/itripjs/mqtt.js"
            data-requiremodule="Connection"></script>
    <script src="${pageContext.request.contextPath}/itripjs/a_002.js"></script>
    <script src="${pageContext.request.contextPath}/itripjs/a.js"></script>
    <script type="text/javascript">

        $(function () {

            $("#bt1").click(function () {
                var name = $("#name").val();
                var passwrod = $("#password").val();
                alert(name + " " + passwrod);
                $.ajax({
                    "url": "${pageContext.request.contextPath}/api/ss",
                    "type": "POST",
                    "data": {"name": name, "password": passwrod},
                    "dataType": "json",
                    "success": function (data) {
                        console.log(data);
                        if (data.success == "true") {
                            setCookie("token", data.data.token);
                            setCookie("expTime", data.data.expTime);
                            location.href="${pageContext.request.contextPath}/api/ss";
                        } else {
                            location.href="${pageContext.request.contextPath}/tokenError.jsp";
                        }
                    }
                });
            });
        });

        function setCookie(name, value) {
            document.cookie = name + '=' + escape(value);
        }
    </script>
</head>

<body>
<div id="nTalk_post_hiddenElement"
     style="left: -10px; top: -10px; visibility: hidden; display: none; width: 1px; height: 1px;"></div>
<div class="login_header">
    <div class="wrap" style="width:900px;">
        <div class="logo fl pos_r">
            <h1>
                <a href="https://www.itrip.com/">
                    <img src="${pageContext.request.contextPath}/itripimg/logo3.png" alt="iTrip爱去自由"
                         style="margin:0px;position:relative;">
                </a>
            </h1>
        </div>
    </div>
</div>
<div class="login_cont">
    <div class="wrap clearfix"
         style="width:900px;background: url(//pic.itrip.com/img/ad/left_back.jpg) left 150px no-repeat;">
        <div class="boxLoginRegister">
            <div class="logo" id="img_logo" style="cursor: pointer;"></div>
            <div class="boxLoginRegisterCont" style="margin-top:20px;">
                <div class="txtPanel" style="display:none;">
                    <span class="line"></span>
                    <span class="txt">设置昵称和密码</span>
                    <span class="line"></span>
                </div>
                <div class="titleBar" style="position:relative;">
                    <div class="pos_r" style="height:36px;">
                        <span class="cur loginForPhone">手机登录</span>
                        <span class="loginForEmail">邮箱登录</span>
                        <i class="titleBarBot" style="left: 0px;"></i>
                    </div>
                </div>

                <!-- 默认下一步页面 -->
                <div id="logintype-next" style="display:block;">
                    <form id="phone__login" onsubmit="return false">
                        <!-- 手机号 -->
                        <div class="iptBox cus_input" style="margin-top:40px;padding:0;">
                            <select style="height: 36px; width: 80px; border: medium none; background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; display: none;"
                                    id="regionCodePhoneNumNext" name="regionCodePhoneNumNext" tabindex="-1">
                                <option value="86" label="中国" selected="selected">+86</option>
                                <option value="61" label="澳大利亚">+61</option>
                                <option value="64" label="新西兰">+64</option>
                                <option value="679" label="斐济">+679</option>
                                <option value="1" label="美国">+1</option>
                                <option value="66" label="泰国">+66</option>
                                <option value="62" label="印度尼西亚">+62</option>
                                <option value="65" label="新加坡">+65</option>
                                <option value="60" label="马来西亚">+60</option>
                                <option value="33" label="法国">+33</option>
                                <option value="49" label="德国">+49</option>
                                <option value="39" label="意大利">+39</option>
                                <option value="352" label="卢森堡">+352</option>
                                <option value="34" label="西班牙">+34</option>
                                <option value="351" label="葡萄牙">+351</option>
                                <option value="30" label="希腊">+30</option>
                                <option value="44" label="英国">+44</option>
                                <option value="31" label="荷兰">+31</option>
                                <option value="32" label="比利时">+32</option>
                                <option value="420" label="捷克">+420</option>
                                <option value="36" label="匈牙利">+36</option>
                                <option value="43" label="奥地利">+43</option>
                                <option value="41" label="瑞士">+41</option>
                                <option value="00" label="欧洲">+00</option>
                                <option value="421" label="斯洛伐克">+421</option>
                                <option value="423" label="列支敦士登">+423</option>
                                <option value="377" label="摩纳哥">+377</option>
                                <option value="379" label="梵蒂冈">+379</option>
                                <option value="45" label="丹麦">+45</option>
                                <option value="47" label="挪威">+47</option>
                                <option value="46" label="瑞典">+46</option>
                                <option value="358" label="芬兰">+358</option>
                                <option value="353" label="爱尔兰">+353</option>
                                <option value="385" label="克罗地亚">+385</option>
                                <option value="48" label="波兰">+48</option>
                                <option value="354" label="冰岛">+354</option>
                                <option value="66" label="华欣">+66</option>
                                <option value="852" label="中国香港">+852</option>
                                <option value="680" label="帕劳">+680</option>
                                <option value="886" label="中国台湾">+886</option>
                                <option value="386" label="斯洛文尼亚">+386</option>
                                <option value="960" label="马尔代夫">+960</option>
                                <option value="00230" label="毛里求斯">+00230</option>
                                <option value="001" label="塞班岛">+001</option>
                                <option value="0081" label="日本">+0081</option>
                                <option value="00248" label="塞舌尔">+00248</option>
                                <option value="00689" label="大溪地">+00689</option>
                                <option value="90" label="土耳其">+90</option>
                                <option value="356" label="马耳他">+356</option>
                                <option value="+299" label="格陵兰岛">++299</option>
                                <option value="+298" label="法罗群岛">++298</option>
                                <option value="1" label="加拿大">+1</option>
                                <option value="63" label="菲律宾">+63</option>
                                <option value="853" label="中国澳门">+853</option>
                                <option value="33" label="凡尔登">+33</option>
                                <option value="7" label="俄罗斯">+7</option>
                                <option value="212" label="摩洛哥">+212</option>
                                <option value="387" label="波黑">+387</option>
                                <option value="+82" label="韩国">++82</option>
                            </select><span class="select2 select2-container select2-container--default" dir="ltr"
                                           style="width: 125px;"><span class="selection"><span
                                class="select2-selection select2-selection--single" role="combobox"
                                aria-autocomplete="list" aria-haspopup="true" aria-expanded="false" tabindex="0"
                                aria-labelledby="select2-regionCodePhoneNumNext-container"><span
                                class="select2-selection__rendered" id="select2-regionCodePhoneNumNext-container"
                                title="+86">+86</span><span class="select2-selection__arrow" role="presentation"><b
                                role="presentation"></b></span></span></span><span class="dropdown-wrapper"
                                                                                   aria-hidden="true"></span></span>
                            <input id="phoneNumNext" data-valid="required number" data-name="手机号" type="text"
                                   name="phoneNumNext" placeholder="手机号" style="width:150px;" autocomplete="off"
                                   maxlength="20">
                            <i class="icon_phone"></i>
                            <i class="cus_icon icon_right icon_center gray-red icon_error"></i></div>
                        <div class="oh mt10 forgatpassword">
                            <span id="errTiPhoneNumNext" class="warnning"></span>
                        </div>
                        <a id="phoneLoginNext" href="javascript:;" class="btn-normal-blue mt20"
                           phoneloginnext="">下一步</a>
                        <p class="mt10">还没有帐号？立即<a id="signup" href="https://www.itrip.com/signup/index"
                                                   class="blueLink">注册</a></p>
                        <!-- 手机登录第一步  -->
                    </form>
                </div>

                <!-- 手机短信校验页面 -->
                <div id="logintype-sms" class="hide">
                    <!-- 手机号 -->
                    <form onsubmit="return false" id="${pageContext.request.contextPath}/api/tologin">
                        <div class="iptBox cus_input" style="margin-top:40px;padding:0;">
                            <select style="height: 36px; width: 80px; border: medium none; background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; display: none;"
                                    id="regionCodePhoneNumSms" name="regionCodePhoneNumSms" tabindex="-1">
                                <option value="86" label="中国" selected="selected">+86</option>
                                <option value="61" label="澳大利亚">+61</option>
                                <option value="64" label="新西兰">+64</option>
                                <option value="679" label="斐济">+679</option>
                                <option value="1" label="美国">+1</option>
                                <option value="66" label="泰国">+66</option>
                                <option value="62" label="印度尼西亚">+62</option>
                                <option value="65" label="新加坡">+65</option>
                                <option value="60" label="马来西亚">+60</option>
                                <option value="33" label="法国">+33</option>
                                <option value="49" label="德国">+49</option>
                                <option value="39" label="意大利">+39</option>
                                <option value="352" label="卢森堡">+352</option>
                                <option value="34" label="西班牙">+34</option>
                                <option value="351" label="葡萄牙">+351</option>
                                <option value="30" label="希腊">+30</option>
                                <option value="44" label="英国">+44</option>
                                <option value="31" label="荷兰">+31</option>
                                <option value="32" label="比利时">+32</option>
                                <option value="420" label="捷克">+420</option>
                                <option value="36" label="匈牙利">+36</option>
                                <option value="43" label="奥地利">+43</option>
                                <option value="41" label="瑞士">+41</option>
                                <option value="00" label="欧洲">+00</option>
                                <option value="421" label="斯洛伐克">+421</option>
                                <option value="423" label="列支敦士登">+423</option>
                                <option value="377" label="摩纳哥">+377</option>
                                <option value="379" label="梵蒂冈">+379</option>
                                <option value="45" label="丹麦">+45</option>
                                <option value="47" label="挪威">+47</option>
                                <option value="46" label="瑞典">+46</option>
                                <option value="358" label="芬兰">+358</option>
                                <option value="353" label="爱尔兰">+353</option>
                                <option value="385" label="克罗地亚">+385</option>
                                <option value="48" label="波兰">+48</option>
                                <option value="354" label="冰岛">+354</option>
                                <option value="66" label="华欣">+66</option>
                                <option value="852" label="中国香港">+852</option>
                                <option value="680" label="帕劳">+680</option>
                                <option value="886" label="中国台湾">+886</option>
                                <option value="386" label="斯洛文尼亚">+386</option>
                                <option value="960" label="马尔代夫">+960</option>
                                <option value="00230" label="毛里求斯">+00230</option>
                                <option value="001" label="塞班岛">+001</option>
                                <option value="0081" label="日本">+0081</option>
                                <option value="00248" label="塞舌尔">+00248</option>
                                <option value="00689" label="大溪地">+00689</option>
                                <option value="90" label="土耳其">+90</option>
                                <option value="356" label="马耳他">+356</option>
                                <option value="+299" label="格陵兰岛">++299</option>
                                <option value="+298" label="法罗群岛">++298</option>
                                <option value="1" label="加拿大">+1</option>
                                <option value="63" label="菲律宾">+63</option>
                                <option value="853" label="中国澳门">+853</option>
                                <option value="33" label="凡尔登">+33</option>
                                <option value="7" label="俄罗斯">+7</option>
                                <option value="212" label="摩洛哥">+212</option>
                                <option value="387" label="波黑">+387</option>
                                <option value="+82" label="韩国">++82</option>
                            </select><span class="select2 select2-container select2-container--default" dir="ltr"
                                           style="width: 125px;"><span class="selection"><span
                                class="select2-selection select2-selection--single" role="combobox"
                                aria-autocomplete="list" aria-haspopup="true" aria-expanded="false" tabindex="0"
                                aria-labelledby="select2-regionCodePhoneNumSms-container"><span
                                class="select2-selection__rendered" id="select2-regionCodePhoneNumSms-container"
                                title="+86">+86</span><span class="select2-selection__arrow" role="presentation"><b
                                role="presentation"></b></span></span></span><span class="dropdown-wrapper"
                                                                                   aria-hidden="true"></span></span>
                            <input id="phoneNumSms" data-valid="required number" data-name="手机号" type="text"
                                   name="phoneNumSms" placeholder="手机号" style="width:150px;" autocomplete="off"
                                   maxlength="20">
                            <i class="icon_phone"></i>
                            <i class="cus_icon icon_right icon_center gray-red icon_error"></i></div>
                        <!-- 输入系统验证码 -->
                        <div class="oh mt10 verfiycode_div_sms" phonepasshasnot=""> <!-- 无密码 -->
                            <div class="iptBox fl cus_input">
                                <input id="ipt_verifyCode_sms" data-valid="required max[4]" data-name="图形验证码"
                                       type="text" name="ipt_verifyCode_sms" style="width:120px;" placeholder="图形验证码"
                                       autocomplete="off">
                                <i class="cus_icon icon_right icon_center gray-red icon_error"></i></div>
                            <img src="${pageContext.request.contextPath}/itripimg/verifyCode.jpg"
                                 class="ml10 hand" title="看不清，请点我" id="img_verifycode_sms" width="120" height="36"
                                 border="0">
                        </div>
                        <!-- 获取手机校验码 -->
                        <div class="oh mt10 getPhoneCode" phonepasshasnot=""> <!-- 无密码 -->
                            <div class="iptBox fl cus_input">
                                <input id="phoneNumSmsCode" data-valid="required number max[6]" data-name="手机验证码"
                                       type="text" name="phoneNumSmsCode" style="width:120px;" placeholder="手机验证码"
                                       autocomplete="off">
                                <i class="cus_icon icon_right icon_center gray-red icon_error"></i></div>
                            <a id="sendSms" href="javascript:;" class="btn-normal-blue ml10" style="font-size: 12px;">获取验证码</a>
                        </div>
                    </form>
                    <div class="oh mt10 forgatpassword hide">
                        <p class="tl hide">
                            长时间收不到验证码，试试
                            <a href="javascript:void(0);" class="sendVoiceCode">
                                语音接听验证码
                            </a>
                        </p>
                        <span id="errTiPhoneNumSms" class="warnning"></span>
                    </div>
                    <!-- 手机登录第一步  -->
                    <a id="phoneLoginSms" href="javascript:;" class="btn-normal-blue mt20" phonelogin="">登录</a>
                </div>

                <!-- 手机密码登录页面 -->
                <div id="logintype-phone" class="hide">
                    <!-- 手机号 -->
                    <form onsubmit="return false">
                        <div class="iptBox cus_input" style="margin-top:40px;padding:0;">
                            <select style="height: 36px; width: 80px; border: medium none; background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; display: none;"
                                    id="phoneRegionCode" name="phoneRegionCode" tabindex="-1">
                                <option value="86" label="中国" selected="selected">+86</option>
                                <option value="61" label="澳大利亚">+61</option>
                                <option value="64" label="新西兰">+64</option>
                                <option value="679" label="斐济">+679</option>
                                <option value="1" label="美国">+1</option>
                                <option value="66" label="泰国">+66</option>
                                <option value="62" label="印度尼西亚">+62</option>
                                <option value="65" label="新加坡">+65</option>
                                <option value="60" label="马来西亚">+60</option>
                                <option value="33" label="法国">+33</option>
                                <option value="49" label="德国">+49</option>
                                <option value="39" label="意大利">+39</option>
                                <option value="352" label="卢森堡">+352</option>
                                <option value="34" label="西班牙">+34</option>
                                <option value="351" label="葡萄牙">+351</option>
                                <option value="30" label="希腊">+30</option>
                                <option value="44" label="英国">+44</option>
                                <option value="31" label="荷兰">+31</option>
                                <option value="32" label="比利时">+32</option>
                                <option value="420" label="捷克">+420</option>
                                <option value="36" label="匈牙利">+36</option>
                                <option value="43" label="奥地利">+43</option>
                                <option value="41" label="瑞士">+41</option>
                                <option value="00" label="欧洲">+00</option>
                                <option value="421" label="斯洛伐克">+421</option>
                                <option value="423" label="列支敦士登">+423</option>
                                <option value="377" label="摩纳哥">+377</option>
                                <option value="379" label="梵蒂冈">+379</option>
                                <option value="45" label="丹麦">+45</option>
                                <option value="47" label="挪威">+47</option>
                                <option value="46" label="瑞典">+46</option>
                                <option value="358" label="芬兰">+358</option>
                                <option value="353" label="爱尔兰">+353</option>
                                <option value="385" label="克罗地亚">+385</option>
                                <option value="48" label="波兰">+48</option>
                                <option value="354" label="冰岛">+354</option>
                                <option value="66" label="华欣">+66</option>
                                <option value="852" label="中国香港">+852</option>
                                <option value="680" label="帕劳">+680</option>
                                <option value="886" label="中国台湾">+886</option>
                                <option value="386" label="斯洛文尼亚">+386</option>
                                <option value="960" label="马尔代夫">+960</option>
                                <option value="00230" label="毛里求斯">+00230</option>
                                <option value="001" label="塞班岛">+001</option>
                                <option value="0081" label="日本">+0081</option>
                                <option value="00248" label="塞舌尔">+00248</option>
                                <option value="00689" label="大溪地">+00689</option>
                                <option value="90" label="土耳其">+90</option>
                                <option value="356" label="马耳他">+356</option>
                                <option value="+299" label="格陵兰岛">++299</option>
                                <option value="+298" label="法罗群岛">++298</option>
                                <option value="1" label="加拿大">+1</option>
                                <option value="63" label="菲律宾">+63</option>
                                <option value="853" label="中国澳门">+853</option>
                                <option value="33" label="凡尔登">+33</option>
                                <option value="7" label="俄罗斯">+7</option>
                                <option value="212" label="摩洛哥">+212</option>
                                <option value="387" label="波黑">+387</option>
                                <option value="+82" label="韩国">++82</option>
                            </select><span class="select2 select2-container select2-container--default" dir="ltr"
                                           style="width: 125px;"><span class="selection"><span
                                class="select2-selection select2-selection--single" role="combobox"
                                aria-autocomplete="list" aria-haspopup="true" aria-expanded="false" tabindex="0"
                                aria-labelledby="select2-phoneRegionCode-container"><span
                                class="select2-selection__rendered" id="select2-phoneRegionCode-container" title="+86">+86</span><span
                                class="select2-selection__arrow" role="presentation"><b role="presentation"></b></span></span></span><span
                                class="dropdown-wrapper" aria-hidden="true"></span></span>
                            <input id="phoneNum" type="text" data-valid="required number" data-name="手机号"
                                   name="phoneNum" placeholder="手机号" style="width:150px;" autocomplete="off"
                                   maxlength="20">
                            <i class="icon_phone"></i>
                            <i class="cus_icon icon_right icon_center gray-red icon_error"></i></div>
                        <!-- 输入密码 -->
                        <div class="iptBox inputPassword mt10 cus_input" phonepasshas=""> <!-- 有密码 -->
                            <input id="phonePwd" type="password" data-valid="required min[6] max[20]" data-name="密码"
                                   name="phonePwd" style="width:248px;" placeholder="密码" autocomplete="off">
                            <i class="cus_icon icon_right icon_center gray-red icon_error"></i></div>

                        <!-- 输入系统验证码 -->
                        <div class="oh mt10 verfiycode_div_p hide" id="verfiycode_div_p" phonepasshasnot="">
                            <!-- 无密码 -->
                            <div class="iptBox fl cus_input">
                                <input id="ipt_verifyCode_p" data-valid="required max[4]" data-name="图形验证码"
                                       data-hidevalid="1" type="text" name="ipt_verifyCode_p" style="width:120px;"
                                       placeholder="图形验证码" autocomplete="off">
                                <i class="cus_icon icon_right icon_center gray-red icon_error"></i></div>
                            <img src="${pageContext.request.contextPath}/itripimg/verifyCode.jpg"
                                 class="ml10 hand" title="看不清，请点我" id="img_verifycode_p" width="120" height="36"
                                 border="0">
                        </div>
                    </form>
                    <div class="oh mt10 forgatpassword">
                        <span id="errTipPhone" class="warnning"></span>
                        <a class="forgetPass" href="https://www.itrip.com/findpwd/index">忘记密码?</a>
                    </div>
                    <!-- 手机登录第一步  -->
                    <a id="phoneLogin" href="javascript:;" class="btn-normal-blue mt20" phonelogin="">登录</a>
                </div>

                <!-- 邮件密码登录页面 -->
                <div id="logintype-email" class="hide">
                    <form  id="email__login" action="${pageContext.request.contextPath}/api/ss" method="post">
                        <div class="iptBox mt20 cus_input">
                            <input id="name" data-valid="required email" data-name="邮箱" type="text" name="name"
                                   style="width:248px;" placeholder="邮箱" autocomplete="off">
                            <i class="cus_icon icon_right icon_center gray-red icon_error"></i></div>
                        <div class="iptBox inputPassword mt10 cus_input">
                            <input id="password" data-valid="required min[6] max[20]" data-name="密码" type="password"
                                   name="password" style="width:248px;" placeholder="密码" autocomplete="off">
                            <i class="cus_icon icon_right icon_center gray-red icon_error"></i></div>
                        <!-- 输入系统验证码 -->
                        <div class="oh mt10 verfiycode_div_e hide" id="verfiycode_div_e" phonepasshasnot="">
                            <!-- 无密码 -->
                            <div class="iptBox fl cus_input">
                                <input id="ipt_verifyCode_e" data-valid="required max[4]" data-hidevalid="1"
                                       data-name="图形验证码" type="text" name="ipt_verifyCode_e" style="width:120px;"
                                       placeholder="图形验证码" autocomplete="off">
                                <i class="cus_icon icon_right icon_center gray-red icon_error"></i></div>
                            <img src="${pageContext.request.contextPath}/itripimg/verifyCode.jpg"
                                 class="ml10 hand" title="看不清，请点我" id="img_verifycode_e" width="120" height="36"
                                 border="0">
                        </div>
                        <div class="oh mt10 forgatpassword">
                            <span id="errTiEmail" class="warnning"></span>
                            <a class="forgetPass" href="https://www.itrip.com/findpwd/index">忘记密码?</a>
                        </div>
                        <%--<a id="emailLogin" href="javascript:;" class="btn-normal-blue mt20" phonepasshas="">登录11</a>--%>
                        <input type="button" id="bt1" value="登录2"/>
                        <p class="mt10">还没有帐号？立即<a id="signup" href="https://www.itrip.com/signup/index"
                                                   class="blueLink">注册</a></p>
                    </form>
                </div>

                <!-- 设置昵称和密码页面 -->
                <form onsubmit="return false;" id="login_set_pwd">
                    <div id="logintype-nickPwd" class="hide">
                        <!-- 显示设置昵称和密码 -->
                        <div class="setNickAndPassword">
                            <div class="oh mt10 iptBox cus_input">
                                <span class="sortLabel">设定昵称</span>
                                <input id="nickName" type="text" name="nickName" style="width:180px;"
                                       data-valid="required max[20]" data-name="昵称" placeholder="昵称(最大长度20位字符)"
                                       autocomplete="off">
                                <i class="cus_icon icon_right icon_center gray-red icon_error"></i></div>
                            <div class="oh mt10 iptBox cus_input">
                                <span class="sortLabel">设定密码</span>
                                <input id="setpwd" type="password" name="setpwd" data-valid="required min[6] max[20]"
                                       data-name="密码" style="width:180px;" placeholder="6-20位,字母与数字组合"
                                       autocomplete="off">
                                <i class="cus_icon icon_right icon_center gray-red icon_error"></i></div>
                            <div class="oh mt10 iptBox cus_input">
                                <span class="sortLabel">再次输入</span>
                                <input id="rePwd" type="password" name="rePwd" style="width:180px;"
                                       data-valid="required rePwd" data-name="确认密码" placeholder="请再次输入"
                                       autocomplete="off">
                                <i class="cus_icon icon_right icon_center gray-red icon_error"></i></div>
                            <div class="oh mt10 forgatpassword">
                                <span id="errNickTip" class="warnning" style="padding:0;line-height: 1"></span>
                            </div>
                            <a id="setNickAndPasswordDone" href="javascript:;" class="btn-normal-blue mt20">完成</a>
                        </div>
                        <p style="margin-top: 10px;line-height:1.5;"><a id="phoneJumpOver" href="javascript:;"
                                                                        style="color:#4ea9f2;">下次关联</a></p>
                        <p>不设置密码仅可使用短信验证码登录！</p>
                    </div>
                </form>

                <!-- 关联手机号码页面 -->
                <div id="logintype-relePhone" class="hide">
                    <p class="associate-title">请先关联手机号</p>
                    <p class="associate-txt">探测到您的账号存在安全风险，建议关联手机号提高安全性！</p>
                    <form onsubmit="return false">
                        <div class="iptBox cus_input" style="margin-top:20px;padding:0;">
                            <select style="height: 36px; width: 80px; border: medium none; background: rgba(0, 0, 0, 0) none repeat scroll 0% 0%; display: none;"
                                    id="relePhoneRegionCode" name="relePhoneRegionCode" tabindex="-1">
                                <option value="86" label="中国" selected="selected">+86</option>
                                <option value="61" label="澳大利亚">+61</option>
                                <option value="64" label="新西兰">+64</option>
                                <option value="679" label="斐济">+679</option>
                                <option value="1" label="美国">+1</option>
                                <option value="66" label="泰国">+66</option>
                                <option value="62" label="印度尼西亚">+62</option>
                                <option value="65" label="新加坡">+65</option>
                                <option value="60" label="马来西亚">+60</option>
                                <option value="33" label="法国">+33</option>
                                <option value="49" label="德国">+49</option>
                                <option value="39" label="意大利">+39</option>
                                <option value="352" label="卢森堡">+352</option>
                                <option value="34" label="西班牙">+34</option>
                                <option value="351" label="葡萄牙">+351</option>
                                <option value="30" label="希腊">+30</option>
                                <option value="44" label="英国">+44</option>
                                <option value="31" label="荷兰">+31</option>
                                <option value="32" label="比利时">+32</option>
                                <option value="420" label="捷克">+420</option>
                                <option value="36" label="匈牙利">+36</option>
                                <option value="43" label="奥地利">+43</option>
                                <option value="41" label="瑞士">+41</option>
                                <option value="00" label="欧洲">+00</option>
                                <option value="421" label="斯洛伐克">+421</option>
                                <option value="423" label="列支敦士登">+423</option>
                                <option value="377" label="摩纳哥">+377</option>
                                <option value="379" label="梵蒂冈">+379</option>
                                <option value="45" label="丹麦">+45</option>
                                <option value="47" label="挪威">+47</option>
                                <option value="46" label="瑞典">+46</option>
                                <option value="358" label="芬兰">+358</option>
                                <option value="353" label="爱尔兰">+353</option>
                                <option value="385" label="克罗地亚">+385</option>
                                <option value="48" label="波兰">+48</option>
                                <option value="354" label="冰岛">+354</option>
                                <option value="66" label="华欣">+66</option>
                                <option value="852" label="中国香港">+852</option>
                                <option value="680" label="帕劳">+680</option>
                                <option value="886" label="中国台湾">+886</option>
                                <option value="386" label="斯洛文尼亚">+386</option>
                                <option value="960" label="马尔代夫">+960</option>
                                <option value="00230" label="毛里求斯">+00230</option>
                                <option value="001" label="塞班岛">+001</option>
                                <option value="0081" label="日本">+0081</option>
                                <option value="00248" label="塞舌尔">+00248</option>
                                <option value="00689" label="大溪地">+00689</option>
                                <option value="90" label="土耳其">+90</option>
                                <option value="356" label="马耳他">+356</option>
                                <option value="+299" label="格陵兰岛">++299</option>
                                <option value="+298" label="法罗群岛">++298</option>
                                <option value="1" label="加拿大">+1</option>
                                <option value="63" label="菲律宾">+63</option>
                                <option value="853" label="中国澳门">+853</option>
                                <option value="33" label="凡尔登">+33</option>
                                <option value="7" label="俄罗斯">+7</option>
                                <option value="212" label="摩洛哥">+212</option>
                                <option value="387" label="波黑">+387</option>
                                <option value="+82" label="韩国">++82</option>
                            </select><span class="select2 select2-container select2-container--default" dir="ltr"
                                           style="width: 125px;"><span class="selection"><span
                                class="select2-selection select2-selection--single" role="combobox"
                                aria-autocomplete="list" aria-haspopup="true" aria-expanded="false" tabindex="0"
                                aria-labelledby="select2-relePhoneRegionCode-container"><span
                                class="select2-selection__rendered" id="select2-relePhoneRegionCode-container"
                                title="+86">+86</span><span class="select2-selection__arrow" role="presentation"><b
                                role="presentation"></b></span></span></span><span class="dropdown-wrapper"
                                                                                   aria-hidden="true"></span></span>
                            <input id="relePhoneNum" data-valid="required number" data-name="手机号码" type="text"
                                   name="relePhoneNum" placeholder="请输入手机号" style="width:130px;" autocomplete="off"
                                   maxlength="20">
                            <i class="icon_phone"></i>
                            <i class="cus_icon icon_right icon_center gray-red icon_error"></i></div>
                        <!-- 获取手机校验码 -->
                        <div class="oh mt10 getPhoneCode" phonepasshasnot=""> <!-- 无密码 -->
                            <div class="iptBox fl cus_input">
                                <input id="relePhoneSms" data-valid="required number max[6]" data-name="手机验证码"
                                       type="text" name="relePhoneSms" style="width:120px;" placeholder="手机验证码"
                                       autocomplete="off">
                                <i class="cus_icon icon_right icon_center gray-red icon_error"></i></div>
                            <a id="relePhoneSendSms" href="javascript:;" class="btn-normal-blue ml10"
                               style="font-size: 12px;">获取验证码</a>
                        </div>
                    </form>
                    <div class="oh mt10 forgatpassword hide">
                        <p class="tl hide">
                            长时间收不到验证码，试试
                            <a href="javascript:void(0);" class="bindSendVoiceCode">
                                语音接听验证码
                            </a>
                        </p>
                        <span id="errTipEmailRelePhonNum" class="warnning" style="padding:0;line-height: 1"></span>
                    </div>
                    <a id="emailRelePhonNum" href="javascript:;" class="btn-normal-blue mt20">确定</a>
                    <p style="margin-top: 10px;line-height:1.5;"><a id="emailJumpOver" href="javascript:;"
                                                                    style="color:#4ea9f2;">下次关联</a></p>
                </div>
                <div class="mt10 otheruser ">
                    <div class="txtPanel">
                        <span class="line"></span>
                        <span class="txt">使用其他帐号登录</span>
                        <span class="line"></span>
                    </div>
                    <div class="tc mt10">
                        <span class="QQ_login" id="qqLoginBtn" title="QQ登录"><a href="javascript:;"
                                                                               onclick="return window.open('https://graph.qq.com/oauth2.0/authorize?client_id=101203619&amp;response_type=token&amp;scope=get_user_info&amp;redirect_uri=https%3A%2F%2Fwww.itrip.com%2Fmain%2Flogin%2Fqq', 'oauth2Login_10880' ,'height=525,width=585, toolbar=no, menubar=no, scrollbars=no, status=no, location=yes, resizable=yes');"><img
                                src="${pageContext.request.contextPath}/itripimg/Connect_logo_1.png"
                                alt="QQ登录" border="0"></a></span>
                        <a class="WB_login" title="微博登录" id="btn_weibo"></a>
                        <a class="WX_login" title="微信登录" id="btn_wx"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script id="confirmDialog" type="text/html">
    <div style="width:420px;height:80px;font-size:14px;text-align:center;">
        <div class="mb10">
            {{msg}}
        </div>
        <div style="text-align:right">
            <input data-dialog-cancel type="button" value="{{cancelBtnName}}">
            <input data-dialog-confirm="{{confirmId}}" type="button" value="{{confirmBtnName}}">
        </div>
    </div>
</script>
<script type="text/javascript">
    var webRoot = '//www.itrip.com/main';
    var accessRoot = 'https://www.itrip.com';
    var picHome = '//pic.itrip.com/img';
    var pic2Home = '//pic2.itrip.com';
    var siteName = 'iTrip爱去';
    var areaId = '';
    var cssHome = '//static.itrip.com/css';
    var jsHome = '//static.itrip.com/js';
    var videoHome = '//v.itrip.com/video';
</script>

<script type="text/javascript"
        src="${pageContext.request.contextPath}/itripjs/__CONCAT__jquery-1.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/itripjs/qc_loader.js"
        data-appid="101203619" data-redirecturi="https://www.itrip.com/main/login/qq" charset="utf-8"></script>
<script src="${pageContext.request.contextPath}/itripjs/qc-1.js" type="text/javascript"
        data-appid="101203619" data-redirecturi="https://www.itrip.com/main/login/qq" charset="utf-8"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/itripjs/jquery.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/itripjs/loginPlugin3.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/itripjs/sea.js"></script>
<script type="text/javascript">
    seajs.config({
        base: '//static.itrip.com/js',
        map: [

            [/^http[s]{0,1}:\/\/(.*)\/(.*it_payment)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_mall_countDown)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_findPwd)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_login)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_bundPro)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_activePage)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_uc_coupons)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_customOrder)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_uc_reward)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_tour)\.js$/i, '//static.itrip.com/js/$2_201810241043.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_bundleProduct)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_header)\.js$/i, '//static.itrip.com/js/$2_201809151200.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_sniping)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_product)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_charterTravel)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_packageProduct)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_flightTransfer)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_hotel_index)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_index_aus)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_bundleWifi)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_reviewDetails)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_pay)\.js$/i, '//static.itrip.com/js/$2_201811280001.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_charterTravelFunc)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_uc_distribution)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_index_eu)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_hotel_list)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_uc_passagerInfos)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_uc_index)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_orderDetail)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_signup)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_hotel_index_au)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_uc_orders)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_reviewList)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_searchResult)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_uc_baseInfo)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_uc_reviewEdit)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_order)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_flightTransferSelc)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_uc_favor)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_dis_self)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_shoppingCart)\.js$/i, '//static.itrip.com/js/$2_201810250001.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_productList)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_uc_review)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_feedBack)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_payHeader)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_disIncome)\.js$/i, '//static.itrip.com/js/$2_201810290004.js'],
            [/^http[s]{0,1}:\/\/(.*)\/(.*it_hotel_detail)\.js$/i, '//static.itrip.com/js/$2_201810290004.js']
        ]
    });
    seajs.use('it_login');
    redirect_url = "https://www.itrip.com/ouzhou/";
</script>
<style>
    .rightBar .linkphone a:hover {
        text-decoration: underline;
    }

    .rightBar .linkqq a {
        margin-bottom: 0px !important;
        color: #fff;
        padding-left: 10px;
    }

    .rightBar .linkqq a:hover {
        background: #4d9def !important;
    }

    .rightBar .linkqq, .linkonline {
        display: block;
        text-decoration: none;
        position: relative;
        margin-bottom: 0px;
        overflow: hidden;
        padding-bottom: 5px;
    }

    .rightBar .linkqq div.del {
        background: #4d9def;
        width: 66px;
        display: block;
        line-height: 35px;
        text-align: left;
        position: absolute;
        top: 0;
        right: 30px;
        z-index: 9;
        opacity: 0;
        filter: alpha(opacity=0);
        transform: translateX(-10px);
        transition: all .3s ease-in-out;
    }

    .rightBar .linkqq div.del span {
        border: 5px transparent solid;
        border-left-color: #4D9DEF;
        position: absolute;
        right: 0;
        top: 12px;
    }

    .rightBar .linkqq i, .linkonline i {
        position: absolute;
        right: 0;
        top: 0;
        margin: 0;
        z-index: 10;
    }

    .rightBar .linkqq:hover, .linkonline:hover, .right-qrcode:hover {
        overflow: visible;
        background: #2972bc;
    }

    .rightBar .linkqq:hover div.del, .linkonline:hover div.del, .right-qrcode:hover div.del {
        transform: translateX(0);
        opacity: 1;
        filter: alpha(opacity=100);
    }

    .rightBar .linkqq:hover div.del span, .linkonline:hover .del span, .right-qrcode:hover .del span {
        right: -10px;
    }

    .rightBar .linkhd {
        display: block;
        position: absolute;
        top: 0;
        right: 0;
        width: 30px;
        height: 160px;
        background: url(//pic.itrip.com/img/rukou.jpg);
    }

    .rightBar .linkhd:hover {
        background: url(//pic.itrip.com/img/rukou.jpg);
    }

    .right-qrcode {
        position: relative;
        padding: 10px 0;
        height: 35px;
        cursor: pointer;
        overflow: hidden;
    }

    .right-qrcode .iconfont {
        margin: 0;
        top: 8px;
        font-size: 24px;
        color: #fff;
    }

    .right-qrcode div.del {
        background: #fff;
        width: 165px;
        padding: 0;
        box-shadow: 0px 0px 3px #eee;
    }

    .rightBar .right-qrcode div.hide {
        display: none;
    }

    .rightBar .right-qrcode div.del span {
        border: 5px transparent solid;
        border-left-color: #fff;
        position: absolute;
        right: -10px;
        top: 12px;
    }

    .rightBar .right-qrcode div.del .text {
        position: absolute;
        left: 0;
        bottom: 20px;
        width: 100%;
        font-size: 14px;
        line-height: 24px;
        color: #000;
        background-color: #fff;
        text-align: center;
    }

    .vip_nav {
        position: relative;
        right: 0;
        width: 30px;
        height: 160px;
        margin-bottom: 15px;
    }

    .vip_nav div, .vip_nav img {
        height: 160px;
    }

    .vip_nav_info {
        float: right;
        background-color: transparent;
        cursor: pointer;
        display: inline-block;
    }

    .vip_nav_index {
        float: left;
        display: none;
        cursor: pointer;
        position: absolute;
        right: 51px;
    }

    #rightbar-linktop {
        margin-bottom: 0;
    }
</style>
<div class="rightBar">
    <div class="vip_nav clearfix" style="margin-bottom:0;">
        <div class="vip_nav_info">
            <img src="${pageContext.request.contextPath}/itripimg/vip_rightbar_v1.png">
        </div>
        <div class="vip_nav_index">
            <img src="${pageContext.request.contextPath}/itripimg/vip_info_v1.png">
        </div>
    </div>

    <div class="right-qrcode" style="height: 60px">
        <i class="iconfont"></i>
        <span style="position:relative;top:5px;">
			APP
		</span>
        <div class="del hide" data-lv="1" style="box-shadow: none;background: transparent;width:151px;top:-36px; "><img
                src="${pageContext.request.contextPath}/itripimg/qrc-app-3.png"><span
                style="top:50px;border-left-color: #2b3b48;"></span></div>
        <div class="del" data-lv="15768" style="box-shadow: none;background: transparent;width:151px;top:-36px; "><img
                src="${pageContext.request.contextPath}/itripimg/qrc-app-3-15768.png"><span
                style="top:50px;border-left-color: #2b3b48;"></span></div>
        <div class="del hide" data-lv="15769" style="box-shadow: none;background: transparent;width:151px;top:-36px; ">
            <img src="${pageContext.request.contextPath}/itripimg/qrc-app-3-15769.png"><span
                style="top:50px;border-left-color: #2b3b48;"></span></div>
        <div class="del hide" data-lv="15783" style="box-shadow: none;background: transparent;width:151px;top:-36px; ">
            <img src="${pageContext.request.contextPath}/itripimg/qrc-app-3-15783.png"><span
                style="top:50px;border-left-color: #2b3b48;"></span></div>
    </div>
    <a class="linkphone" href="javascript:;" rel="nofollow" style="margin:10px 0 0;height:25px;">
        <div class="del" style="top:-40px;">
            <div class="pos_r">
                <p class="mb5">免费语音(推荐)</p>
                <p>
                    <object><a href="https://www.itrip.com/about/app?source=rightnav" target="_blank"
                               style="display: inline; margin: 0; color : #fff;">下载APP</a></object>
                    - 点击客服 - 免费语音
                </p>
                <p>电话咨询</p>
                <p>400-008-8177（仅限国内拨打）</p>
                <p>86-028-85223501（定制服务专线）</p>
                <span style="top:60px;"></span>
            </div>
        </div>
        <i class="icon icon_right_phone" style="top:15px;"></i>
    </a>
    <div class="right-qrcode J_hb_qrcode" style="display: none;">
        <i class="iconfont"></i>
        <div class="del" style="top:-110px;">
            <img src="${pageContext.request.contextPath}/itripimg/qrc-hb.jpg"><span
                style="top:122px;"></span>
        </div>
    </div>
    <div class="right-qrcode">
        <i class="iconfont"></i>
        <div class="del" style="top:-88px;">
            <img src="${pageContext.request.contextPath}/itripimg/qrc-gz-1.jpg"><span
                style="top:100px;"></span>
            <div class="text">关注微信公众号</div>
        </div>
    </div>
    <div class="rightBarBot">
        <a class="linkTop" id="rightbar-linktop" href="javascript:;">
            <div class="del">
                <div class="pos_r">
                    回到顶部
                    <span></span>
                </div>
            </div>
            <p><i class="icon icon_right_top"></i>TOP</p>
        </a>
    </div>
</div>
<div class="dialog_Feedback hide" id="feedBackDialog">
    <p class="f16 bold tc" data-title="title">意见反馈</p>
    <textarea data-content="content" placeholder="欢迎提出宝贵的意见和建议。我们会认真阅读，你的支持是对我们最大的鼓励和帮助。" name="feedbackContent"
              class="feedbackContent" maxlength="500"></textarea>
    <div class="fr pos_r grey">
        <span id="totalCount">您还可以输入500个字符</span>
    </div>
    <div class="pos_r FeedbackContact mt10">
        <label>联系方式：</label>
        <input type="text" placeholder="留下您的手机号或email" maxlength="30" style="width:200px;height: 20px;"
               name="contactInfo" class="contactInfo">
    </div>
    <div class="oh mt10 hide" id="verifyCode">
        <div class="pos_r FeedbackContact fl">
            <label>验&nbsp;&nbsp;证&nbsp;&nbsp;码：</label>
            <input type="text" placeholder="验证码" maxlength="6" style="width:100px;height: 25px;" name="verifyCode">
            <input type="hidden" id="showCode">
        </div>
        <img class="ml10 hand" title="看不清，请点我" id="img_verifycode_feedback" width="110" height="36" border="0">
    </div>
    <div class="oh mt10">
        <span id="errTip" class="warnning" style="color: #fda814; line-height: 21px; "></span>
    </div>
    <div class="oh mt10">
        <a href="javascript:;" class="btn-normal-blue fr w90" id="save">提交</a>
        <a href="javascript:;" class="btn-white fr w90 mr10" id="cancelBut">取消</a>
    </div>
</div>
<div class="dialog_Feedback black hide" id="feedbackErrorDialog">
    <div class="mod_layer_title bold f14">
        <h3>提示</h3>
    </div>
    <div class="mod_layer_cont">
        <div class="error_tip oh ml20 f14">
            <p>感谢您的反馈，我们尽快答复您！</p>
        </div>
    </div>
</div>
<div class="dialog_Feedback black hide" id="qaErrorDialog">
    <div class="mod_layer_title bold f14">
        <h3>提示</h3>
    </div>
    <div class="mod_layer_cont">
        <div class="error_tip oh ml20 f14">
            <p>提交成功，我们尽快答复您！</p>
        </div>
    </div>
</div>

<script type="text/javascript"
        src="${pageContext.request.contextPath}/itripjs/it_feedBack_201810290004.js"></script>


<script type="text/javascript">
    var isTest = location.href.indexOf("//www.itrip.com") > -1 ? false : true;
    //默认的ID
    var settingid = isTest ? "kf_9680_1448432403231" : "kf_9680_1447207361586";
    NTKF_PARAM = {
        siteid: "kf_9680",                   //小能提供企业id,
        settingid: settingid,  //小能分配的缺省客服组id
        uid: $.cookie('uin'),
        uname: $.cookie('acc'),
        isvip: "",
        userlevel: ""

    }
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/itripjs/ntkfstat.js"
        charset="utf-8"></script>
<script type="text/javascript">
    $(function () {
        //所有footer图懒加载
        $('img.lazy_footer').lazyload({
            placeholder: picHome + "/loading2.gif",
            effect: "fadeIn",
            threshold: 200,
            skip_invisible: true
        });
        //所有emoji转图
        $('.emoji').each(function () {
            var ori = $(this).html();
            var emoji = twemoji.parse(ori, {size: 16});
            $(this).html(emoji);
        });

        //登陆 注册 忘记密码 屏蔽客服
        function shieldKefu() {
            var url = location.href;
            if (url.indexOf('signup/index') != -1 || url.indexOf('login/index') != -1 || url.indexOf('findpwd/index') != -1) {
                $(".linkonline").remove();
            }
        }

        shieldKefu();

        //控制右侧二维码显示
        function qrCodeShow() {
            var lv = $.cookie('channelId');
            var el = $(".del").filter("[data-lv='" + lv + "']");
            if (el.length > 0) {
                el.removeClass('hide');
            } else {
                $(".del").filter("[data-lv='1']").removeClass('hide');
            }
        }

        qrCodeShow();

        function checkLogin() {
            if ($(".display_name").text() == "") {
                //未登录
                location.href = '/login/index?redirect_url=' + encodeURIComponent(location.href);
                return false;
            } else {
                //登陆
                return true;
            }
        }

        if ($('.linkonline .xiaoneng').length > 0) {
            $('.linkonline #au').click(function () {
                //小能分配的缺省客服组id
                if (checkLogin()) {
                    settingid = isTest ? 'kf_9680_1458962349823' : 'kf_9680_1458959605873';
                    NTKF.im_openInPageChat(settingid);
                }
            });
            $('.linkonline #au_order').click(function () {
                if (checkLogin()) {
                    settingid = 'kf_9680_1461738767319';
                    NTKF.im_openInPageChat(settingid);
                }

            });
            $('.linkonline #eu').click(function () {
                if (checkLogin()) {
                    settingid = isTest ? 'kf_9680_1458962367444' : 'kf_9680_1458895403086';
                    NTKF.im_openInPageChat(settingid);
                }

            });
            $('.linkonline #dny').click(function () {
                if (checkLogin()) {
                    settingid = isTest ? 'kf_9680_1458962302725' : 'kf_9680_1458960215090';
                    NTKF.im_openInPageChat(settingid);
                }

            });
            $('.linkonline #usa').click(function () {
                if (checkLogin()) {
                    settingid = isTest ? 'kf_9680_1458962323439' : 'kf_9680_1458960192283';
                    NTKF.im_openInPageChat(settingid);
                }

            });
            $('.linkonline #vip').click(function () {
                if (checkLogin()) {
                    settingid = 'kf_9680_1458959605873';
                    NTKF.im_openInPageChat(settingid);
                }

            });
            $('.linkonline #other-area').click(function () {
                if (checkLogin()) {
                    settingid = isTest ? 'kf_9680_1458962284605' : 'kf_9680_1458960269082';
                    NTKF.im_openInPageChat(settingid);
                }

            });
            //旅行顾问
            $('.linkonline #consult_travel').click(function () {
                if (checkLogin()) {
                    settingid = 'kf_9680_1458959605873';
                    NTKF.im_openInPageChat(settingid);
                }

            });
            //订单咨询
            $('.linkonline #consult_order').click(function () {
                if (checkLogin()) {
                    settingid = 'kf_9680_1461738767319';
                    NTKF.im_openInPageChat(settingid);
                }

            });
            //售前
            $('.linkonline #sale_before').click(function () {
                if (checkLogin()) {
                    settingid = 'kf_9680_1458959605873';
                    NTKF.im_openInPageChat(settingid);
                }

            });
            //售后
            $('.linkonline #sale_after').click(function () {
                if (checkLogin()) {
                    settingid = 'kf_9680_1461738767319';
                    NTKF.im_openInPageChat(settingid);
                }

            });
            //产品
            $('.linkonline #product').click(function () {
                if (checkLogin()) {
                    settingid = 'kf_9680_1458959605873';
                    NTKF.im_openInPageChat(settingid);
                }

            });
            //已有订单
            $('.linkonline #has_order').click(function () {
                if (checkLogin()) {
                    settingid = 'kf_9680_1461738767319';
                    NTKF.im_openInPageChat(settingid);
                }

            });
            //懒人服务
            $('.linkonline #vip_service').click(function () {
                if (checkLogin()) {
                    settingid = 'kf_9680_1471227292535';
                    NTKF.im_openInPageChat(settingid);
                }

            });
        }

        function noticeToggle() {
            var timer = null;
            clearInterval(timer);
            timer = setInterval(function () {
                $(document).on('mouseenter', ".vip_nav_info", function () {
                    $(".vip_nav_info").css("background-color", "#fecf07");
                    $(document).find(".vip_nav_index").show();
                });
            }, 500);

            timer = setInterval(function () {
                $(document).on('mouseleave', ".vip_nav_info", function () {
                    $(".vip_nav_info").css("background-color", "transparent");
                    $(document).find(".vip_nav_index").hide();
                });

            }, 500);

            timer = setInterval(function () {
                $(document).on('mouseenter', ".vip_nav_index", function () {
                    $(".vip_nav_info").css("background-color", "#fecf07");
                    $(this).show();
                });
            }, 500);

            timer = setInterval(function () {
                $(document).on('mouseleave', ".vip_nav_index", function () {
                    $(".vip_nav_info").css("background-color", "transparent");
                    $(this).hide();
                });
            }, 500);
        }

        $(".vip_nav_info").click(function () {
            window.open("https://www.itrip.com/vip?source=navright");
        });

        $(".vip_nav_index").click(function () {
            window.open("https://www.itrip.com/vip?source=navright");
        });

        noticeToggle();
    });
</script>
<div class="login_footer ">
    <div class="wrap tc grey">
        <div class="mt30">
            <a class="link_grey" href="https://www.itrip.com/about/introduction" target="_blank">公司简介</a> |
            <a class="link_grey" href="https://www.itrip.com/about/qualification" target="_blank">公司资质</a> |
            <a class="link_grey" href="https://www.itrip.com/about/contact" target="_blank">联系我们</a> |
            <a class="link_grey" href="#">加入我们</a> |
            <a class="link_grey" href="https://www.itrip.com/about/help" target="_blank">帮助中心</a> |
            <a class="link_grey" href="https://www.itrip.com/about/Q&amp;A">常见问题</a> |
            <a class="link_grey" href="#">网站条款</a> |
            <a class="link_grey" href="https://www.itrip.com/about/bookingProtocol">预定协议</a> |
            <a class="link_grey" href="https://www.itrip.com/about/cancelPolicy" target="_blank">修改和取消政策</a> |
            <a class="link_grey" href="#">客服服务</a> |
            <a class="link_grey" href="#">网站地图</a>
        </div>
        <p class="mt20">
            copyright © 2018 iTrip.com | 备案号：蜀ICP备 10201151号-1
        </p>
    </div>
</div>
<!-- itrip统计 -->

<script type="text/javascript" src="${pageContext.request.contextPath}/itripjs/des.js"></script>
<script src="${pageContext.request.contextPath}/itripjs/doT.js"></script>
<script type="text/javascript">
    /*
    data-i-op-address:
    data-i-op-reviewid
     */
    (function () {
        var timer = 0;
        var pic2_home = pic2Home;
        var pic_home = picHome;
        var _cookie = {
            get: function (key) {
                if (!key)
                    return null;
                key = key.toUpperCase();
                var cks = document.cookie.split("; ");
                var tmp = null;
                for (var i = 0; i < cks.length; i++) {
                    tmp = cks[i].split("=");
                    if (tmp[0].toUpperCase() == key)
                        return unescape(tmp[1]);
                }
                return null;
            },
            set: function (options) {
                options = $.extend({
                    key: "",
                    value: "",
                    expires: 0,
                    path: "",
                    domain: document.domain
                }, options);

                var ck = [options.key + "=" + escape(options.value)];
                if (!isNaN(options.expires) && options.expires != 0) {//
                    var date = new Date();
                    date.setTime(date.getTime() + options.expires * 60 * 1000);
                    ck.push(";expires=" + date.toUTCString());
                }

                ck.push(";path=" + (options.path || "/"));
                if (options.domain && options.domain.toLowerCase() !== "localhost")
                    ck.push(";domain=" + options.domain);
                document.cookie = ck.join("");
            }
        };
        var iclick = {
            init: function () {
                setTimeout(function () {
                    iclick.getPath();
                    iclick.getUid();
                }, 200);
            },
            getPath: function () {
                var
                    protocol = location.protocol,
                    host = window.location.host;
                this.uidPath = protocol + "//" + host + "/main/getUniqueVisitorId";
                this.reportPath = protocol + "//" + host + "/main/reloadPosition";
                this.reportPathProduct = protocol + "//" + host + "/main/product/reloadPosition";
            },
            getUid: function () {
                var uid = _cookie.get('uid') || iclick.uid;
                if (uid) {
                    //
                    if ($(".itrip_recommend").length > 0) {
                        this.reportInfoProduct();
                    } else {
                        this.reportInfo();
                    }
                } else {
                    //
                    this.createUid();
                }

            },
            createUid: function () {
                if (timer > 3) {
                    timer = 0;
                    return;
                }
                timer++;
                var params = {
                    "client": {
                        'userAgent': navigator.userAgent.split(" ").join()
                    }
                }
                if (typeof(_ITRIP_DESKEY) == "undefined") {
                    window._ITRIP_DESKEY = 'itripOperation@aoliday.comBySy&Cc';
                }
                if (typeof(strEnc) == 'function') {
                    params.client = strEnc(JSON.stringify(params.client), window._ITRIP_DESKEY);
                } else {
                    setTimeout(function () {
                        iclick.createUid();
                    }, 2000);
                    return;
                }
                $.ajax({
                    type: "post",
                    async: true,
                    url: iclick.uidPath,
                    data: params,
                    success: function (res) {
                        _cookie.set({key: "uid", value: res.data, expires: "365"});
                        iclick.uid = res.data;
                        if ($(".itrip_recommend").length > 0) {
                            iclick.reportInfoProduct();
                        } else {
                            iclick.reportInfo();
                        }
                    },
                    error: function () {
                        setTimeout(function () {
                            iclick.getUid();
                        }, 500);
                    }
                });
            },
            reportInfoProduct: function () {
                var _u = iclick.getAllCids();
                iclick.doReportProduct(_u.infosP);
                //iclick.doReportProduct("9174");
                iclick.doReport(_u.infos);
            },
            reportInfo: function () {
                iclick.doReport(iclick.getAllCids().infos);
            },
            doReportProduct: function (ids) {
                var params = {
                    uid: _cookie.get('uid') || iclick.uid,
                    cids: ids,
                    excludeIds: iclick.getAllCids().infosP
                }
                if (!params.uid || !params.cids) {
                    return;
                }
                $.ajax({
                    type: "get",
                    async: false,
                    url: iclick.reportPathProduct,
                    data: params,
                    success: function (res) {
                        if (res.data) {
                            iclick.refreshProduct(res.data);
                        }
                    },
                    error: function (res) {
                        console.log("upload error");
                    }
                });
            },
            doReport: function (ids) {
                var params = {
                    uid: _cookie.get('uid') || iclick.uid,
                    cids: ids,
                    excludeIds: iclick.getAllCids().infos
                }
                if (!params.uid || !params.cids) {
                    return;
                }
                $.ajax({
                    type: "get",
                    async: false,
                    url: iclick.reportPath,
                    data: params,
                    success: function (res) {
                        iclick.doTorefresh(res);
                    },
                    error: function (res) {
                        console.log("upload error");
                    }
                });
            },
            doTorefresh: function (res) {
                if ($(".money_sw_box_txt").attr("data-id")) {
                    if (res.data && res.data.reservePositions) {
                        iclick.refresh(res.data);
                    }

                    /* if(res.data && res.data.reserveReviews){
                      iclick.refreshReviews(res.data.reserveReviews);
                    } */
                } else {
                    setTimeout(function () {
                        iclick.doTorefresh(res);
                    }, 1000);
                }
            },
            refreshProduct: function (data) {
                //data-i-op-href //
                //data-i-op-xcts //
                //data-i-op-ywcs //
                //data-i-op-ywsc
                //data-i-op-bhjd:
                //data-i-op-icon
                //data-i-op-img:
                //data-i-op-purchase
                //data-i-op-price
                var item,
                    content,
                    invalidId;

                for (var i in data) {
                    item = data[i];
                    invalidId = i;
                    var interText;
                    if ($(".view-recommend").length > 0) {
                        interText = doT.template($("#recommendProduct1").text());
                    } else {
                        interText = doT.template($("#recommendProduct2").text());
                    }
                    $("[data-i-op='" + invalidId + "']").html(interText(item));
                    //
                    $("li[data-i-op='" + invalidId + "']").each(function () {
                        var name = $(this).attr("name");
                        if (name && name.indexOf('__AD_') > -1) {
                            $(this).attr("name", "__AD_" + item.positionCode + "_" + item.contentId);
                        }
                        $(this).attr("data-i-op", item.contentId);
                    });
                }
                $('img.lazy,img.lazy1').lazyload({
                    placeholder: picHome + "/loading2.gif",
                    effect: "fadeIn",
                    threshold: 200,
                    skip_invisible: false
                });
            },
            //banner
            refresh: function (res) {
                //data-i-op-title //
                //data-i-op-img:
                //data-i-op-productid:

                var item,
                    content,
                    invalidId,
                    data = res.reservePositions,
                    interText,
                    icons = res.productReviewIconUrls;
                for (var i = 0; i < data.length; i++) {
                    item = data[i];
                    invalidId = item.invalidId;

                    if (item.price) {
                        item.productReviewIconUrls = icons;
                        item.activityTypePromotion = res.activityTypePromotion;
                        item.inventoryEnabled = res.inventoryEnabled;
                        /* if($("[data-i-op='"+invalidId+"']").eq(0).parents(".pro_list").length > 0){
                            interText = doT.template($("#modProduct").text());
                        }else{
                            interText = doT.template($("#saleProduct").text());
                        }  */
                        interText = doT.template($("#saleProduct").text());
                        $("li[data-i-op='" + invalidId + "']").html(interText(item));
                    } else {
                        var imgsrc = $("img[data-i-op='" + invalidId + "'][data-i-op-img]").attr("src");
                        var _laststr = imgsrc && imgsrc.substring(imgsrc.indexOf('?'), imgsrc.length) || '';
                        //imgage
                        item.image && $("img[data-i-op='" + invalidId + "'][data-i-op-img]").each(function () {
                            var _img = item.image.indexOf('http') > -1 ? item.image : pic2_home + "/p/" + item.image;
                            if ($(this).attr("data-original")) {
                                $(this).attr("data-original", _img + "?" + _laststr);
                            } else {
                                $(this).attr("src", _img + "?" + _laststr);
                            }
                            $(this).attr("title", item.title);
                            $(this).attr("alt", item.title);
                        });

                        item.image && $("li[data-i-op='" + invalidId + "'][data-i-op-img],div[data-i-op='" + invalidId + "'][data-i-op-img]").each(function () {
                            var _img = item.image.indexOf('http') > -1 ? item.image : pic2_home + "/p/" + item.image;
                            _img = _img + "?imageView2/1/q/90";
                            $(this).css("background-image", 'url(' + _img + ')');
                        });


                        $("[data-i-op='" + invalidId + "'][data-i-op-href]").each(function () {
                            $(this).attr("href", item.url);
                            item.title && $(this).attr("alt", item.title);
                        });

                        //title
                        item.title && $("[data-i-op='" + invalidId + "'][data-i-op-titile]").each(function () {
                            $(this).text(item.title);
                        });

                    }
                    item.price && $("[data-i-op='" + invalidId + "'][data-i-op-price]").each(function () {
                        $(this).attr("data-price", item.price);
                        $(this).attr("data-cid", item.currencyId);
                        iclick.calPrice($(this), item.price, item.currencyId);
                    });
                    $("[data-i-op='" + invalidId + "']").each(function () {
                        var name = $(this).attr("name");
                        if (name && name.indexOf('__AD_') > -1) {
                            $(this).attr("name", "__AD_" + item.code + "_" + item.id);
                        }
                        $(this).attr("data-i-op", item.id);
                    });
                }
                $(document).find('img.lazy').lazyload({
                    placeholder: picHome + "/loading2.gif",
                    effect: "fadeIn",
                    threshold: 200,
                    skip_invisible: true
                });
            },
            calPrice: function (obj, money, fromCurrencyId) {
                var toCurrency = $(".money_sw_box_txt").attr("data-id");
                var allExRates = obj.attr('data-exRates');
                if (typeof allExRates != 'object' && allExRates.indexOf('=') > -1) {
                    allExRates = allExRates.replace(/\=/g, ':');
                }
                var exRatesObj;
                if (typeof allExRates == 'string') {
                    exRatesObj = eval("(" + allExRates + ")"); //string to json
                } else {
                    exRatesObj = allExRates;
                }
                var toRate = typeof exRatesObj[toCurrency] == 'object' ? exRatesObj[toCurrency].exRate : exRatesObj[toCurrency];
                var fromRate = typeof exRatesObj[fromCurrencyId] == 'object' ? exRatesObj[fromCurrencyId].exRate : exRatesObj[fromCurrencyId];

                var toMoney = (Number(money) * Number(fromRate) / Number(toRate));
                obj.empty().text(toMoney.toFixed(2));
            },
            //
            getUrl: function (reviewDetail) {
                var firstPic = reviewDetail.review.firstPic;
                var images = reviewDetail.images;
                if (firstPic) {
                    if (firstPic.indexOf('http') > -1) {
                        return firstPic;
                    } else {
                        return pic2_home + firstPic;
                    }
                } else {
                    if (images && images.length > 0) {
                        var _img = images[0];
                        if (_img.indexOf('http') > -1) {
                            if (_img.indexOf("http://www.aoliday.com/p") > -1 || _img.indexOf("https://www.aoliday.com/p") > -1) {
                                return _img.replace("//www.aoliday.com/p", pic2_home + "/p");
                            } else {
                                return _img;
                            }
                        } else {
                            if (_img.indexOf('/p') == -1) {
                                return pic2_home + "/p/" + _img;
                            } else {
                                return pic2_home + _img;
                            }
                        }
                    } else {
                        if (reviewDetail.productImages && reviewDetail.productImages.length > 0) {
                            return pic2_home + "/p/" + productDetail.productImages[0].small;
                        } else {
                            return pic_home + "/no-image.jpg";
                        }
                    }
                }
            },
            getIconPath: function (id) {
                if (productReviewIconUrls && productReviewIconUrls.length > 0 && productReviewIconUrls[id]) {
                    return pic2_home + "/p/" + productReviewIconUrls[id];
                }
            },
            getAllCids: function () {
                var infos = [], _infos = {}, id, infosP = [];
                $("[data-i-op]").each(function (item) {
                    id = $(this).attr("data-i-op");
                    if (id && !_infos[id]) {
                        _infos[id] = id;
                        if ($(this).parents(".itrip_recommend").length > 0) {
                            infosP.push(id);
                        } else {
                            infos.push(id);
                        }
                    }
                });
                return {
                    infos: infos.join(","),
                    infosP: infosP.join(",")
                }
            }
        }
        iclick.init();
        window.doReport = iclick.doReport;
        window.doReportProduct = iclick.doReportProduct;
    })();

</script>
<script id="recommendProduct1" type="text/x-dot-template">
    <div class="pro_img">
        <div class="tip_tit_red" style="display: none;">
            <span style="width: 55px;">新品上架</span> <i></i>
        </div>
        <a href="{{=it.contentUrl}}" target="_blank">
            <img class="pro_img lazy" data-original="//pic2.itrip.com/p/{{=it.image.small}}" width="300" height="200"
                 border="0">
            <div class="pro_desc_bg" style="height: 0px;"></div>
            <div class="pro_desc" style="height: 0px;">
                {{? it.xcts && it.xcts != ''}}
                <div class="mt15 oh" style="padding:0px 10px;color:#fff">
                    <div class="fl">行程特色：</div>
                    <div class="pro_desc_item fl">{{=it.xcts}}</div>
                </div>
                {{?}}

                {{? it.ywcs && it.ywcs != ''}}
                <p class="mt5">
                    <span>游玩城市：</span><span class="pro_desc_item">{{=it.ywcs}}</span>
                </p>
                {{?}}

                {{? it.ywsc && it.ywsc != ''}}
                <p class="mt5">
                    <span>游玩时长：</span>
                    <span class="pro_desc_item">{{=it.ywsc}}</span>
                </p>
                {{?}}

                {{? it.bhjd && it.bhjd != ''}}
                <p class="mt5 oh">
                    <span class="fl">包含景点：</span>
                    <span class="pro_desc_item fl" style="height:50px;overflow:hidden;">{{=it.bhjd}}</span>
                </p>
                {{?}}
            </div>
        </a>
        {{? it.promotionIconUrl !=null && it.promotionIconUrl !=''}}
        <div class="icon_count" style="position:absolute;top:0px; left:8px;">
            <img src="{{=it.promotionIconUrl}}" style="width: 70px;">
        </div>
        {{?}}
    </div>
    <div class="pro_cont">
        <a class="blue" href="{{=it.contentUrl}}" target="_blank"><h3 class="f14 mt10 normal pro_title">
            {{=it.name}}</h3></a>
        <p class="mt5 darkgrey clearfix">
				<span class="fl">
					{{? it.confirmRightNow == 1}}
					<img src="//pic.itrip.com/img/product/comfirm.jpg" width="61" height="20" style="margin-top:-8px;">
					{{?}}
				</span>
            {{? it.activityType == 1 && it.remainInventory > 0 && it.enableInventory == 1}}
            <span class="fr price_label orange mtd10">仅剩{{=it.remainInventory}}</span>
            {{??}}
            <span class="grey fr" data-hide-marketprice="true">&nbsp;</span>
            {{?}}
        </p>
        <p class="darkgrey clearfix">
            <span class="fl">已有{{=it.purchaseNum}}人购买</span>
            <span class="orange fr bold {{? it.activityType == 1 && it.remainInventory > 0 && it.enableInventory == 1}} new_style ms {{? it.confirmRightNow == 1}}mtd10{{?}}{{?}}">
					<label class="js_curCode">{{=it.currencySymbol}}</label>&nbsp;&nbsp;
					<label class="js_curMoney" data-exRates='' data-cid="{{=it.productBase.currencyId}}"
                           data-price="{{=it.startPrice.oriPrice}}">{{=it.startPrice.price}}</label>
					起
				</span>
            {{? it.activityType == 1 && it.remainInventory > 0 && it.enableInventory == 1}}
            <span class="fr ms-title {{? it.confirmRightNow == 1}}mtd10{{?}}"><img
                    src="//pic.itrip.com/img/ms_icon_new.png" width="44" height="24"></span>
            {{?}}
        </p>
    </div>
</script>
<script id="recommendProduct2" type="text/x-dot-template">
    {{? it.promotionIconUrl}}
    <div class="ele-icon"><img src="{{= it.promotionIconUrl}}" style="width: 45px;height: 45px;"></div>
    {{?}}
    <div class="recommend_img fl"><a href="{{= it.contentUrl}}" target="_blank"><img class="lazy"
                                                                                     data-original="//pic2.itrip.com/p/{{=it.image.small}}"
                                                                                     width="180" height="120"></a></div>
    <div class="recommend_info fr">
        <a href="{{=it.contentUrl}}" target="_blank" class="blue"><h3 class="f16 normal text_ellipsis">{{=it.name}}</h3>
        </a>
        <p class="mt10 f14 retext">{{=it.xcts}}</p>
        <p class="oh mt20">
            <a class="btn-insur fr" href="{{=it.contentUrl}}" target="_blank">去看看<i class="icon-delta-right"></i></a>
            <span class="f12 orange fr mr15 {{? it.activityType == 1 && it.remainInventory>0 && (it.enableInventory == 1)}} new_style ms mt10{{?}}">
					<label class="{{? it.activityType == 1 && it.remainInventory>0 && (it.enableInventory == 1)}} f16 {{??}} f24 {{?}} bold">
						<label class="js_curCode">{{=it.currencySymbol}}</label>
						<label class="js_curMoney" data-exRates='' data-cid="{{=it.productBase.currencyId}}"
                               data-price="{{=it.startPrice.oriPrice}}">{{=it.startPrice.price}}</label>
					</label>起
				</span>
            {{? it.activityType == 1 && it.remainInventory>0 && (it.enableInventory == 1)}}
            <span class="fr ms-title mt10"><img src="//pic.itrip.com/img/ms_icon_new.png" width="44" height="24"></span>
            {{??}}
            <span class="grey fr mr15 f14" data-hide-marketprice="true">&nbsp;</span>
            {{?}}
            {{? it.activityType == 1 && it.remainInventory>0 && (it.enableInventory == 1)}}
            <span class="fr mr15 f14 orange mt10">仅剩{{=it.remainInventory}}</span>
            {{?}}
        </p>
    </div>
</script>
<script id="saleProduct" type="text/x-dot-template">
    <!---->
    <a name='__AD_{{=it.code}}{{=it.id}}' data-i-op="{{=it.id}}" data-i-op-href="" href="{{=it.url}}" target="_blank">
        {{? it.image && it.image != ''}}
        <img class="lazy" data-i-op="{{=it.id}}" data-i-op-img=""
             data-original="//pic2.itrip.com/p/{{=it.image}}?imageView2/5/w/218/h/138/q/100"
             width="218" height="138" border="0" alt="{{=it.title}}">
        {{?? }}
        <img data-i-op="{{=it.id}}" data-i-op-img class="lazy" data-original="//pic.itrip.com/img/no-image.jpg"
             width="218" height="138" border="0">
        {{?}}
    </a>
    {{? it.productReviewIconUrls && it.productReviewIconUrls[it.productId]}}
    <i class="icon_sale" style="position:absolute;top:-1px; left:-2px;">
        <img src="//pic2.itrip.com/p/{{=it.productReviewIconUrls[it.productId]}}">
    </i>
    {{?? it.productPromotions && it.productPromotions.length > 0 && it.productPromotions[0].promotionIcon}}
    <i class="icon_sale" style="position:absolute;top:-1px; left:5px;">
        <img src="//pic2.itrip.com/p/{{=it.productPromotions[0].promotionIcon}}" style="width: 60px; height: 60px;">
    </i>
    {{?}}
    {{? it.activityType == it.activityTypePromotion && it.productPromotions.length > 0 && it.productPromotions[0].remainInventory > 0 && it.productPromotions[0].enableInventory == it.inventoryEnabled}}
    <div class="ms-count">
        <div class="pos_r">
            <p class="ms-bag"></p>
            <p class="ms-text">仅剩 </p>
        </div>
    </div>
    {{?}}
    <div class="proinfo oh">
        <p class="f14 mt10 oh" style="height:42px;">
            <a name='__AD_{{=it.code}}{{=it.id}}' data-i-op="{{=it.id}}" data-i-op-href="" data-i-op-titile=""
               href="{{=it.url}}"
               title="{{=it.title}}" target="_blank">{{=it.title}}</a>
        </p>
        <p class="oh mt5 price_label">
      <span class="fr pri {{? it.activityType == it.activityTypePromotion && it.productPromotions.length > 0 && it.productPromotions[0].remainInventory > 0 && (it.productPromotions[0].enableInventory == it.inventoryEnabled)}} new_style ms{{?}}">
        <label class="js_curCode f12"></label>&nbsp;
        <label data-i-op="{{=it.invalidId}}" data-i-op-price class="js_curMonery_exten f16"
               data-cid="{{=it.currencyId}}" data-exRates=''
               data-price="{{=it.price}}">
      </label><label class="f12">&nbsp;起</label>
    </span>
            {{? it.activityType == it.activityTypePromotion && it.productPromotions.length > 0 &&
            it.productPromotions[0].remainInventory > 0 && (it.productPromotions[0].enableInventory ==
            it.inventoryEnabled)}}
            <span class="fr"><img src="//pic.itrip.com/img/ms_icon_new.png" width="44" height="24"></span>
            {{?}}
        </p>
    </div>
    <div class="bor"></div>
</script>
<script>
    function getAreaIdCookies(name) {
        var arr, reg = new RegExp("(^| )" + name + "=([^;]*)(;|$)");
        if (arr = document.cookie.match(reg))
            return unescape(arr[2]);
        else
            return null;
    }

</script>

<script type="text/javascript">
    var _hmt = _hmt || [];
    (function () {
        var areaId = '';
        var areaName = '';
        if (areaId == '1') {
            areaName = '欧洲';
        } else if (areaId == '2') {
            areaName = '澳洲';
        } else if (areaId == '3') {
            areaName = '新斐';
        } else if (areaId == '4') {
            areaName = '东南亚';
        } else if (areaId == '5') {
            areaName = '美洲';
        }
        if (areaName != '') {
            _hmt.push(['_setCustomVar', 1, 'site_pdp', areaName, 3]);
        }
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?a63f93d647323db53fe9d21befcaabcd";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>
<script type="text/javascript">
    if (getAreaIdCookies('uin') && getAreaIdCookies('uin').length > 0) {
        var _ozuid = getAreaIdCookies('uin');
    }

    if (_ozprm) {
        var _ozprm = _ozprm;
    } else {
        var _ozprm = '';
        if ($(".cur").length > 0) {
            _ozprm = "cid99=" + $.trim($(".cur").html());
        }
    }
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/itripjs/o_code_n.js"></script>

<!-- 360统计 -->
<!-- Global site tag (gtag.js) - Google AdWords: 949765398 -->
<script>
    var _mvq = _mvq || [];
    _mvq.push(['$setAccount', 'm-253629-0']);
    _mvq.push(['$logConversion']);

    window.dataLayer = window.dataLayer || [];

    function gtag() {
        dataLayer.push(arguments);
    }

    gtag('js', new Date());
    gtag('config', 'AW-949765398');
</script>
<!-- Facebook Pixel Code -->
<script>

    window.onload = function () {
        <!--facebook-->
        !function (f, b, e, v, n, t, s) {
            if (f.fbq) return;
            n = f.fbq = function () {
                n.callMethod ?
                    n.callMethod.apply(n, arguments) : n.queue.push(arguments)
            };
            if (!f._fbq) f._fbq = n;
            n.push = n;
            n.loaded = !0;
            n.version = '2.0';
            n.queue = [];
            t = b.createElement(e);
            t.async = !0;
            t.src = v;
            s = b.getElementsByTagName(e)[0];
            s.parentNode.insertBefore(t, s)
        }(window,
            document, 'script', 'https://connect.facebook.net/en_US/fbevents.js');

        fbq('init', '1938846466375704'); // Insert your pixel ID here.
        fbq('track', 'PageView');

        <!--google-->
        // 定义全站营销代码
        var ggConversion = function () {
            var codeScript;
            var loadScript;
            var headScript;
            var wow = document.getElementById('wowo');
            var headScript = document.getElementsByTagName("script")[0];
            var elemImg = document.createElement('div');
            var imgSrc = '<img height="1" width="1" style="border-style:none;display:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/949765398/?value=0&guid=ON&script=0"/>';
            document.getElementsByTagName('body')[0].appendChild(elemImg);
            elemImg.innerHTML = imgSrc;
        };
        // 加载统计代码
        (function (i, s, o, g, r, a, m) {
            i["GoogleAnalyticsObject"] = r;
            i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date();
            a = s.createElement(o),
                m = s.getElementsByTagName(o)[0];
            a.async = 1;
            a.src = g;
            m.parentNode.insertBefore(a, m)
        })(window, document, "script", "//www.google-analytics.com/analytics.js", "ga");

        ga("create", "UA-61956206-1", "auto");
        ga("send", "pageview");
        // 加载营销代码
        ggConversion();

        <!-- Global site tag (gtag.js) - Google AdWords: 949765398 -->
        (function () {
            var site = document.createElement('script');
            site.type = 'text/javascript';
            site.async = true;
            site.src = "https://www.googletagmanager.com/gtag/js?id=AW-949765398";
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(site, s);
        })();

        <!--360-->
        (function () {
            var mvl = document.createElement('script');
            mvl.type = 'text/javascript';
            mvl.async = true;
            mvl.src = ('https:' == document.location.protocol ? 'https://static-ssl.mediav.com/mvl.js' : 'http://static.mediav.com/mvl.js');
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(mvl, s);
        })();

        <!--GrowingIO-->
        !function (e, t, n, g, i) {
            e[i] = e[i] || function () {
                (e[i].q = e[i].q || []).push(arguments)
            }, n = t.createElement("script"), tag = t.getElementsByTagName("script")[0], n.async = 1, n.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + g, tag.parentNode.insertBefore(n, tag)
        }(window, document, "script", "assets.growingio.com/2.1/gio.js", "gio");
        gio('init', '85a6b38dd701488ca63d51cb8211101d', {'setImp': 'false'});
        gio('send');
        <!--用户-->
        // 发送登录用户变量API
        gio('people.set', "loginUserId", (getAreaIdCookies("uin") || ''));

        // 发送访问用户变量API
        gio('visitor.set', "visitor_id", (getAreaIdCookies("gr_user_id") || ''));

        <!--详情页-->
        <!--资金状态-->
        <!--购物车是否有产品-->
        <!--搜索-->


        //运营位gio统计
        $("body").on("click", 'a[data-i-op]', function () {
            var opId = $(this).attr("data-i-op");
            if (opId) {
                try {
                    gio('evar.set', 'innerads', opId);
                    gio('track', opId);
                } catch (e) {

                }
            }
        })
        //标签点击
        $("body").on("click", '[tag-id]', function () {
            try {
                var tagId = $(this).attr("tag-id");
                gio('track', 'pc_label', {'label_content': tagId});
                gio('evar.set', 'labels', tagId);
            } catch (e) {

            }
        });
        //header 下载app 点击 Google统计
        $('[href="//www.itrip.com/about/app"]').click(function () {
            gtag('event', 'conversion', {'send_to': 'AW-949765398/EpDnCM-bhI0BEJaK8cQD'});
        })
        <!--product_type -->
    }
</script>
<noscript>< img height="1" width="1" style="display:none"
    src="https://www.facebook.com/tr?id=1938846466375704&ev=PageView&noscript=1"
    />
</noscript>
<!-- DO NOT MODIFY -->
<!-- End Facebook Pixel Code -->
<script>
    try {
        gtag('event', 'conversion', {
            'send_to': 'AW-949765398/As-pCLOE9VoQlorxxAM',
            'value': 1.0,
            'currency': 'CNY'
        });
    } catch (e) {
        console.log(e)
    }
</script>


<iframe style="width: 0px; height: 0px; display: none; overflow: hidden;"
        src="${pageContext.request.contextPath}/itripother/PMProxy.html"></iframe>
<div style="display: none; font-size: 14px;"></div>
<div class="error_info" style="display: none; width: 0px;"></div>
<div class="error_info" style="display: none; width: 0px;"></div>
<div class="error_info" style="display: none; width: 0px;"></div>
<div class="error_info" style="display: none; width: 0px;"></div>
<div class="error_info" style="display: none; width: 0px;"></div>
<div class="error_info" style="display: none; width: 0px;"></div>
<div class="error_info" style="display: none; width: 0px;"></div>
<div class="error_info" style="display: none; width: 0px;"></div>
<div class="error_info" style="display: none; width: 0px;"></div>
<div class="error_info" style="display: none; width: 0px;"></div>
<div class="error_info" style="display: none; width: 0px;"></div>
<div class="error_info" style="display: none; width: 0px;"></div>
<div class="error_info" style="display: none; width: 0px;"></div>
<div class="error_info" style="display: none; width: 0px;"></div>
<div class="error_info" style="display: none; width: 0px;"></div>
<div><img style="border-style:none;display:none;" alt=""
          src="${pageContext.request.contextPath}/itripimg/a.gif" width="1" height="1"></div>
<iframe style="display: none;" src="${pageContext.request.contextPath}/itripother/pixel.html"></iframe>
</body>
</html>
