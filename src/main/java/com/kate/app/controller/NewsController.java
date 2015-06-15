package com.kate.app.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kate.app.dao.NewsDAO;
import com.kate.app.dao.NewsImageDAO;
import com.kate.app.dao.NewsTrendsDAO;
import com.kate.app.dao.StarVedioDAO;
import com.kate.app.dao.TrainDAO;
import com.kate.app.model.News;
import com.kate.app.model.NewsImage;
import com.kate.app.model.NewsTrends;
import com.kate.app.model.StarImage;
import com.kate.app.model.StarVedio;
import com.kate.app.model.Train;
import com.kate.app.service.IndexService;


@Controller
public class NewsController {
	@Autowired
	private IndexService indexService;
	@Autowired
	private TrainDAO trainDao;
	@Autowired
	private NewsTrendsDAO newsTrendsDAO;
	@Autowired
	private NewsImageDAO newsImageDAO;
	@Autowired
	private StarVedioDAO starVedioDAO;
	@Autowired
	private NewsDAO newsDAO;
	
	
	
	@RequestMapping({ "/News" })
	public String getTrain(HttpServletRequest req,HttpServletResponse resp){
		String newsId = req.getParameter("newsId");
		int news_id = 0;
		if(newsId!=null && !"".equals(newsId)){
			news_id = Integer.parseInt(newsId);
		}
		News newsInfo = newsDAO.findByNewId(news_id);
		List<NewsTrends> trendList = newsTrendsDAO.findAll();
		List<NewsImage> imageList = newsImageDAO.findByNewsImgId(news_id);
		
		req.setAttribute("newsInfo", newsInfo);
		req.setAttribute("trendList", trendList);
		req.setAttribute("imageList", imageList);
		
		return "/news.jsp";
	}

}
