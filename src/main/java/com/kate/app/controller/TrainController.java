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
import com.kate.app.dao.TrainDetailDAO;
import com.kate.app.model.Train;
import com.kate.app.model.TrainDetail;


@Controller
public class TrainController {
	@Autowired
	private TrainDetailDAO trainDetailDAO;
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
	
	
	
	@RequestMapping({ "/Train" })
	public String getTrain(HttpServletRequest req,HttpServletResponse resp){
		//String newsId = req.getParameter("newsId");
		List<Train> trainList=new ArrayList<Train>();
		List<TrainDetail> xingqubanList = new ArrayList<TrainDetail>();
		List<TrainDetail> lianxishengList = new ArrayList<TrainDetail>();
		List<TrainDetail> guojibanList = new ArrayList<TrainDetail>();
		
		
		trainList=trainDao.findAll();
		for(Train item : trainList){
			if(item.getTrain_id()==1)
				xingqubanList = trainDetailDAO.findByTrainId(item.getTrain_id());
			else if(item.getTrain_id()==2)
				lianxishengList = trainDetailDAO.findByTrainId(item.getTrain_id());
			else if(item.getTrain_id()==3)
				guojibanList = trainDetailDAO.findByTrainId(item.getTrain_id());
		}
		req.setAttribute("trainList", trainList);
		req.setAttribute("xingqubanList", xingqubanList);
		req.setAttribute("lianxishengList", lianxishengList);
		req.setAttribute("guojibanList", guojibanList);
		
		
		return "/train.jsp";
	}

}
