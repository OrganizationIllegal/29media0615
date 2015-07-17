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
		String vedioParam = req.getParameter("vedioParam");
		StarVedio vedio = new StarVedio();
		List<StarVedio> vedioList = vedioDao.findVedio();
		List<StarVedio> linxishengList = new ArrayList<StarVedio>();
		List<StarVedio> originvedioList = new ArrayList<StarVedio>();
		List<StarVedio> resultList = new ArrayList<StarVedio>();
		
		if(vedioParam!=null && !"".equals(vedioParam)){
			if(vedioList!=null && vedioList.size() > 0){
				for(StarVedio item : vedioList){
					if(item.getType().equals(vedioParam)){
						resultList.add(item);
					}
				}
			}
		}
		else{
			if(vedioList!=null && vedioList.size() > 0){
				for(StarVedio item : vedioList){
					if(item.getType().equals("练习生视频")){
						resultList.add(item);
					}
				}
			}
		}
		
		req.setAttribute("resultList", resultList);
	
		return "/video.jsp";
	}

}
