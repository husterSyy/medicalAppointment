//消息推送

//新建一个websocket（参数为服务器端地址/用户id）
var webSocket = new WebSocket("ws://127.0.0.1:8080/WebSocket/"+user1);

/*//输入框
const inputText=document.getElementById("inputText");*/

//历史信息框（保存在客户端数据库）
const historyText=document.getElementById("historyText");
//当前时间
var time;
var myTime;
var filename;


//数据库对象
var dbObject={};

dbObject.init=function(){
	if('indexedDB' in window){
		var req=indexedDB.open("MyDB",1);
		req.onupgradeneeded=(event)=>{
			//创建对象仓库，主键自增
			dbObject.db = event.target.result;
			var store=dbObject.db.createObjectStore("Chatlog",{autoIncrement: true});
			/*//建索引（暂时用不上）
			store.createIndex("receiver","receiver",{unique: false});
			store.createIndex("sender","sender",{unique: false});
			store.createIndex("time","time",{unique: false});*/
		}
		req.onsuccess=(event)=>{
			dbObject.db = event.target.result;
			console.trace("数据库打开成功！");
			
			//如果在聊天界面则读取
			if(historyText!=null){
				dbObject.select();
			}
		}
	}
	//创建数据库
}

//插入对象
dbObject.put=function(chatlog){
	//获取事务和数据仓库
	var transaction=dbObject.db.transaction("Chatlog","readwrite");
	var store = transaction.objectStore("Chatlog");

    transaction.onsuccess = function(e) {
    	console.trace('事务建立成功！');
    };
    
    var request = store.add(chatlog);
    request.onsuccess = function() {
    	console.trace("存好了！");
    }
}

//读取
dbObject.select=function(){
	//获取事务和数据仓库
	var transaction=dbObject.db.transaction("Chatlog","readwrite");
	var store = transaction.objectStore("Chatlog");
	//游标读取所有与user1有关的
	var request=store.openCursor();
	request.onsuccess = function(e){
		var cursor = e.target.result;
		
		if(user2==undefined&&cursor&&cursor.value.sender!=user1){
			user2=cursor.value.sender;
			document.getElementById("userInfo").innerHTML=user2;
		}
		
		if(cursor&&
				(cursor.value.sender==user1&&cursor.value.receiver==user2)){
			//本人发送
			if(cursor.value.file!="empty"){
				//文件
				document.getElementById("img-table").innerHTML+=
					'<tr><td class="show-img-download"><p>已发送图片:</p><img class="show-img-download-each" src="/img/'+cursor.value.file+'" width="100px"></td></tr>';
			}else{
				//普通消息
				historyText.innerHTML+=(username1+":"+new Date(cursor.value.time).toLocaleTimeString()
						+"\n&emsp;&emsp;"+cursor.value.message+"\n\n");
			}
			cursor.continue();
		}else if(cursor&&
					(cursor.value.sender==user2&&cursor.value.receiver==user1)){
			//本人接收
			if(cursor.value.file!="empty"){
				//文件
				document.getElementById("img-table").innerHTML+=
					'<tr><td class="show-img-download"><p>对方传来图片:</p><img class="show-img-download-each" src="/img/'+cursor.value.file+'" width="100px"></td></tr>';
			}else{
				//普通消息
				if(flag=="doctor"){
					historyText.innerHTML+=(user2+":"+new Date(cursor.value.time).toLocaleTimeString()
							+"\n&emsp;&emsp;"+cursor.value.message+"\n\n");
				}else{
					historyText.innerHTML+=(username2+":"+new Date(cursor.value.time).toLocaleTimeString()
							+"\n&emsp;&emsp;"+cursor.value.message+"\n\n");
				}
				
			}
			cursor.continue();
		}else {
			console.trace('遍历完成');
		}
	}
}

//关闭
webSocket.onopen = ()=>{
	console.trace("open socket");
}

//接收到消息
webSocket.onmessage = (event)=>{
	console.trace(event.data);
	//得到json对象
	var chatlog=JSON.parse(event.data);
	//保存（java date类型转为js date）
	chatlog.time=new Date(chatlog.time.time);
	dbObject.put(chatlog);
	var isSame=0;
	if(user2==undefined)user2=chatlog.sender;
	
	//显示
	if(chatlog.file!="empty"){
		//传的是图片，则显示在右侧
		//刷新
		window.history.go(0);
		/*document.getElementById("img-table").innerHTML+=
			'<tr><td class="show-img-download"><p>对方传来图片:</p><img class="show-img-download-each" src="/img/'+chatlog.file+'" width="100px"></td></tr>';*/
	}else{
		//传的是消息
		if(flag=="doctor"){
			//医生
			historyText.innerHTML+=(user2+":"+chatlog.time.toLocaleString()+"\n&emsp;&emsp;"+chatlog.message+"\n\n");
		}else{
			//用户
			historyText.innerHTML+=(username2+":"+chatlog.time.toLocaleString()+"\n&emsp;&emsp;"+chatlog.message+"\n\n");
		}
		
	}
}

webSocket.onclose = ()=>{
	console.trace("close socket");
	
}

//发送文本消息
function sendText(){
	var chatlog={
		sender:user1,
		receiver:user2,
		message:inputText.value,
		mid:null,
		file:"empty",
		time:null
	}
	//发送json字符串
	webSocket.send(JSON.stringify(chatlog));
	
	//显示在客户端界面
	time=new Date();
	myTime=time.toLocaleString();
	var message=username1+"： "+myTime+" "+inputText.value;
	historyText.innerHTML+=(username1+":"+myTime+"\n&emsp;&emsp;"+inputText.value+"\n\n");
	//清空输入框
	inputText.value="";
	
	//保存到客户端数据库
	chatlog.time=time;
	dbObject.put(chatlog);
}

//发送图片消息
function sendImg(){
	var index1=file.name.lastIndexOf(".");
	var index2=file.name.length;
	filename=user1+"-"+new Date().getTime()+file.name.substring(index1,index2);
	
	//聊天信息
	var chatlog={
			sender:user1,
			receiver:user2,
			mid:null,
			file:filename,
			time:null
	};
	console.trace(filename);
	webSocket.send(JSON.stringify(chatlog));
	//保存到数据库
	time=new Date();
	chatlog.time=time;
	dbObject.put(chatlog);
	
	document.getElementById("ifilename").value=filename;
	//通过ajax传文件到服务器
	$.ajax({
		url: "consult/uploadImg",
		type: 'POST',
		cache: false,
		data: new FormData($("#uploadForm")[0]),
		processData: false,
		contentType: false,
		success: function (data) {
			if(data.result=="success")
			  alert("上传成功！");
			  cancelImg();
			  document.getElementById("img-table").innerHTML+=
					'<tr><td class="show-img-download"><p>已发送图片:</p><img class="show-img-download-each" src="/img/'+filename+'" width="100px"></td></tr>';
		},
		error: function (err) {
		}
	});
}



