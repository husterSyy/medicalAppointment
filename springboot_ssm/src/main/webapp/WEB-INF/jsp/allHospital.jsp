<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>所有医院</title>
    
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="cache-control" content="no-cache">
    <meta http-equiv="expires" content="0">    
    <meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
    <meta http-equiv="description" content="This is my page">
    <!--
    <link rel="stylesheet" type="text/css" href="styles.css">
    -->
    <script type="text/javascript" src="js/jquery-1.7.1.js"></script>

	<style type="text/css">
	@charset "utf-8";
* {
    margin: 0;
    padding: 0;
    list-style-type: none;
}

a,
img {
    border: 0;
}

body {
    line-height: 2em;
    background-color: #ffffff;
    font-family: arial, helvetica, sans-serif;
    color: #666666;
    font-size: 12px
}

a {
    color: #666666;
    text-decoration: none;
    -webkit-transition-property: color;
    -moz-transition-property: color;
    -o-transition-property: color;
    transition-property: color;
    -webkit-transition-duration: .2s;
    -webkit-transition-timing-function: ease-in;
    -moz-transition-duration: .2s;
    -moz-transition-timing-function: ease-in;
    -o-transition-duration: .2s;
    -o-transition-timing-function: ease-in;
    transition-duration: .2s;
    transition-timing-function: ease-in
}

a:hover {
    color: #cd0606;
    text-decoration: underline
}


/* hc_lnav */

.hc_lnav {
    z-index: 9999;
    position: relative;
    width: 190px;
    margin: 40px 0 0 120px;
}

.hc_lnav .allbtn {
    z-index: 99999;
    position: relative
}

.hc_lnav .allbtn h2 {
    font-size: 14px;
    box-shadow: 2px 0px 6px -3px #428000;
    -webkit-box-shadow: 2px 0px 6px -3px #428000;
    -moz-box-shadow: 2px 0px 6px -3px #428000
}

.hc_lnav .allbtn h2 a {
    line-height: 36px;
    background-color: #358000;
    padding-left: 10px;
    width: 180px;
    display: block;
    font-family: 微软雅黑, 黑体;
    height: 36px;
    color: #ffffff;
    font-size: 14px;
    font-weight: normal
}

.hc_lnav .allbtn h2 a:hover {
    background-color: #358000;
    text-decoration: none;
    }

.hc_lnav .allbtn h2 i {}

.hc_lnav .allbtn h2 strong {}

.hc_lnav .allbtn ul {
    z-index: 99999;
    position: absolute;
    background-color: #60a411;
    width: 190px;
    display: block;/*可以设置菜单是显示还是隐藏   display：none；为隐藏*/
    height: 486px;
    top: 36px;
    left: 0px
}

body.hc_home .hc_lnav .allbtn ul {
    display: block
}

body.hc_list .hc_lnav .allbtn ul {
    display: block
}

.hc_lnav .allbtn ul li {
    padding-bottom: 7px;
    zoom: 1;
    clear: both;
    cursor: default
}

.hc_lnav .allbtn ul li .tx {
    background-image: url(../images/header/header_bg1.png);
    line-height: 35px;
    background-color: #559b0d;
    padding-left: 10px;
    background-repeat: no-repeat;
    background-position: right center;
    height: 35px;
    _background-image: none
}

.hc_lnav .allbtn ul li .tx a {
    font-family: 微软雅黑, 黑体;
    color: #ffffff;
    font-size: 14px;
    -webkit-transition: color 0.1s ease-out 0s;
    -moz-transition: color 0.1s ease-out 0s;
    -ms-transition: color 0.1s ease-out 0s;
    -o-transition: color 0.1s ease-out 0s;
    transition: color 0.1s ease-out 0s
}

.hc_lnav .allbtn ul li .tx a i {
    line-height: 25px;
    margin-top: 5px;
    width: 25px;
    background-position: 0px 0px;
    float: left;
    height: 25px;
    margin-right: 10px;
    text-decoration: none
}

