(function (factory) {
    if (typeof define === 'function') {
        define(factory);
    } else {
        factory();
    }
})(function (require) {
    var loginPlugin = function () {
        var mobileReg = /^1\d{10}$/;
        var emailReg = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        var spaceKeyReg = /\s/;
        var emailList = ["", "@qq.com", "@126.com", "@163.com", "@vip.qq.com", "@yeah.net", "@hotmail.com", "@sina.com", "@gmail.com", "@tom.com", "@139.com"];

        var pwdUtil = {
            checkPassWord: function (string) {
                return string.replace(/^(?:(?=.{4})(?=.*([a-z])|.)(?=.*([A-Z])|.)(?=.*(\d)|.)(?=.*(\W)|.).*|.*)$/, "$1$2$3$4").length;
            },
            keyStr: "ABCDEFGHIJKLMNOP" + "QRSTUVWXYZabcdef" + "ghijklmnopqrstuv" + "wxyz0123456789+/" + "=",
            encode64: function (input) {
                var output = "";
                var chr1, chr2, chr3 = "";
                var enc1, enc2, enc3, enc4 = "";
                var i = 0;
                do {
                    chr1 = input.charCodeAt(i++);
                    chr2 = input.charCodeAt(i++);
                    chr3 = input.charCodeAt(i++);
                    enc1 = chr1 >> 2;
                    enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
                    enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
                    enc4 = chr3 & 63;
                    if (isNaN(chr2)) {
                        enc3 = enc4 = 64;
                    } else if (isNaN(chr3)) {
                        enc4 = 64;
                    }
                    output = output +
                        this.keyStr.charAt(enc1) +
                        this.keyStr.charAt(enc2) +
                        this.keyStr.charAt(enc3) +
                        this.keyStr.charAt(enc4);
                    chr1 = chr2 = chr3 = "";
                    enc1 = enc2 = enc3 = enc4 = "";
                } while (i < input.length);
                return output;
            }
        };

        function moveSelect(step) {
            var lis = $(".user-tips li");
            if (!lis) {
                return
            }
            window.active = window.active && window.active > 0 ? window.active : 0;
            active += step;
            if (active < 0) {
                active = 0
            } else {
                if (active >= lis.length) {
                    active = lis.size() - 1
                }
            }
            lis.removeClass("on");
            $(lis[active]).addClass("on");
            //scroll when move with arrow key
            $('.user-tips').scrollTop(31 * active);
        }

        function inputKeyupEvent(input, hintTips) {
            input.keyup(function (e) {
                var email = $(this).val();
                var keycode = e.keyCode;
                var li = "";
                if (email.length > 0) {
                    hintTips.fadeIn()
                } else {
                    hintTips.hide()
                }
                for (var i = 0; i < emailList.length; i++) {
                    if (email.indexOf("@") != -1 && email.indexOf("@") != 0) {
                        var txtIndex = email.indexOf("@");
                        var isEnd = txtIndex + 1 === email.length ? true : false;
                        if (isEnd) {
                            li += "<li>" + email + emailList[i].slice(1) + "</li>"
                        } else {
                            var txt = email.slice(txtIndex + 1);
                            if (emailList[i].slice(1).indexOf(txt) != -1 && emailList[i].slice(1).indexOf(txt) == 0) {
                                li += "<li>" + email.slice(0, txtIndex) + emailList[i] + "</li>"
                            }
                        }
                    } else {
                        li += "<li>" + email + emailList[i] + "</li>"
                    }
                }
                hintTips.html(li);
                if (keycode === 38) {
                    e.preventDefault();
                    moveSelect(-1)
                } else {
                    if (keycode === 40) {
                        e.preventDefault();
                        moveSelect(1)
                    } else {
                        if (keycode === 13) {
                            e.preventDefault();
                            moveSelect(0);
                            var selected = hintTips.find(".on").html();
                            if (selected && selected != '') {
                                $(this).val(selected);
                            }
                            hintTips.hide();
                            //$(this).blur()
                        } else {
                            active = -1
                        }
                    }
                }

            });
        }

        $.isEmail = function (emailStr) {
            return emailReg.test($.trim(emailStr));
        };

        $.isMobilePhone = function (phoneStr) {
            return mobileReg.test($.trim(phoneStr));
        };

        $.pwdEncoding = function (pwdStr) {
            return $.trim(pwdUtil.encode64(pwdStr));
        };

        $.redirect = function (url) {
            if (url) {
                window.location.replace(url);
            } else {
                window.location.replace(accessRoot);
            }
        }
        $.getCurrentEncodingUrl = function () {
            return encodeURIComponent(window.location.href);
        }

        $.isContainsSpaceKey = function (str) {
            return spaceKeyReg.test(str);
        }

        $.pwdValidation = function (pwd, errorTips) {
            if (!pwd) {
                errorTips.text('请输入密码');
                return false;
            }
            if ($.isContainsSpaceKey(pwd)) {
                errorTips.text('密码不能包含空格');
                return false;
            }
            if (pwd.length < 6) {
                errorTips.text('您输入的密码过短');
                return false;
            }
            if (pwd.length > 20) {
                errorTips.text('您输入的密码过长');
                return false;
            }

            return true;
        }


        //invoke sample : $.emailInputHint("#email","#email_tips");

        $.emailInputHint = function (inputId, hintId) {
            var input = $(inputId);
            var hintTips = $(hintId);
            input.blur(function (event) {
                hintTips.fadeOut();
            });

            inputKeyupEvent(input, hintTips);

            hintTips.on("click", "li", function (event) {
                var email = $(this).html();
                input.val(email);
                input.focus();
                return false;
            });
        }

    };
    if (require) {
        return loginPlugin();
    } else {
        loginPlugin();
    }
});

