 function  KeyBoard() { 
	 			
			    function randomSortOne(a, b) {  
			        return Math.random() > 0.5 ? 1 : -1;  
			    }   
			  
			    function randomSortTwo(oldArr) {  
			        var newArr = new Array;  
			        var length = oldArr.length;  
			        for(var i = 0; i < length; i ++) {  
			            newArr[i] = oldArr.splice(Math.floor(Math.random() * oldArr.length), 1);  
			        }  
			        return newArr;  
			    }  
			  
			   
			    function getRandomNumber() {  
			        var oldArr = new Array;  
			        for(var i = 0; i < 10; i ++)   
			            oldArr[i] = i;  
			        oldArr.sort(randomSortOne);  
			        return oldArr;  
			    }   
			  
			    /** 
			     * 获取随机字符数组 
			     * @param startASCII 开始字符对应ASCII的值 
			     * @param charNum    字符个数 
			     * @returns {Array}  排序后字符数组 
			     */  
			    function getRandomNomarlChar(startASCII, charNum) {  
			        var charArr = new Array;  
			        var i, j;  
			        for(i = 0, j = startASCII; i < charNum; i ++, j++) {  
			            charArr[i] = j;  
			        }  
			        charArr.sort(randomSortOne);  
			        for(i = 0; i < charArr.length; i++) {  
			            charArr[i] = String.fromCharCode(charArr[i]);  
			        }  
			        return charArr;  
			    }  
			  
			   
			    /** 
			     * 获取特殊无序数组 
			     * @param arr 特殊字符ASCII数组 
			     * @returns   无序的ASCII数组 
			     */  
			    function getRandomChar(arr) {  
			       arr.sort(randomSortOne);  
			       for(var i = 0; i < arr.length; i++) {  
			           arr[i] = String.fromCharCode(arr[i]);  
			       }  
			       return arr;  
			    }  
			  
			   
			    /** 
			     * 处理键盘事件，用于对软键盘操作 
			     * @param sInputId 输入框id 
			     * @param kb   
			     * @returns {Boolean} 
			     */  
			    function dealKeyBoardEvents(sInputId, kb) {  
			        $("td", kb).mouseover(function() {  
			            this.className += "kb-mouseover";  
			        }).mouseout(function() {  
			            this.className = this.className.replace("kb-mouseover", "");  
			        }).click(function() {  
			            if(this.id == "kbClose" || this.id == "kbEnter") {    //关闭和确定键  
			                kb.remove();                     
			                $("#" + sInputId).focus();               
			                return false;  
			            } else if(this.id == "kbClear") {                     //清除键  
			                $("#" + sInputId).val("");  
			                return false;  
			            } else if(this.id == "kbBackspace") {                 //回格键  
			                var sText = "";  
			                var ilen = ($("#" + sInputId).val()).length;  
			                if(ilen > 1) {  
			                    sText = ($("#" + sInputId).val()).substring(0, ilen - 1);  
			                }  
			                $("#" + sInputId).val(sText);  
			                return false;  
			            } else if(this.id == "kbCaps") {                      //大小写键  
			                $(".kb-key", kb).each(function(i, o) {  
			                    var num = o.innerHTML.charCodeAt(0);  
			                    if(num >= 97 && num <= 122) {  
			                        o.innerHTML = String.fromCharCode(num).toUpperCase();  
			                    } else if(num >= 65 && num <= 90) {  
			                        o.innerHTML = String.fromCharCode(num).toLowerCase();  
			                    }  
			                });  
			                return false;  
			            } else if(this.innerHTML == "&lt;" && !isMaxLength(sInputId)) {         
			                $("#" + sInputId).attr("value", $("#" + sInputId).val() + "\<");  
			            } else if(this.innerHTML == "&gt;" && !isMaxLength(sInputId)) {                   
			                $("#" + sInputId).attr("value", $("#" + sInputId).val() + "\>");  
			            } else if(this.innerHTML == "&amp;" && !isMaxLength(sInputId)) {                                  
			        $("#" + sInputId).attr("value", $("#" + sInputId).val() + "\&");  
			            } else if(this.innerHTML == "&nbsp;" && !isMaxLength(sInputId)) {                
			                $("#" + sInputId).attr("value", $("#" + sInputId).val() + "");  
			            } else {                                                
			                if(!isMaxLength(sInputId)) {  
			                    $("#" + sInputId).attr("value", $("#" + sInputId).val() + this.innerHTML);  
			                }  
			            }  
			        });  
			        return false;  
			    }   
			  
			    /** 
			     * 获取数字键盘 
			     * @param sInputId  输入框id 
			     * @param kb        容器jQuery对象 
			     * @returns {Boolean} 
			     */  
			    function getNumerKeyBoard(sInputId, kb) {  
			        var keyBoard = "<table class='kb-table'><tr>";  
			        var numArr = getRandomNumber();  
			        for(var i = 0; i < 10; i ++) {  
			            if(i == 3) keyBoard += "<td id='kbClose' class='kb-close' colspan='2'>关闭</td>";  
			            if(i == 6) keyBoard += "<td id='kbClear' class='kb-clear' colspan='2'>清除</td>";  
			            if(i == 9) keyBoard += "<td id='kbEnter' class='kb-enter' colspan='2'>确定</td>";  
			            if(i % 3 == 0 && i > 0) keyBoard += "</tr><tr>";  
			            keyBoard += "<td class='kb-key'>" + numArr[i] + "</td>";  
			        }  
			        keyBoard += "<td class='kb-key'>&nbsp;</td><td id='kbBackspace' class='kb-backspace' colspan='3'>← 回格</td></tr></table>";  
			        kb.html(keyBoard);  
			        kb.appendTo("body");  
			        dealKeyBoardEvents(sInputId, kb);  
			        return false;  
			    }   
			    /** 
			     * 获得全键盘 
			     * @param sInputId      输入框的id 
			     * @param kb            容器jQuery对象 
			     * @returns {Boolean} 
			     */  
			    function getAllKeyBoard(sInputId, kb) {  
			        var i, keyBoard = "<table class='kb-table'><tr>";  
			        var numArr = getRandomNumber();  
			        var charNomarlArr = getRandomNomarlChar(97, 26);  
			        var arr = [33,64,35,36,37,94,38,42,40,41,95,43];  
			        var charArr = getRandomChar(arr);  
			        //输出特殊字符  
			        for(i = 0; i < charArr.length; i ++) {  
			            keyBoard += "<td class='kb-key'>" + charArr[i] + "</td>";  
			        }  
			        keyBoard += "</tr><tr>";  
			        //输出数字  
			       for(i = 0; i < numArr.length; i ++) {  
			           keyBoard += "<td class='kb-key'>" + numArr[i] + "</td>";  
			       }  
			       keyBoard += "<td id='kbBackspace' class='kb-bankspace' colspan='2'>← 回格</td></tr><tr>";  
			       //输出字母字符  
			       for(i = 0; i < charNomarlArr.length; i++) {  
			           if(i == 10) keyBoard += "<td id='kbCaps' class='kb-caps' colspan='2'>大小写</td>";  
			           if(i == 20) keyBoard += "<td id='kbClear' class='kb-clear' colspan='2'>清除</td>";  
			           if(i % 10 == 0 && i > 0) keyBoard += "</tr><tr>";  
			           keyBoard += "<td class='kb-key'>" + charNomarlArr[i] + "</td>";  
			       }  
			       keyBoard += "<td colspan='3' id='kbClose' class='kb-close'>关闭</td>";  
			       keyBoard += "<td id='kbEnter' colspan='3' class='kb-enter'>确定</td></tr></table>";  
			       kb.html(keyBoard);  
			       kb.appendTo("body");  
			       dealKeyBoardEvents(sInputId, kb);  
			       return false;  
			    }   
			  
			    /** 
			     * 是否达到输入的最大长度 
			     * @param sInputId      输入框的id 
			     * @returns {Boolean} 
			     */  
			    function isMaxLength(sInputId) {  
			        var sValue = $("#" + sInputId).attr("maxlength");  
			        if(sValue != null && sValue != undefined && sValue != "" && ($("#" + sInputId).val()).length == Number(sValue)) {  
			            return true;  
			        }  
			        return false;  
			    }   
			    /** 
			     * 显示键盘 
			     * @param sInputId      输入框的id 
			     * @param keyStatus     显示键盘的类型 
			     */  
			     this.showKeyBoard = function(sInputId, keyStatus) {  
			         $("#" + sInputId).focus(function() {  
			             this.blur();  
			         });  
			         var kb = $("#keyboard");  
			         if(kb.length != 0) {  
			             kb.remove();  
			             $("#" + sInputId).focus();  
			             return false;  
			         }  
			         kb = $("<div id='keyboard' class='kb-div'></div>");  
			         if(keyStatus == KeyStatus.KEY_NUMBER) {                   
			             getNumerKeyBoard(sInputId, kb);  
			         } else if(keyStatus == KeyStatus.KEY_ALL) {               
			             getAllKeyBoard(sInputId, kb);  
			         }  
			         // 配置显示键盘在输入框的位置  
			         var offset = $("#" + sInputId).offset();  
			         var left = offset.left;  
			         var height = $("#" + sInputId).height();  
			         var top = offset.top + height + 15;  
			         kb.css({left: left + "px", top: top + "px"});  
			    };  
			}  
			  
			/** 
			 * 键盘类型常量 
			 */  
			var KeyStatus = {  
			 KEY_NUMBER: 0,               //数字键盘  
			 KEY_ALL   : 1                //全键盘  
			};  