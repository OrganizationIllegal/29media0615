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
import com.kate.app.model.LianXi;
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
		req.setAttribute("trainid_lianxi", lianxishengList.get(0).getTrain_id());
		
		req.setAttribute("guojibanList", guojibanList);
		
		
		return "/train.jsp";
	}
	
	
	
	@RequestMapping({ "/TrainDetail" })
	public String TrainDetail(HttpServletRequest req,HttpServletResponse resp){
		String id_str = req.getParameter("id");
		int id = 0;
		int train_id=0;	
		List<LianXi> lianxiList=new ArrayList<LianXi>();
		LianXi data = new LianXi();
		if(null!=id_str && !"".equals(id_str)){
			id = Integer.parseInt(id_str);
			data = trainDao.findnewsById(id);
		}
		
		String train_id_str = req.getParameter("train_id");
		if(train_id_str!=null  && !"".equals(train_id_str)){
			train_id = Integer.parseInt(train_id_str);
			lianxiList=trainDao.findAllLianXiByTrainId(train_id);
		}
		
		//根据train_id从lianxi表中得到信息
		
		
		req.setAttribute("lianxiList", lianxiList);
		//根据id在lianxi表中找相应记录
		
		req.setAttribute("data", data);
		return "/traindetail.jsp";
	}
	
	
	/*@RequestMapping({ "/TrainDetailNeirong" })
	public String TrainDetailNeirong(HttpServletRequest req,HttpServletResponse resp){
		String id_str = req.getParameter("id");
		int id=Integer.parseInt(id_str);
			
		//根据train_id从lianxi表中得到信息
		LianXi data=new LianXi();
		data = trainDao.findLianXiById(id);
		req.setAttribute("data", data);
		//根据id在lianxi表中找相应记录
		LianXi data = trainDao.findnewsById(id);
		req.setAttribute("data", data);
		return "/traindetail.jsp";
	}*/
	
	
	/*//lianxi表中根据id取记录
	@RequestMapping({ "/Detail" })
	public String Detail(HttpServletRequest req,HttpServletResponse resp){
		String newsid_str = req.getParameter("id");
		int newsid=Integer.parseInt(newsid_str);
		List<LianXi> newsList=new ArrayList<LianXi>();
		newsList=trainDao.findAllLianXiById(newsid);
		req.setAttribute("newsList", newsList);
		//根据id在lianxi表中找相应记录
		//LianXi data = trainDao.findLianXiById(newId);
		return "/traindetail.jsp";
	}*/
	
	/*	if(id == null || "".equals(id)){
			id = "1";
		}*/
		/*int newId = Integer.parseInt(id); 
		List<LianXi> lianXiList=new ArrayList<LianXi>();
		List<String> typeNameList = new ArrayList<String>();
		lianXiList=trainDao.findAllLianXi();
		for(LianXi item : lianXiList){
			String data = item.getTypename();
			typeNameList.add(data);
		}
		LianXi data = trainDao.findLianXiById(newId);
		req.setAttribute("data", data);
		req.setAttribute("lianXiList", lianXiList);
		req.setAttribute("typeNameList", typeNameList);
		return "/traindetail.jsp";
	}*/
	
	
	

}
