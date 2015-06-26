package com.kate.app.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.kate.app.dao.ImageDao;
import com.kate.app.dao.NewsInputDAO;
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
	public String getTrain(HttpServletRequest req,HttpServletResponse resp){
		int id = Integer.parseInt(req.getParameter("id"));
		NewsTrends newstrends = newsInputDao.findById(id);		
		req.setAttribute("newstrends", newstrends);
		return "/newsEdit.jsp";
	}
	
	
	//新闻录入
	@RequestMapping({ "/inputNewsTrends" })
	public void inputNewsTrends(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		String news_id = req.getParameter("news_id");
		String title  = req.getParameter("title");
		String time  = req.getParameter("time");
		String detail = req.getParameter("detail");
		int newsid=0; 
		if(news_id!=null && !"".equals(news_id)){
			newsid=Integer.parseInt(news_id);
		}
		if(time==null||"".equals(time)){
			time = "2015-05-09";
		}
		int flag = 0;
		JSONObject json = new JSONObject();
		flag =newsInputDao.InsertNewsTrends(newsid, title, time, detail);
		json.put("flag", flag);
		try{
			writeJson(json.toJSONString(),resp);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
	//删除新闻
	@RequestMapping({ "/deleteNewsTrends" })
	public void deleteArea(HttpServletRequest req, HttpServletResponse resp) throws Exception{
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
	
	//新闻录入
		@RequestMapping({ "/editNewsTrends" })
		public void editNewsTrends(HttpServletRequest req, HttpServletResponse resp) throws Exception{
			int id = Integer.parseInt(req.getParameter("id"));
			String news_id = req.getParameter("news_id");
			String title  = req.getParameter("title");
			String time  = req.getParameter("time");
			String detail = req.getParameter("detail");
			int newsid=0; 
			if(news_id!=null && !"".equals(news_id)){
				newsid=Integer.parseInt(news_id);
			}
			if(time==null||"".equals(time)){
				time = "2015-05-09";
			}
			int flag = 0;
			JSONObject json = new JSONObject();
			flag =newsInputDao.editNewsTrends(id, newsid, title, time, detail);
			json.put("flag", flag);
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
	
	
}
