(function(exports){
	
	 alert('123');
  //input表示数字输入到的input框
  var MathKeyBoard = function(input, options){
    var body = document.getElementsByTagName('body')[0];
    //*可以用来判断是否存在数字键盘，如果存在,为了避免每次重复出现，可以删除
    var DIV_ID = options && options.divId || '__w_l_h_v_c_z_e_r_o_divid';
    //*使键盘显示在mathKey这个div区域内，因为mathKey是id,所以如果一个项目中要有2个地方显示数字键盘
    //可以在后面 或(||)上另一个getElementById (因为id是不能重复的，而这个地方又不能改为class)
    var DIV_GET = document.getElementById("mathKey"); 
    //?
    // if(document.getElementById(DIV_ID)){
    //   body.removeChild(document.getElementById(DIV_ID));
    // }
     
    this.input = input;
    //创建一个div,在下面用appendChild添加，如果要添加到div中，则用DIV_GET.appendChild，否则用body
    this.el = document.createElement('div');
     
    var self = this;
    var zIndex = options && options.zIndex || 1000;
    var width = options && options.width || '100%';
    var height = options && options.height || '193px';
    var fontSize = options && options.fontSize || '15px';
    var backgroundColor = options && options.backgroundColor || '#fff';
    var TABLE_ID = options && options.table_id || 'table_0909099';
    var mobile = typeof orientation !== 'undefined';
     
    this.el.id = DIV_ID;
    this.el.style.position = 'absolute';//这里如果要存在div中，需要改成relavite
    this.el.style.left = 0;
    this.el.style.right = 0;
    this.el.style.bottom = 0;
    this.el.style.zIndex = zIndex;
    this.el.style.width = width;
    this.el.style.height = height;
    this.el.style.backgroundColor = backgroundColor;
     
    //样式
    var cssStr = '<style type="text/css">';
    cssStr += '#' + TABLE_ID + '{text-align:center;width:100%;height:160px;border-top:1px solid #CECDCE;background-color:#FFF;}';
    cssStr += '#' + TABLE_ID + ' td{width:33%;border:1px solid #ddd;border-right:0;border-top:0;}';
    if(!mobile){
      cssStr += '#' + TABLE_ID + ' td:hover{background-color:#1FB9FF;color:#FFF;}';
    }
    cssStr += '</style>';
     
    //Button
    var btnStr = '<div style="width:60px;height:28px;background-color:#1FB9FF;';
    btnStr += 'float:right;margin-right:5px;text-align:center;color:#fff;';
    btnStr += 'line-height:28px;border-radius:3px;margin-bottom:5px;cursor:pointer;">完成</div>';
     
    //table,如果需要两个数字键盘，可以用if判断DIV_GET的id，DIV_GET.getAttribute("id")
    var tableStr = '<table id="' + TABLE_ID + '" border="0" cellspacing="0" cellpadding="0">';
      tableStr += '<tr><td>1</td><td>2</td><td>3</td></tr>';
      tableStr += '<tr><td>4</td><td>5</td><td>6</td></tr>';
      tableStr += '<tr><td>7</td><td>8</td><td>9</td></tr>';
      tableStr += '<tr><td>0</td>'; //".":<td style="background-color:#D3D9DF;">.</td>
      tableStr += '<td style="background-color:#D3D9DF;">删除</td><td style="background-color:#D3D9DF;">发送</td></tr>'; 
      tableStr += '</table>';
    this.el.innerHTML = cssStr + btnStr + tableStr;
     
    function addEvent(e){
      var ev = e || window.event;
      var clickEl = ev.element || ev.target;
      var value = clickEl.textContent || clickEl.innerText;
      if(clickEl.tagName.toLocaleLowerCase() === 'td' && value !== "删除" && value !== "发送"){
        if(self.input){
          self.input.value += value;
        }
      }else if(clickEl.tagName.toLocaleLowerCase() === 'div' && value === "完成"){
        body.removeChild(self.el);
      }else if(clickEl.tagName.toLocaleLowerCase() === 'td' && value === "删除"){
        //删除一个
        var num = self.input.value;
        if(num){
          var newNum = num.substr(0, num.length - 1);
          self.input.value = newNum;
        }
        //如果是重置的话，可以用self.input.value = "";
      }//可以继续添加
    }
     
    if(mobile){
      this.el.ontouchstart = addEvent;
    }else{
      this.el.onclick = addEvent;
    }
    //加入，可以在上面getElementById一个div,加入到此div中
    body.appendChild(this.el);
  }
   
  exports.MathKeyBoard = MathKeyBoard;
 
})