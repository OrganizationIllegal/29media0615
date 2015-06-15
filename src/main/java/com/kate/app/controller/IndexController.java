package com.kate.app.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kate.app.dao.NewsTrendsDAO;
import com.kate.app.dao.StarImageDAO;
import com.kate.app.dao.StarVedioDAO;
import com.kate.app.dao.TrainDAO;
import com.kate.app.model.NewsTrends;
import com.kate.app.model.StarImage;
import com.kate.app.model.StarVedio;
import com.kate.app.model.Train;
import com.kate.app.service.IndexService;


@Controller
public class IndexController {
	@Autowired
	private IndexService indexService;
	@Autowired
	private TrainDAO trainDao;
	@Autowired
	private NewsTrendsDAO newsTrendsDAO;
	@Autowired
	private StarImageDAO starImageDAO;
	@Autowired
	private StarVedioDAO starVedioDAO;
	
	
	
	@RequestMapping({ "/", "/Index" })
	public String getTrain(HttpServletRequest req,HttpServletResponse resp){
		List<NewsTrends> list1=new ArrayList<NewsTrends>();
		List<Train> list2=new ArrayList<Train>();
		List<StarImage> list3=new ArrayList<StarImage>();
		List<StarVedio> list4=new ArrayList<StarVedio>();
		list1=newsTrendsDAO.findAll();
		list2=trainDao.findAll();
		list3=starImageDAO.findAll();
		list4=starVedioDAO.findAll();
		String vedio1=null;
		String vedio2=null;
		String vedio3=null;
		String vedio4=null;
		String train1=list2.get(0).getTrain_image();
		String train2=list2.get(1).getTrain_image();
		String train3=list2.get(2).getTrain_image();
		String img1=list3.get(0).getImg();//鏄庢槦鍥剧墖1
		String img2=list3.get(1).getImg();//鏄庢槦鍥剧墖2
		String img3=list3.get(2).getImg();//鏄庢槦鍥剧墖3
		String img4=list3.get(3).getImg();//鏄庢槦鍥剧墖4
		String img5=list3.get(4).getImg();//鏄庢槦鍥剧墖5
		String img6=list3.get(5).getImg();//鏄庢槦鍥剧墖6
		String img7=list3.get(6).getImg();//鏄庢槦鍥剧墖7
		if(list4.size()>0){
			vedio1=list4.get(0).getVideo_pic();
			vedio2=list4.get(1).getVideo_pic();
			vedio3=list4.get(2).getVideo_pic();
			vedio4=list4.get(3).getVideo_pic();
		}
		
		req.setAttribute("NewsList", list1);
		req.setAttribute("train1", train1);
		req.setAttribute("train2", train2);
		req.setAttribute("train3", train3);
		req.setAttribute("img1", img1);
		req.setAttribute("img2", img2);
		req.setAttribute("img3", img3);
		req.setAttribute("img4", img4);
		req.setAttribute("img5", img5);
		req.setAttribute("img6", img6);
		req.setAttribute("img7", img7);
		req.setAttribute("vedio1", vedio1);
		req.setAttribute("vedio2", vedio2);
		req.setAttribute("vedio3", vedio3);
		req.setAttribute("vedio4", vedio4);
		return "/index.jsp";
	}

}
