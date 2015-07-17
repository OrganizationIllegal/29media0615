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
		
		trainList=trainDao.findAll();
		
		if(trainList.size() > 3){
			trainList = trainList.subList(0, 3);
		}
		
		for(Train item : trainList){
			List<TrainDetail> trainDetailList=new ArrayList<TrainDetail>();
			int tempId = item.getTrain_id();
			if(tempId != 0){
				trainDetailList = trainDetailDAO.findByTrainId(item.getTrain_id());
				if(trainDetailList!=null && trainDetailList.size()>0){
					for(TrainDetail item1 : trainDetailList){
						String detailTemp = item1.getDetail();
						detailTemp = detailTemp.replace("\\n", "<br/>");
						detailTemp = detailTemp.replace(" ", "&nbsp;");
						item1.setDetail(detailTemp);
					}
				}
			}
			item.setList(trainDetailList);
		}
		
		req.setAttribute("trainList", trainList);
		
		
		//req.setAttribute("trainid_lianxi", result);
		return "/train.jsp";
	}
	
	
	
	@RequestMapping({ "/TrainDetail" })
	public String TrainDetail(HttpServletRequest req,HttpServletResponse resp){
		String id_str = req.getParameter("id");
		String train_id_str = req.getParameter("train_id");
		int id = 0;
		int train_id=0;	
		List<LianXi> lianxiList=new ArrayList<LianXi>();
		
		if(train_id_str!=null  && !"".equals(train_id_str)){
			train_id = Integer.parseInt(train_id_str);
			lianxiList=trainDao.findAllLianXiByTrainId(train_id);
		}
		
		LianXi data = new LianXi();
		if(null!=id_str && !"".equals(id_str)){
			id = Integer.parseInt(id_str);
			data = trainDao.findnewsById(id);
		}
		else{
			if(lianxiList.size()>0){
				data = lianxiList.get(0);
			}
			else
				data = null;
		}
		String detail = "";
		if(data!=null){
			detail = data.getDetail();
		}
		
		
		
		//鏍规嵁train_id浠巐ianxi琛ㄤ腑寰楀埌淇℃伅
		
		
		req.setAttribute("lianxiList", lianxiList);
		//鏍规嵁id鍦╨ianxi琛ㄤ腑鎵剧浉搴旇褰�
		
		req.setAttribute("data", data);
		req.setAttribute("detail", detail);
		
		return "/traindetail.jsp";
	}
	
	
	/*@RequestMapping({ "/TrainDetailNeirong" })
	public String TrainDetailNeirong(HttpServletRequest req,HttpServletResponse resp){
		String id_str = req.getParameter("id");
		int id=Integer.parseInt(id_str);
			
		//鏍规嵁train_id浠巐ianxi琛ㄤ腑寰楀埌淇℃伅
		LianXi data=new LianXi();
		data = trainDao.findLianXiById(id);
		req.setAttribute("data", data);
		//鏍规嵁id鍦╨ianxi琛ㄤ腑鎵剧浉搴旇褰�
		LianXi data = trainDao.findnewsById(id);
		req.setAttribute("data", data);
		return "/traindetail.jsp";
	}*/
	
	
	/*//lianxi琛ㄤ腑鏍规嵁id鍙栬褰�
	@RequestMapping({ "/Detail" })
	public String Detail(HttpServletRequest req,HttpServletResponse resp){
		String newsid_str = req.getParameter("id");
		int newsid=Integer.parseInt(newsid_str);
		List<LianXi> newsList=new ArrayList<LianXi>();
		newsList=trainDao.findAllLianXiById(newsid);
		req.setAttribute("newsList", newsList);
		//鏍规嵁id鍦╨ianxi琛ㄤ腑鎵剧浉搴旇褰�
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
