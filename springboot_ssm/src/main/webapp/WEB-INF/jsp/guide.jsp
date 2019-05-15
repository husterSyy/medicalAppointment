<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="zh-cmn-Hans">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=0">
    <title>调用百度地图API,获取当前位置并导航到目的地</title>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=1YzBCEbcdxOmkivAWF3LLBO6ws1f88U1"></script>  
    <script src="http://cdn.bootcss.com/jquery/1.11.1/jquery.min.js"></script><!--调用jQuery-->
 
  <link href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
        <link href="//cdn.bootcss.com/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet">
        
        <script src="//cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
        <script src="/mobile/addon/jquery.mmenu.min.all.js"></script>
        <script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
        
    
	<link rel="stylesheet" type="text/css" href="css/order.css">
	 <style type="text/css">
    *{
        margin:0px;
        padding:0px;
    
    }
   .title a{margin:0px auto;
    position:fixed;
    top:0;
    }
    #carousel-example-generic{
        width:1000px;
        height:480px;
    margin:0 auto;
    }
  #search-wrap{
        position:absolute;
        margin-top:-10px;　<!--达到覆盖图片轮播底部的作用-->　
        left:50%;　　　　　　<!--这部分是搜索框居中显示的关键。-->
        margin-left:-130px;
        width:260px;　　　　
        height:36px;　　　　
        border-radius:18px;
        box-shadow: 0 0 3px rgba(0,0,0,.14);
        background-color:#FFF;
        
      /*  float:left;*/
    }
    
    #search-wrap .search-content{
        box-shadow: none;
        
        border:0 none;
        font-family: "Hiragino Sans GB","Microsoft YaHei","WenQuanYi Micro Hei",Arial,Helvetica,sans-serif;
        margin-top:3px;
        margin-left:18px;
        width:190px;
        height:30px;
    }
    #search-wrap .search-btn{
        border:0px;
        float:right;
        margin:4px 4px 4px 0;
        width:46px;
        height:28px;
        border-radius:14px;
        background-color:#2980b9;
        color:#FFF;
        text-align:center;
        line-height:28px;
        
    }

</style>  
 
  <style type="text/css">
        body, html,#allmap {width: 100%;height: 100%;overflow: hidden;margin:0;font-family:"微软雅黑";}
 
    </style> 
 
</head>
 
<body>  

   <div id="allmap">
   <input type="hidden"   id="location" value=${hospital.hLocation}>
  <input  type="hidden" id="pname" value=${hospital.pName}>
    <input type="hidden"   id="haddress" value=${hospital.hAddress}>
  <input  type="hidden" id="hmobile" value=${hospital.hMobile}>
   </div>


   <script type="text/javascript">  
 var content= document.getElementById("location").value;
  var pname=document.getElementById("pname").value;
   var haddress= document.getElementById("haddress").value;
  var hmobilepname=document.getElementById("hmobile").value;
  //alert(pname);
    var map = new BMap.Map("allmap");  
    var point = new BMap.Point(116.709684,39.89778);
    map.centerAndZoom(point, 15);  
    map.enableScrollWheelZoom(); 
 
    var myIcon = new BMap.Icon("myicon.png",new BMap.Size(30,30),{
        anchor: new BMap.Size(10,10)    
    });

  //var content= document.getElementById("location").value;
  //alert(content);
  
   // var pname=document.getElementById("pname").value;
    
    var marker=new BMap.Marker(point,{icon: myIcon});  
    map.addOverlay(marker);  
 
    var geolocation = new BMap.Geolocation();
    geolocation.getCurrentPosition(function(r){
        if(this.getStatus() == BMAP_STATUS_SUCCESS){
            var mk = new BMap.Marker(r.point);
            map.addOverlay(mk);
            //map.panTo(r.point);//地图中心点移到当前位置
            var latCurrent = r.point.lat;
            var lngCurrent = r.point.lng;
           // alert('我的位置：'+ latCurrent + ',' + lngCurrent);
           //114.419826,30.518754
         //  location.href="http://api.map.baidu.com/direction?origin="+latCurrent+","+lngCurrent+"&destination=31.2032,121.46122&mode=driving&region=北京&output=html"; 
 		  location.href="http://api.map.baidu.com/direction?origin=30.518754,114.419826&destination="+content+"&mode=driving&region=北京&output=html"; 
        }
        else {
            alert('failed'+this.getStatus());
        }        
    },{enableHighAccuracy: true})
 
 
    map.addOverlay(marker);  

  // var licontent= document.getElementById("location").value;
  var licontent="<b>"+pname+"</b><br>";  
       licontent+="<span><strong>地址：</strong>"+haddress+"</span><br>";  
        licontent+="<span><strong>电话：</strong>"+hmobile+"</span><br>";          
    var opts = { 
        width : 200,
        height: 80,
    };         
    var  infoWindow = new BMap.InfoWindow(licontent, opts);  
    marker.openInfoWindow(infoWindow);  
    marker.addEventListener('click',function(){
        marker.openInfoWindow(infoWindow);
    });  


 
</script>

   
   
</body>  
</html>


