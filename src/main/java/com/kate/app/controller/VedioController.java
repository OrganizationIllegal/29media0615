package com.kate.app.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kate.app.dao.StarInfoDAO;
import com.kate.app.dao.VedioDAO;
import com.kate.app.model.StarInfo;
import com.kate.app.model.StarVedio;


@Controller
public class VedioController {
	@Autowired
	private StarInfoDAO starInfoDAO;
	@Autowired
	private VedioDAO vedioDao;
	@RequestMapping({"/VideoList" })
	public String getVedio(HttpServletRequest req,HttpServletResponse resp){
		String star_num=req.getParameter("starNum");
		//找出多有艺人图片
		List<StarInfo> starlist=new ArrayList<StarInfo>();
		starlist=starInfoDAO.findAll();
		req.setAttribute("starlist", starlist);
		//找出艺人star_num找出艺人相关的视频信息
		List<StarVedio> starVedioList=vedioDao.findVedioByStarNum(star_num);
		req.setAttribute("starVedioList", starVedioList);
		return "/video.jsp";
	}

}
