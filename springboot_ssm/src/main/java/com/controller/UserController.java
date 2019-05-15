package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.security.GeneralSecurityException;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.NoSuchProviderException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.httpclient.HttpClient;
import org.apache.commons.httpclient.HttpException;
import org.apache.commons.httpclient.NameValuePair;
import org.apache.commons.httpclient.methods.PostMethod;
import org.apache.naming.factory.SendMailFactory;
import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.concurrent.SuccessCallback;
import org.springframework.web.HttpSessionRequiredException;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.dao.DepartmentMapper;
import com.dao.UserMapper;
import com.domain.Cookies;
import com.domain.Department;
import com.domain.Doctor;
import com.domain.Hospital;
import com.domain.Sdepartment;
import com.domain.User;
import com.google.gson.Gson;
import com.service.DepartmentService;
import com.service.UserService;
import com.sun.mail.util.MailSSLSocketFactory;
import com.util.CheckImgAction;
import com.util.GetMessageCode;
import com.util.JavaMailUtil;
import com.util.RandomUtil;
import com.util.htmlText;

@Controller
@RequestMapping("/user")
public class UserController {
   @Autowired
   UserMapper userMapper;
   
   @Autowired
   private UserService userService;
   @Autowired
	 DepartmentService   departmentService;
	
   
   
   
   @RequestMapping("/moreLogin")
   public String moreLogin(){
	   
	   return "/moreLogin";
   }
   
   @RequestMapping("/main")
   public String main(Model model){
	
	/*List<Department> department=departmentMapper.findAll();
	model.addAttribute("departmentList",department);	
			for(Department d:department){
				System.out.println(d.getdName());
				for(Sdepartment s:d.getsDepartmentList()){
					System.out.println(s.getSdName());
				}
			}
		
			*/
	   
	   List<Department> department=departmentService.allDepartment();
	//	System.out.println(department);
		model.addAttribute("departmentList",department);

	    return "/main";
	   }
   
   @RequestMapping("/changeEmail")
   public String changeEmail(HttpServletRequest req,HttpSession session,Model model,String name){
	 System.out.println(name);
	   
	   session.setAttribute("username", name);  
	   String email=req.getParameter("email");
	   System.out.println(email);
	   userService.changeEmail(email,name);
	 		User user=userService.selectAllByName(name);
	 		user.setuName(name);
	         model.addAttribute("user",user);

	 	    return "/mine";
	   
   }
   @RequestMapping("/changePassword")
   public String changePassword(HttpServletRequest req,HttpServletResponse response,HttpSession session,Model model,String name) throws IOException{
	 System.out.println(name);
	   
	   session.setAttribute("username", name);  
	   String password=req.getParameter("password");
	   String npassword=req.getParameter("npassword");
	   User user1=userService.selectAllByName(name);
	   System.out.println(user1.getuPassword());
	   if(password.equals(user1.getuPassword())){
		   userService.changePassword(npassword,name);
		   User user=userService.selectAllByName(name);
	 		user.setuName(name);
	         model.addAttribute("user",user);

	   }
	   else{
		   response.setContentType("text/html;charset=UTF-8");
			
//				response.getWriter().print("<font color='red'>密码输入错误</font>");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('密码输入错误');</script>");
	   }
	 		
	 	    return "/mine";
	   
   }
   