.hc_lnav .allbtn ul li.a1 .tx a i {
    background-image: url(../images/header_ico1.png)
}

.hc_lnav .allbtn ul li.a2 .tx a i {
    background-image: url(../images/header_ico2.png)
}

.hc_lnav .allbtn ul li.a3 .tx a i {
    background-image: url(../images/header_ico3.png)
}

.hc_lnav .allbtn ul li.a4 .tx a i {
    background-image: url(../images/header_ico4.png)
}

.hc_lnav .allbtn ul li dl {
    zoom: 1;
    color: #ffffff;
    clear: both;
    overflow: auto;
    padding-top: 4px
}

.hc_lnav .allbtn ul li dl a {
    line-height: 22px;
    white-space: nowrap;
    float: left;
    color: #d9e7ce;
    margin-left: 6px;
    margin-right: 6px;
    -webkit-transition: color 0.1s ease-out 0s;
    -moz-transition: color 0.1s ease-out 0s;
    -ms-transition: color 0.1s ease-out 0s;
    -o-transition: color 0.1s ease-out 0s;
    transition: color 0.1s ease-out 0s
}

.hc_lnav .allbtn ul li dt {
    padding-left: 10px;
    width: 30px;
    float: left;
    padding-top: 1px
}

.hc_lnav .allbtn ul li dd {
    line-height: 22px;
    width: 150px;
    float: left;
    padding-top: 2px
}

.hc_lnav .allbtn ul li .pop {
    border-bottom: #599900 2px solid;
    position: absolute;
    border-left: medium none;
    padding-bottom: 10px;
    background-color: #fcfcfc;
    min-height: 466px;
    padding-left: 30px;
    width: 640px;
    padding-right: 30px;
    display: none;
    height: 464px;
    border-top: medium none;
    top: 0px;
    border-right: #599900 2px solid;
    padding-top: 10px;
    left: 190px;
    box-shadow: 4px 4px 5px -1px #999999;
    -webkit-box-shadow: 4px 4px 5px -1px #999999;
    -moz-box-shadow: 4px 4px 5px -1px #999999
}

.hc_lnav .allbtn ul li .pop h3 {
    display: none;
    font-size: 14px
}

.hc_lnav .allbtn ul li .pop dl {
    padding-bottom: 6px;
    color: #666666;
    padding-top: 6px
}

.hc_lnav .allbtn ul li .pop dl:hover {
    background-color: #f3f3f3
}

.hc_lnav .allbtn ul li .pop dl a {
    color: #666666;
    margin-left: 12px;
    margin-right: 12px
}

.hc_lnav .allbtn ul li .pop dl a.un {
    color: #a5a5a5
}

.hc_lnav .allbtn ul li .pop dt {
    padding-left: 0px;
    width: 72px
}

.hc_lnav .allbtn ul li .pop dd {
    width: 565px;
    margin-left: -12px
}

.hc_lnav .allbtn ul li .pop .act {
    width: 640px;
    height: 80px;
    overflow: hidden;
    padding-top: 10px
}

.hc_lnav .allbtn:hover ul {
    display: block
}

.hc_lnav .allbtn ul li:hover {
    background-color: #fcfcfc
}

.hc_lnav .allbtn ul li:hover .tx {
    background-color: #f5f5f5
}

.hc_lnav .allbtn ul li:hover .tx a {
    color: #333333
}

.hc_lnav .allbtn ul li:hover .tx a i {
    background-position: 0px -25px
}

.hc_lnav .allbtn ul li:hover .pop {
    display: block;
    top: 0px;
    left: 190px
}

.hc_lnav .allbtn ul li:hover .pop dl a.un {
    color: #a5a5a5;
    text-decoration: none
}

.hc_lnav .allbtn ul li:hover dl {
    color: #6e6e6e
}

.hc_lnav .allbtn ul li:hover a {
    color: #666666
}

