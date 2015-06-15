package com.kate.app.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kate.app.dao.NewsTrendsDAO;
import com.kate.app.dao.StarImageDAO;
import com.kate.app.dao.StarVedioDAO;
import com.kate.app.dao.TrainDAO;
import com.kate.app.model.NewsTrends;
import com.kate.app.model.StarImage;
import com.kate.app.model.StarVedio;
import com.kate.app.model.Train;



@Service
public class IndexService {
	@Autowired
	private NewsTrendsDAO newsTrendDao;
	@Autowired
	private TrainDAO trainDao;
	@Autowired
	private StarImageDAO starImageDAO;
	@Autowired
	private StarVedioDAO starVedioDAO;
	
	/*最新动态*/
	public List<NewsTrends> getNewsList(){
		List<NewsTrends> list =new ArrayList<NewsTrends>();
		list=newsTrendDao.findAll();
		return list;
	}
	
	/*培训*/
	public List<Train> getTrainList(){
		List<Train> list =new ArrayList<Train>();
		list=trainDao.findAll();
		return list;
	}
	
	/*明星图片*/
	public List<StarImage> getImgList(){
		List<StarImage> list =new ArrayList<StarImage>();
		list=starImageDAO.findAll();
		return list;
	}
	
	/*明星图片*/
	public List<StarVedio> getVedioList(){
		List<StarVedio> list =new ArrayList<StarVedio>();
		list=starVedioDAO.findAll();
		return list;
	}
}
