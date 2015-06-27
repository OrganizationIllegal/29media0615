package com.kate.app.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.kate.app.dao.ImageDao;
import com.kate.app.dao.NewsInputDAO;
import com.kate.app.model.NewsImage;
import com.kate.app.model.NewsTrends;

@Controller
public class NewsInputController {
	@Autowired
	private NewsInputDAO newsInputDao;
	
	//新闻动态列表
	@RequestMapping({ "/NewsTrendList" })    
	public void selectAreaList(HttpServletRequest req, HttpServletResponse resp){
		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();
		array = newsInputDao.selectNewsList();
		int count = array.size();
		json.put("total", count);
		json.put("rows", array);
		
		try{
			writeJson(json.toJSONString(),resp);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	//新闻查找
	@RequestMapping({ "/findNewsTrends" })
	public String findNewsTrends(HttpServletRequest req,HttpServletResponse resp){
		int id = Integer.parseInt(req.getParameter("id"));
		NewsTrends newstrends = newsInputDao.findById(id);		
		req.setAttribute("newstrends", newstrends);
		return "/newsEdit.jsp";
	}
	
	
	//新闻录入
	@RequestMapping({ "/inputNewsTrends" })
	public void inputNewsTrends(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		String newsinfo=req.getParameter("newsinfo");		
		NewsTrends newstrends = (NewsTrends) JSONToObj(newsinfo, NewsTrends.class);
		String time;
		int news_id = newstrends.getNews_id();
		String title  = newstrends.getTitle();
		String detail = newstrends.getDetail();
		if(newstrends.getTime()==null||"".equals(newstrends.getTime())){
			time = "2015-05-09";
		}else{
			Date date=newstrends.getTime();
			DateFormat df= DateFormat.getDateInstance();//日期格式，精确到日
			time=df.format(date);
			System.out.println(time);			
		}
				
		String newsimglist=req.getParameter("newsimglist");
		//System.out.println(newsimglist);
		JSONArray newsimgArray = JSONArray.parseArray(newsimglist);
		List<NewsImage> imagelist=new ArrayList<NewsImage>();
		int flag2=0;
		for (int i=0;i<newsimgArray.size();i++){
			 JSONObject object = (JSONObject)newsimgArray.get(i); //对于每个json对象
			 NewsImage e = (NewsImage) JSONToObj(object.toString(), NewsImage.class);
			 imagelist.add(e);
			 String news_image=e.getNews_image();
			 flag2=newsInputDao.InsertNewsImage(news_id, news_image);		 
		}
		//System.out.println("imagelist.length():"+imagelist.size());
		//System.out.println(flag2);
				
		int flag1 = 0;
		JSONObject json = new JSONObject();
		flag1 =newsInputDao.InsertNewsTrends(news_id, title, time, detail);
		json.put("flag", flag1+flag2);
		try{
			writeJson(json.toJSONString(),resp);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	
	
	//删除新闻
	@RequestMapping({ "/deleteNewsTrends" })
	public void deleteNewsTrends(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		int id = Integer.parseInt(req.getParameter("id"));
		int flag = newsInputDao.deleteNewsTrends(id);
		JSONObject json = new JSONObject();
		json.put("data", flag);
		try{
			writeJson(json.toJSONString(),resp);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//新闻编辑
		@RequestMapping({ "/editNewsTrends" })
		public void editNewsTrends(HttpServletRequest req, HttpServletResponse resp) throws Exception{
			String newsinfo=req.getParameter("newsinfo");		
			NewsTrends newstrends = (NewsTrends) JSONToObj(newsinfo, NewsTrends.class);
			String time;
			int id=newstrends.getId();
			int news_id = newstrends.getNews_id();
			String title  = newstrends.getTitle();
			String detail = newstrends.getDetail();
			if(newstrends.getTime()==null||"".equals(newstrends.getTime())){
				time = "2015-05-09";
			}else{
				Date date=newstrends.getTime();
				DateFormat df= DateFormat.getDateInstance();//日期格式，精确到日
				time=df.format(date);			
			}
					
			String newsimglist=req.getParameter("newsimglist");
			JSONArray newsimgArray = JSONArray.parseArray(newsimglist);
			List<NewsImage> imagelist=new ArrayList<NewsImage>();
			int flag2=0;
			for (int i=0;i<newsimgArray.size();i++){
				 JSONObject object = (JSONObject)newsimgArray.get(i); //对于每个json对象
				 NewsImage e = (NewsImage) JSONToObj(object.toString(), NewsImage.class);
				 imagelist.add(e);
				 String news_image=e.getNews_image();
				 flag2=newsInputDao.InsertNewsImage(news_id, news_image);		 
			}
					
			int flag1 = 0;
			JSONObject json = new JSONObject();
			flag1 =newsInputDao.editNewsTrends(id, news_id, title, time, detail);
			json.put("flag", flag1+flag2);
			try{
				writeJson(json.toJSONString(),resp);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		//新闻图片列表
		@RequestMapping({ "/NewsImgList" })    
		public void NewsImgList(HttpServletRequest req, HttpServletResponse resp){
			JSONObject json = new JSONObject();
			JSONArray array = new JSONArray();
			array = newsInputDao.selectNewsimgList();
			int count = array.size();
			json.put("total", count);
			json.put("rows", array);
			
			try{
				writeJson(json.toJSONString(),resp);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//删除新闻图片
		@RequestMapping({ "/deleteNewsImg" })
		public void deleteNewsImg(HttpServletRequest req, HttpServletResponse resp) throws Exception{
			int id = Integer.parseInt(req.getParameter("id"));
			int flag = newsInputDao.deleteNewsImg(id);
			JSONObject json = new JSONObject();
			json.put("data", flag);
			try{
				writeJson(json.toJSONString(),resp);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		@RequestMapping(value = "/newsimgInput")
	    public void handleFormUpload( @RequestParam("file") MultipartFile file, HttpServletResponse resp) {
			JSONObject json = new JSONObject();		
	        if (!file.isEmpty()) {
	        	try{	        		
	        			ImageDao.CopyImage(file,new String(file.getOriginalFilename().getBytes("ISO8859_1"),"utf-8"));
	        	}
	        	catch(Exception e){
	        		e.printStackTrace();
	        	}
	        	try{
	    			writeJson(json.toJSONString(),resp);
	    		}catch(Exception e){
	    			e.printStackTrace();
	    		}
	        }
	    }
		
		
		
				
	public void writeJson(String json, HttpServletResponse response)throws Exception{
	    response.setContentType("text/html");
	    response.setCharacterEncoding("UTF-8");
	    PrintWriter out = response.getWriter();
	    if(StringUtils.isNotEmpty(json)){
	        out.println(json);
	    }
	    out.flush();
	    out.close();
	}
	
	 public static<T> Object JSONToObj(String jsonStr,Class<T> obj) {
	        T t = null;
	        try {
	            ObjectMapper objectMapper = new ObjectMapper();
	            t = objectMapper.readValue(jsonStr,
	                    obj);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return t;
	    }
	
}