.hc_lnav .allbtn ul li:hover a:hover {
    color: #cd0606
}

 
	</style>

  </head>
  
  <body>
    
    <table border="1">
        <tbody>
            <tr>
               
                <th>医院类型</th>
                <th>医院名字</th>
                <th>医院地址</th>
            </tr>
            <c:if test="${!empty hospitalList}">
                <c:forEach items="${hospitalList}" var="hospital">
                    <tr>
                        <td>${hospital.hType}</td>
                        <td>${hospital.hName}</td>
                        <a href="<%=basePath%>hospital/getHospital?name=${hospital.hName}">查看详情</a>
                        
                        <td>${hospital.hLocation}</td>
                        
                      
                    </tr>
                </c:forEach>
            </c:if>
        </tbody>
    </table>
    
    
    


<div class="hc_lnav jslist">
    <div class="allbtn">
        <h2><a href="#"><strong>&nbsp;</strong>全部商品分类<i>&nbsp;</i></a></h2>
        <ul style="width:190px" class="jspop box">
            <li class="a1">
                <div class="tx"><a href="#"><i>&nbsp;</i>各地名优茶</a> </div>
                <dl>
                    <dt>热门</dt>
                    <dd>
                        <a href="#">西湖龙井</a>
                        <a href="#">金骏眉</a>
                        <a href="#">大红袍</a>
                        <a href="#">铁观音</a> 
                    </dd>
                </dl>
                <dl>
                    <dt>名茶</dt>
                    <dd>
                        <a href="#">红茶</a>
                        <a href="#">绿茶</a>
                        <a href="#">乌龙茶</a>
                        <a href="#">黑茶</a>
                        <a href="#">白茶 </a>
                    </dd>
                </dl>
                <div class="pop">
                    <h3><a href="#">各地名优茶</a></h3>
                    <dl>
                        <dl>
                            <dt>绿茶</dt>
                            <dd>
                                <a class="ui-link" href="#">西湖龙井</a>
                                <a class="ui-link"  href="#">龙井</a>
                                <a class="ui-link" href="#">黄山毛峰</a>
                                <a class="ui-link"   href="#">安吉白茶</a> 
                                <a class="ui-link" href="#">其他绿茶</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>乌龙茶</dt>
                            <dd>
                                <a class="ui-link" href="">铁观音</a> 
                                <a class="ui-link"  href="">大红袍</a>
                                <a class="ui-link" href="">水仙</a>
                                <a class="ui-link"  href="">肉桂</a> 
                                <a class="ui-link" href="">台湾乌龙</a>
                                <a class="ui-link" href="">其他乌龙茶</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>红茶</dt>
                            <dd>
                                <a class="ui-link" href="" >金骏眉</a>
                                <a class="ui-link"  href="">正山小种</a>
                                <a class="ui-link"  href="">祁门红茶</a>
                                <a class="ui-link"   href="">坦洋工夫</a>
                                <a class="ui-link" href="javascript:;">其他红茶</a>
                                <a class="un ui-link"    href="">政和工夫</a>
                                <a class="ui-link"   href="">滇红工夫</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>黑茶</dt>
                            <dd>
                                <a class="ui-link" href="">白沙溪黑茶</a> 
                                <a class="ui-link"  href="">普洱茶饼</a> 
                                <a class="ui-link" href="">普洱沱茶</a>
                                <a class="ui-link"  href="">普洱茶砖</a>
                                <a class="ui-link"  href="">普洱散茶</a> 
                                <a class="ui-link" href="">其他黑茶</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>白茶</dt>
                            <dd>
                                <a class="ui-link" href="#">白牡丹</a>
                                <a class="ui-link"  href="">白毫银针</a> 
                                <a class="ui-link" href="">寿眉</a>
                                <a class="ui-link" href="">其他白茶</a>
                            </dd>
                        </dl>
                    </dl>
                    <dl>
                        <dt>品牌</dt>
                        <dd>
                            <a  href="">滋恩</a>
                            <a  href="">远荣</a>
                            <a  href="">顶峰</a>
                            <a  href="">公泰</a>
                            <a  href="">一品堂</a>
                            <a  href="">好吉</a> 
                            <a   href="">绿雪芽</a>
                            <a  href="">台湾梅山制茶</a>
                            <a href="" >白沙溪</a>
                            <a href="">联兴茶叶</a>
                        </dd>
                    </dl>
                    <dl>
                        <dt>价格</dt>
                        <dd>
                            <a  href="">100元及以下</a> 
                            <a  href="">100-300元</a>
                            <a  href="">300元及以上</a>
                        </dd>
                    </dl>
                    <dl>
                        <dt>净含量</dt>
                        <dd>
                            <a  href="" >50g及以下</a> 
                            <a   href="">51-100g</a> 
                            <a  href="">101-250g</a> 
                            <a   href="">250g以上</a>
                        </dd>
                    </dl>
                    <dl>
                        <dt>包装</dt>
                        <dd>
                            <a href="">经济自饮装</a>
                            <a href="" >精美礼品装</a>
                        </dd>
                    </dl>
                    <div class="clr"></div>
                    <div class="act"><a href=""><img src="images/20150518092317.jpg" /></a> </div>
                </div>
            </li>
            <li class="a2">
                <div class="tx"><a href=""><i>&nbsp;</i>花草保健茶</a> </div>
                <dl>
                    <dt>推荐</dt>
                    <dd>
                        <a href="">大麦茶</a> 
                        <a href="">苦荞茶</a>
                        <a href="" >玫瑰花茶</a> 
                        <a href="">雪菊</a>
                        <a href="" >蜂蜜木瓜粉</a>
                    </dd>
                </dl>
                <div class="pop">
                    <h3><a href="">花草保健茶</a></h3>
                    <dl>
                        <dl>
                            <dt>瘦身</dt>
                            <dd>
                                <a class="ui-link" href="" >玫瑰荷叶茶</a>
                                <a class="ui-link"    href="">玄米茶</a> 
                                <a  class="ui-link" href="">兰香子</a> 
                                <a class="ui-link"   href="" >纤维泡腾片</a>
                                <a class="ui-link"   href="" >青梅苹果酸</a>
                                <a class="ui-link"   href="">三草茶</a> 
                            </dd>
                        </dl>
                        <dl>
                            <dt>美容</dt>
                            <dd>
                                <a class="ui-link" href="" >法兰西玫瑰</a>
                                <a class="ui-link"  href=""  >冻干柠檬片</a> 
                                <a class="un ui-link"   href="">果粒茶</a>
                                <a    class="ui-link" href="" >大麦茶</a>
                                <a class="ui-link"   href="">蜂蜜抹茶粉</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>丰胸</dt>
                            <dd>
                                <a class="ui-link" href="" >木瓜葛根粉</a> 
                                <a class="ui-link"    href=""  >蜂蜜木瓜粉</a>
                                <a class="ui-link"   href="">红酒木瓜丽人饮</a>
                            </dd>
                        </dl>
                    </dl>
                    <dl>
                        <dt>品牌</dt>
                        <dd>
                            <a href="">与花香</a>
                            <a href="">美丽快攻</a>
                            <a href="" >顶峰</a>
                        </dd>
                    </dl>
                    <dl>
                        <dt>价格</dt>
                        <dd>
                            <a href="" >100元及以下</a>
                            <a   href="" >100-300元</a>
                            <a  href="">300元及以上</a>
                        </dd>
                    </dl>
                    <dl>
                        <dt>净含量</dt>
                        <dd>
                            <a href="">50g及以下</a> 
                            <a href="">51-100g</a>
                            <a href="">101-250g</a>
                            <a href="">250g以上</a>
                        </dd>
                    </dl>
                    <dl>
                        <dt>包装</dt>
                        <dd>
                            <a href="">经济自饮装</a>
                            <a href="">精美礼品装</a>
                        </dd>
                    </dl>
                    <div class="clr"></div>
                    <div class="act"><a href=""><img src="images/20150518092236.jpg" /></a></div>
                </div>
            </li>
            <li class="a3">
                <div class="tx"><a href=""><i>&nbsp;</i>精选茶具</a> </div>
                <dl>
                    <dt>推荐</dt>
                    <dd>
                        <a href="" >功夫茶具</a> 
                        <a href="">个人杯</a> 
                        <a href="">茶宠</a>
                        <a href="">茶叶罐</a> 
                    </dd>
                </dl>
                <div class="pop">
                    <h3><a href="">精选茶具</a></h3>
                    <dl>
                        <dl>
                            <dt>陶瓷</dt>
                            <dd>
                                <a class="ui-link" href="">茶叶罐</a>
                                <a class="ui-link"  href="">功夫茶具</a> 
                                <a class="ui-link" href="" >茶壶</a>
                                <a class="ui-link"  href="">茶宠</a>
                                <a class="ui-link" href=""  >茶杯</a>
                                <a class="ui-link"  href="">茶具礼盒</a> 
                            </dd>
                        </dl>
                    </dl>
                    <dl>
                        <dt>品牌</dt>
                        <dd>
                            <a  href="">恒越</a>
                            <a  href="">卓越</a>
                            <a   href="">国尊陶瓷</a> 
                            <a  href="">宏远达</a>
                            <a href="">福万利</a>
                        </dd>
                    </dl>
                    <dl>
                        <dt>价格</dt>
                        <dd>
                            <a href="">100元及以下</a>
                            <a  href="">100-300元</a>
                            <a  href="">300元及以上</a>
                        </dd>
                    </dl>
                    <dl>
                        <dt>包装</dt>
                        <dd>
                            <a href="">经济自饮装</a>
                            <a  href="">精美礼品装</a>
                        </dd>
                    </dl>
                    <div class="clr"></div>
                    <div class="act"><a href=""><img src="images/20150518092152.jpg" /></a></div>
                </div>
            </li>
            <li class="a4">
                <div class="tx"><a href=""><i>&nbsp;</i>可口茶食</a> </div>
                <dl>
                    <dt>推荐</dt>
                    <dd>
                        <a href="">橄榄</a>
                        <a   href="">冰糖杨梅</a>
                        <a  href="">酸甜梅</a> 
                    </dd>
                </dl>
                <div class="pop">
                    <h3><a href="">可口茶食</a></h3>
                    <dl>
                        <dl>
                            <dt>干果</dt>
                            <dd>
                                <a class="ui-link" href="">杏仁</a>
                                <a class="ui-link"   href="">瓜子</a>
                                <a  class="un ui-link" href="">开心果</a>
                            </dd>
                        </dl>
                        <dl>
                            <dt>零食</dt>
                            <dd>
                                <a class="ui-link"  href="">水晶柠檬片</a>
                                <a class="ui-link"  href="">方块酥</a> 
                                <a class="ui-link" href="javascript:;">凤梨酥</a>
                                <a  class="ui-link" href="">燕麦巧克力</a>
                            </dd>
                        </dl>
                    </dl>
                    <dl>
                        <dt>品牌</dt>
                        <dd>
                            <a href="">赛园</a>
                            <a  href="">新味</a>
                        </dd>
                    </dl>
                    <dl>
                        <dt>价格</dt>
                        <dd>
                            <a  href="">100元及以下</a>
                            <a  href="">100-300元</a>
                            <a  href="">300元及以上</a>
                        </dd>
                    </dl>
                    <dl>
                        <dt>净含量</dt>
                        <dd>
                            <a  href="" >50g及以下</a> 
                            <a   href="">51-100g</a>
                            <a  href="">101-250g</a>
                            <a  href="">250g以上</a>
                        </dd>
                    </dl>
                    <dl>
                        <dt>包装</dt>
                        <dd>
                            <a  href="">经济自饮装</a>
                            <a   href="">精美礼品装</a>
                        </dd>
                    </dl>
                    <div class="clr"></div>
                    <div class="act"><a href=""><img src="images/20150518092213.jpg" /></a> </div>
                </div>
            </li>
        </ul>
    </div>
</div>

    
    
  </body>
</html>