   @RequestMapping("/mine")
   public String getMine(HttpSession session,Model model,String name){
	   session.setAttribute("username", name);  
	  
		User user=userService.selectAllByName(name);
		user.setuName(name);
        model.addAttribute("user",user);
//        System.out.println(user.getDoctorList());
//        for(Doctor d:user.getDoctorList()){
//        	System.out.println(d.getdName());
//        }
//        System.out.println(user.getHospitalList());
//        for(Hospital d:user.getHospitalList()){
//        	System.out.println(d.gethName());
//        }
	    return "/mine";
	   }


   
   @RequestMapping("/sendSMS")
   public void sendSMS(HttpServletRequest req,HttpServletResponse resp) throws IOException{
	  
//			String phone=req.getParameter("phone");
//			//根据获取到的手机号发送验证码
//			String code = GetMessageCode.getCode(phone); 
//			System.out.println(code);
	 //  resp.getWriter().print(mobile_code);
	   
	   String Url = "http://106.ihuyi.cn/webservice/sms.php?method=Submit";
			
			HttpClient client = new HttpClient(); 
			PostMethod method = new PostMethod(Url);

			client.getParams().setContentCharset("GBK");
			method.setRequestHeader("ContentType","application/x-www-form-urlencoded;charset=GBK");

			int mobile_code = (int)((Math.random()*9+1)*100000);

		    String content = new String("您的验证码是：" + mobile_code + "。请不要把验证码泄露给其他人。");
	       String mobile=req.getParameter("phone");
	      
		    System.out.println(content);
			NameValuePair[] data = {//提交短信
					                             //C36358720         C13480152
				    new NameValuePair("account", "C36358720"), //查看用户名是登录用户中心->验证码短信->产品总览->APIID
				                                 //ab31e7a9b15263e89cecf531de86a05f     793ece66c2f6f68d7177b1b424a1aa5a
				    new NameValuePair("password", "ab31e7a9b15263e89cecf531de86a05f"),  //查看密码请登录用户中心->验证码短信->产品总览->APIKEY
				    //new NameValuePair("password", util.StringUtil.MD5Encode("密码")),
				    new NameValuePair("mobile", mobile), 
				    new NameValuePair("content", content),
			};
			method.setRequestBody(data);

			try {
				client.executeMethod(method);
				
				String SubmitResult =method.getResponseBodyAsString();

				//System.out.println(SubmitResult);

				Document doc = DocumentHelper.parseText(SubmitResult);
				Element root = doc.getRootElement();

				String code = root.elementText("code");
				String msg = root.elementText("msg");
				String smsid = root.elementText("smsid");

				System.out.println(code);
				System.out.println(msg);
				System.out.println(smsid);

				 if("2".equals(code)){
					System.out.println("短信提交成功");
				}

			} catch (HttpException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (DocumentException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally{
				// Release connection
				method.releaseConnection();
				//client.getHttpConnectionManager().closeIdleConnections(arg0);;
				//((Object) client.getHttpConnectionManager()).shutdown();
				
				
				resp.getWriter().print(mobile_code);
			
			}
			
		
	   
	   
	   
			

   }
   @RequestMapping("/login")
   public String Login(){
	 
	   return "/login";
   }
   @RequestMapping("/checklogin")
   public String checkLogin(HttpSession session,HttpServletRequest req,HttpServletResponse resp) throws UnsupportedEncodingException{
	   boolean flag=false;
	   String page="";
	   String name=req.getParameter("username");
	   String password=req.getParameter("password");
	   User user=userService.selectUserByNameAndPassword(name,password);
	   if(user!=null){
		   flag=true;
	   }
	  
	   if(flag==true){
		   session.setAttribute("username", name);  
		   session.setAttribute("user", user);
		   page="redirect:/user/loginSuccess?mobile=1";
	   }
	   else{
		   page="redirect:/user/loginFail";
	   }
	   
	   addCookie(name,password,resp,req);
	   
	   return page;
   }

   private void addCookie(String loginAccount,String loginPassword, HttpServletResponse response,HttpServletRequest request)
           throws UnsupportedEncodingException{
   if(!loginAccount.equals("") && !loginPassword.equals("")){
       //创建  Cookie
       Cookie loginAccountCookie = new Cookie("loginAccount",loginAccount);
       Cookie loginPasswordCookie = new Cookie("loginPassword",loginPassword);
       //设置Cookie的父路经
       loginAccountCookie.setPath(request.getContextPath()+"/");
       loginPasswordCookie.setPath(request.getContextPath()+"/");
       //获取是否保存Cookie（例如：复选框的值）
       String rememberMe = request.getParameter("isRememberUsername");
       System.out.println(rememberMe);
       if( rememberMe==null || rememberMe.equals(false) ){
           //不保存Cookie
           loginAccountCookie.setMaxAge(0);
           loginPasswordCookie.setMaxAge(0);
       }else{
           //保存Cookie的时间长度，单位为秒
           loginAccountCookie.setMaxAge(7*24*60*60);
           loginPasswordCookie.setMaxAge(7*24*60*60);
       }
       //加入Cookie到响应头
       response.addCookie(loginAccountCookie);
       response.addCookie(loginPasswordCookie);
   }
}
   /**
     * 获取 Cookie中的信息
   	 * @param request
   	 * @return
   	 * @throws IOException
   	 */
   	@RequestMapping("/getCookie")
   	@ResponseBody
   	public String getCookie(HttpServletRequest request)throws IOException{
   		String loginAccount = "";
   		String loginPassword = "";
   		Cookie[] cookies = request.getCookies();
   		if(cookies!=null&&cookies.length>0){
   			//遍历Cookie
   			for(int i=0;i<cookies.length;i++){
   				Cookie cookie = cookies[i];
   				//此处类似与Map有
   				if("loginAccount".equals(cookie.getName())){
   					loginAccount = cookie.getValue();
   				}
   				if("loginPassword".equals(cookie.getName())){
   					loginPassword = cookie.getValue();
   				}
 			}
   		}
	//自己定义的javabean Cookies
   		Cookies co = new Cookies();
   		co.setLoginAccount(loginAccount);
   		co.setLoginPassword(loginPassword);
   		Gson gson = new Gson();
   		return gson.toJson(co);
   	}


@RequestMapping("/loginSuccess")
   public String loginSuccess(Model model,String mobile,HttpSession session,HttpServletRequest req){
		if(!mobile.equals("1")){
			User user=userMapper.findByMobile(mobile);
			String username =user.getuName();
			System.out.println(username);
				  session.setAttribute("username", username);  
			  
		}
	
		 List<Department> department=departmentService.allDepartment();
			//	System.out.println(department);
				model.addAttribute("departmentList",department);
	//return "/loginSuccess";
		return "/main";
   }
   @RequestMapping("/loginFail")
   public String loginFail(){
	   
	  // return "/loginFail";
	   return "/login";
   }
   
   @RequestMapping(value="/logout")  
   public String logout(HttpSession session) throws Exception{  
       //清除Session  
       session.invalidate();  
         
       return "redirect:/department/main";  
   }  
     
   @RequestMapping("/register")
   public String register(){
	   
	  return "/register";
   }
   @RequestMapping("/registerSuccess")
   public String success(HttpServletRequest req){
	//	String username = req.getParameter("username");
		
	   return "/registerSuccess";
   }
   @RequestMapping("/registerFail")
   public String fail(){
	   
	   return "/registerFail";
   }
   
   @RequestMapping("/checkImg")
   public void CheckImg(){
	   new CheckImgAction();
	   
   }
   
   @RequestMapping("/checkUserName")
   public void checkUserName(HttpServletRequest req,HttpServletResponse response) throws IOException{
	   String name = req.getParameter("username");
		User existUser = userService.selectUserByName(name);
		
		response.setContentType("text/html;charset=UTF-8");
		if(existUser == null){
			// 用户名可以使用的
			response.getWriter().print("<font color='green'>用户名可以使用</font>");
		}else{
			// 用户名已经存在
			response.getWriter().print("<font color='red'>用户名已经存在</font>");
		}
		
	}
	
   
   
   @RequestMapping("/registerServlet")
   public String registerServlet(HttpServletRequest req,HttpServletResponse resp) throws ServletException, IOException{
	// 获取session中的验证码
			String sessionCode = (String) req.getSession().getAttribute("code");
			System.out.println(sessionCode);
			String page="";
			if(sessionCode != null) {
				//  获取页面提交的验证码
				String inputCode = req.getParameter("code");
				System.out.println("页面提交的验证码:" + inputCode);
				if (sessionCode.toLowerCase().equals(inputCode.toLowerCase())) {
					String email=req.getParameter("email");
					String username = req.getParameter("username");
					String password = req.getParameter("password");
					userService.insertUser(username,password,email);
					System.out.println("页面提交:" + username+password);
					//  验证成功，跳转成功页面
					req.setAttribute("username", username);
					page= "/registerSuccess";
					//req.getRequestDispatcher("/success.jsp").forward(req, resp);
				}else {
					//  验证失败
					page= "/registerFail";
				//	req.getRequestDispatcher("fail.jsp").forward(req, resp);
				}
			}else {
				page= "/registerFail";
				//  验证失败
				//req.getRequestDispatcher("fail.jsp").forward(req, resp);
			}
			//  移除session中的验证码
			req.removeAttribute("code");
			//return sessionCode;
			//return page;
			page= "redirect:/user"+page;
			System.out.println(page);
			 return page;
   }
   
   @RequestMapping("/findPassword")
   public String findPassword(){
	   return "/findPassword";
   }
   
   
   @RequestMapping("/sendfindPassword")
   public void sendfindPassword(HttpServletRequest request,HttpServletResponse response) throws IOException, GeneralSecurityException, MessagingException{
	   request.setCharacterEncoding("utf-8");
	   response.setContentType("text/html;charset=utf-8");//设置页面的字符编码
	   String path = request.getContextPath();
	   String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	 //获取用户的邮箱
	 		String email = request.getParameter("email");
	 	
	 		User user = null;
	 		PrintWriter out = response.getWriter();
	 		//实例化一个发送邮件的对象
	 		//SendMail mySendMail = new SendMail();
	 		
	 		 
	 		//根据邮箱找到该用户信息
	 		
	 			user = userService.getUserByEmail(email);
	 			if(user!=null) {
	 				
	 				 Properties prop = new Properties();
	 	 			// 开启debug调试，以便在控制台查看
	 	 			prop.setProperty("mail.debug", "true");
	 	 			// 设置邮件服务器主机名
	 	 			prop.setProperty("mail.host", "smtp.qq.com");
	 	 			// 发送服务器需要身份验证
	 	 			prop.setProperty("mail.smtp.auth", "true");
	 	 			// 发送邮件协议名称
	 	 			prop.setProperty("mail.transport.protocol", "smtp");
	 	 			// 开启SSL加密，否则会失败
	 	 			MailSSLSocketFactory sf = new MailSSLSocketFactory();
	 	 			sf.setTrustAllHosts(true);
	 	 			prop.put("mail.smtp.ssl.enable", "true");
	 	 			prop.put("mail.smtp.ssl.socketFactory", sf);
	 	 			// 创建session
	 	 			Session session = Session.getInstance(prop);
	 	 			// 通过session得到transport对象
	 	 			Transport ts = session.getTransport();
	 	 			// 连接邮件服务器：邮箱类型，帐号，POP3/SMTP协议授权码 163使用：smtp.163.com
	 	 			ts.connect("smtp.qq.com", "2948272167", "fnhygckaltsfdfbj");
	 	 			// 创建邮件
	 	 	
	 	 				// 创建邮件对象
	 	 				MimeMessage message = new MimeMessage(session);
	 	 				// 指明邮件的发件人
	 	 				message.setFrom(new InternetAddress("2948272167@qq.com"));
	 	 				// 指明邮件的收件人，现在发件人和收件人是一样的，那就是自己给自己发
	 	 				message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
	 	 				// 邮件的标题
	 	 				message.setSubject("智能预约平台");
	 	 				// 邮件的文本内容
	 	 			    message.setContent("【智能预约平台】,账号找回密码,您的密码为："+user.getuPassword()+",请勿回复此邮箱", "text/html;charset=UTF-8");
	 	 			// 发送邮件
	 	 		   ts.sendMessage(message, message.getAllRecipients());
	 	 		   ts.close();	
	 				//mySendMail.sendMail(email, "图书管理系统提醒，您的密码为："+user.getPassword());
	 				out.println("<script>alert('恭喜，找回密码成功');window.location.href='login'</script>");
	 			}
	 		
	 		out.println("<script>alert('该邮箱尚未注册！请重新输入');window.location.href='findPassword'</script>");
			
	 		
	 		
	 		//return "/findPassword";

   }
   
   
   
   @RequestMapping("/sendEmail")
   public void SendMail(HttpServletRequest req) throws Exception{
	   String email = req.getParameter("email");
	   Properties prop = new Properties();
		// 开启debug调试，以便在控制台查看
		prop.setProperty("mail.debug", "true");
		// 设置邮件服务器主机名
		prop.setProperty("mail.host", "smtp.qq.com");
		// 发送服务器需要身份验证
		prop.setProperty("mail.smtp.auth", "true");
		// 发送邮件协议名称
		prop.setProperty("mail.transport.protocol", "smtp");
		// 开启SSL加密，否则会失败
		MailSSLSocketFactory sf = new MailSSLSocketFactory();
		sf.setTrustAllHosts(true);
		prop.put("mail.smtp.ssl.enable", "true");
		prop.put("mail.smtp.ssl.socketFactory", sf);
		// 创建session
		Session session = Session.getInstance(prop);
		// 通过session得到transport对象
		Transport ts = session.getTransport();
		// 连接邮件服务器：邮箱类型，帐号，POP3/SMTP协议授权码 163使用：smtp.163.com
		ts.connect("smtp.qq.com", "2948272167", "fnhygckaltsfdfbj");
		// 创建邮件
	
		
	//  写入session
	// req.getSession().setAttribute("code", code);
	//  获取6为随机验证码
				String[] letters = new String[] {
						"q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m",
						"A","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M",
						"0","1","2","3","4","5","6","7","8","9"};
				String stringBuilder ="";
				for (int i = 0; i < 6; i++) {
					stringBuilder = stringBuilder + letters[(int)Math.floor(Math.random()*letters.length)];
				}
			   String code=stringBuilder;
			// 创建邮件对象
			MimeMessage message = new MimeMessage(session);
			// 指明邮件的发件人
			message.setFrom(new InternetAddress("2948272167@qq.com"));
			// 指明邮件的收件人，现在发件人和收件人是一样的，那就是自己给自己发
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(email));
			// 邮件的标题
			message.setSubject("智能预约平台");
			// 邮件的文本内容
		    message.setContent("欢迎您注册【智能预约平台】,账号注册验证码为(一分钟有效):"+stringBuilder+",请勿回复此邮箱", "text/html;charset=UTF-8");
		// 发送邮件
	   ts.sendMessage(message, message.getAllRecipients());
	   ts.close();	
	   
	//  写入session
		req.getSession().setAttribute("code", code);
		System.out.println(code);
   }
   
   
   
   /**
	 * @Method: createSimpleMail
	 * @Description: 创建一封只包含文本的邮件
	 */
   /*
	public static MimeMessage createSimpleMail(Session session) throws Exception {
			//  获取6为随机验证码
			String[] letters = new String[] {
					"q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m",
					"A","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M",
					"0","1","2","3","4","5","6","7","8","9"};
			String stringBuilder ="";
			for (int i = 0; i < 6; i++) {
				stringBuilder = stringBuilder + letters[(int)Math.floor(Math.random()*letters.length)];
			}
		
		// 创建邮件对象
		MimeMessage message = new MimeMessage(session);
		// 指明邮件的发件人
		message.setFrom(new InternetAddress("2948272167@qq.com"));
		// 指明邮件的收件人，现在发件人和收件人是一样的，那就是自己给自己发
		message.setRecipient(Message.RecipientType.TO, new InternetAddress("2948272167@qq.com"));
		// 邮件的标题
		message.setSubject("JavaMail测试");
		// 邮件的文本内容
	    message.setContent("欢迎您注册【柒晓白网络科技】,账号注册验证码为(一分钟有效):"+stringBuilder+",请勿回复此邮箱", "text/html;charset=UTF-8");
		
	 
	    
		// 返回创建好的邮件对象
		return message;
	}
	  
		public static String createCodeSimpleMail(Session session) throws Exception {
				//  获取6为随机验证码
				String[] letters = new String[] {
						"q","w","e","r","t","y","u","i","o","p","a","s","d","f","g","h","j","k","l","z","x","c","v","b","n","m",
						"A","W","E","R","T","Y","U","I","O","P","A","S","D","F","G","H","J","K","L","Z","X","C","V","B","N","M",
						"0","1","2","3","4","5","6","7","8","9"};
				String stringBuilder ="";
				for (int i = 0; i < 6; i++) {
					stringBuilder = stringBuilder + letters[(int)Math.floor(Math.random()*letters.length)];
				}
			
		
		    
			// 返回创建好的邮件对象
			return stringBuilder;
		}

@RequestMapping("/SendEmail")
   public void SendEmail(HttpServletRequest req,HttpServletResponse resp){
	   System.out.println("邮箱发送功能");
		try {
			String email = req.getParameter("email");
			JavaMailUtil.receiveMailAccount = email; // 给用户输入的邮箱发送邮件

			// 1、创建参数配置，用于连接邮箱服务器的参数配置
			Properties props = new Properties();
			// 开启debug调试
			props.setProperty("mail.debug", "true");
			// 发送服务器需要身份验证
			props.setProperty("mail.smtp.auth", "true");
			// 设置右键服务器的主机名
			props.setProperty("mail.host", JavaMailUtil.emailSMTPHost);
			// 发送邮件协议名称
			props.setProperty("mail.transport.protocol", "smtp");

			// 2、根据配置创建会话对象，用于和邮件服务器交互
			Session session = Session.getInstance(props);
			// 设置debug，可以查看详细的发送log
			session.setDebug(true);
			// 3、创建一封邮件
			String code = RandomUtil.getRandom();
			System.out.println("邮箱验证码：" + code);
			String html = htmlText.html(code);
			MimeMessage message = JavaMailUtil.creatMimeMessage(session, JavaMailUtil.emailAccount,
					JavaMailUtil.receiveMailAccount, html);

			// 4、根据session获取邮件传输对象
			Transport transport = session.getTransport();
			// 5、使用邮箱账号和密码连接邮箱服务器emailAccount必须与message中的发件人邮箱一致，否则报错
			transport.connect(JavaMailUtil.emailAccount, JavaMailUtil.emailPassword);
			// 6、发送邮件,发送所有收件人地址
			transport.sendMessage(message, message.getAllRecipients());
			// 7、关闭连接
			transport.close();
			//  写入session
			req.getSession().setAttribute("code", code);
		} catch (Exception e) {
			e.printStackTrace();
			req.getSession().setAttribute("error", "邮件发送失败");
		}

      
   }
   */
   
   
   
   @RequestMapping("/cs")
   public User cs(){
	   User user=userMapper.selectUserByName("syy");
	   return user;
   }
   
   //@ResponseBody
   @RequestMapping("/index")
   public String toIndex(){
	//return "hello";
    return "index";
   }
   
   
   @RequestMapping("/getAllUser")
   public String getAllUser(HttpServletRequest request,Model model)
   {
	   List<User> user=userService.findAll();
	   model.addAttribute("userList",user);
	   request.setAttribute("userList",user);
	   return "/allUser";
   }
   
   /**  
    * 跳转到添加用户界面  
    * @param request  
    * @return  
    */
@RequestMapping("/toAddUser")
public String toAddUser()
{
   return "/addUser";
}
/**  
    * 添加用户并重定向  
    * @param user  
    * @param request  
    * @return  
    */
@RequestMapping("/addUser")
public String addUser(User user,Model model){
   userService.save(user);
   return "redirect:/user/getAllUser";
}
/**  
    *编辑用户  
    * @param user  
    * @param request  
    * @return  
    */
@RequestMapping("/updateUser")
public String updateUser(User user,HttpServletRequest request,Model model){
   if(userService.update(user)!=0)
   {
       user=userService.findById(user.getuId());
       request.setAttribute("user",user);
       model.addAttribute("user",user);
       return "redirect:/user/getAllUser";
   }
   else {
       return "/error";                    
   }
}
/**  
    * 根据id查询单个用户  
    * @param id  
    * @param request  
    * @return  
    */
@RequestMapping("/getUser")
public String getUser(Integer id,HttpServletRequest request,Model model){
   request.setAttribute("user",userService.findById(id));
   model.addAttribute("user",userService.findById(id));
   return "/editUser";
}
/**  
    * 删除用户  
    * @param id  
    * @param request  
    * @param response  
    */
@RequestMapping("/delUser")
public String delUser(Integer id,HttpServletRequest request,HttpServletResponse response){
 //  String result="{\"result\":\"error\"}";
  // if(userService.delete(id))
  // {
    //   result="{\"result\":\"success\"}";
 //  }else {
     //  result="{\"result\":\"error\"}";
 //  }
	userService.delete(id);
   return "redirect:/user/getAllUser";
}
}
