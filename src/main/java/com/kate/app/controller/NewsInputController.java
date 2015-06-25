package com.kate.app.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.kate.app.dao.NewsInputDAO;

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
	
	//新闻博客录入
	/*@RequestMapping({ "/inputNewsBoke" })
	public void inputNewsBoke(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		String news_num = req.getParameter("news_num");
		String news_title  = req.getParameter("news_title");
		String news_people  = req.getParameter("news_people");
		String news_time = req.getParameter("news_time");
		String news_fenlei = req.getParameter("news_fenlei");
		String news_detail  = req.getParameter("news_detail");
		String news_image  = req.getParameter("news_image");
		String news_abstract  = req.getParameter("news_abstract");
		int flag = 0;
		JSONObject json = new JSONObject();
		flag =newsBokeDao.InsertNewsBoke(news_num, news_title, news_people, news_time, news_fenlei, news_abstract, news_detail, news_image);
		json.put("flag", flag);
		try{
			writeJson(json.toJSONString(),resp);
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}*/
				
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
