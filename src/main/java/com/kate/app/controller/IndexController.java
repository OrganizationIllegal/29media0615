package com.kate.app.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kate.app.dao.LunboImageDAO;
import com.kate.app.dao.NewsTrendsDAO;
import com.kate.app.dao.TrainDAO;
import com.kate.app.model.LunboImage;
import com.kate.app.model.NewsTrends;


@Controller
public class IndexController {
	@Autowired
	private TrainDAO trainDao;
	@Autowired
	private NewsTrendsDAO newsTrendsDAO;
	@Autowired
	private LunboImageDAO lunboImageDAO;
	
	
	
	@RequestMapping({ "/", "/Index" })
	public String getIndex(HttpServletRequest req,HttpServletResponse resp){
		List<NewsTrends> list1=new ArrayList<NewsTrends>();
		List<LunboImage> list5=new ArrayList<LunboImage>();
		List<LunboImage> list50=new ArrayList<LunboImage>();
		List<LunboImage> list51=new ArrayList<LunboImage>();
		List<LunboImage> list52=new ArrayList<LunboImage>();
		List<LunboImage> list53=new ArrayList<LunboImage>();
		list1=newsTrendsDAO.findAll();
		list5=lunboImageDAO.findAll();
		if(list5.size()>0){
			for(LunboImage item : list5){
				if(item.getType().equals("�����ֲ�")){
					list50.add(item);
				}else if(item.getType().equals("培训轮播")){
					list51.add(item);
				}else if(item.getType().equals("明星图片")){
					list52.add(item);
				}else if(item.getType().equals("影视图片")){
					list53.add(item);
				}	
			}
		}
		String toplunbo1=null;
		String href1 = null;
		String toplunbo2=null;
		String href2 = null;
		String toplunbo3=null;
		String href3 = null;
		String toplunbo4=null;
		String href4 = null;
		
		if(list50.size()>3){
			if(list50.get(0).getImg()==null||"".equals(list50.get(0).getImg())){
				toplunbo1="lunbo1.jpg";
			}else{
				toplunbo1=list50.get(0).getImg();
			}
			if(list50.get(1).getImg()==null||"".equals(list50.get(1).getImg())){
				toplunbo2="lunbo2.jpg";
			}else{
				toplunbo2=list50.get(1).getImg();
			}
			if(list50.get(2).getImg()==null||"".equals(list50.get(2).getImg())){
				toplunbo3="lunbo2.jpg";
			}else{
				toplunbo3=list50.get(2).getImg();
			}
			if(list50.get(3).getImg()==null||"".equals(list50.get(3).getImg())){
				toplunbo4="lunbo2.jpg";
			}else{
				toplunbo4=list50.get(3).getImg();
			}	
			if(list50.get(0).getHref()==null||"".equals(list50.get(0).getHref())){
				href1="";
			}else{
				href1=list50.get(0).getHref();
			}
			if(list50.get(1).getHref()==null||"".equals(list50.get(1).getHref())){
				href2="";
			}else{
				href2=list50.get(1).getHref();
			}
			if(list50.get(2).getHref()==null||"".equals(list50.get(2).getHref())){
				href3="";
			}else{
				href3=list50.get(2).getHref();
			}
			if(list50.get(3).getHref()==null||"".equals(list50.get(3).getHref())){
				href4="";
			}else{
				href4=list50.get(3).getHref();
			}
			
		}else{
			toplunbo1="lunbo1.jpg";
			toplunbo2="lunbo2.jpg";
			toplunbo3="lunbo3.jpg";
			toplunbo4="lunbo4.jpg";
			href1="";
			href2="";
			href3="";
			href4="";
		}
		String trainlunbo1=null;
		String trainlunbo2=null;
		String trainlunbo3=null;
		if(list51.size()>2){
			if(list51.get(0).getImg()==null||"".equals(list51.get(0).getImg())){
				trainlunbo1="lunbo1.jpg";
			}else{
				trainlunbo1=list51.get(0).getImg();
			}
			if(list51.get(1).getImg()==null||"".equals(list51.get(1).getImg())){
				trainlunbo2="lunbo2.jpg";
			}else{
				trainlunbo2=list51.get(1).getImg();
			}
			if(list51.get(2).getImg()==null||"".equals(list51.get(2).getImg())){
				trainlunbo3="lunbo3.jpg";
			}else{
				trainlunbo3=list51.get(2).getImg();
			}
		}else{
			trainlunbo1="lunbo1.jpg";
			trainlunbo2="lunbo2.jpg";
			trainlunbo3="lunbo3.jpg";			
		}
		String starimg1=null;
		String starimg2=null;
		String starimg3=null;
		String starimg4=null;
		String starimg5=null;
		String starimg6=null;
		String starimg7=null;
		if(list52.size()>6){
			if(list52.get(0).getImg()==null||"".equals(list52.get(0).getImg())){
				starimg1="img01.jpg";
			}else{
				starimg1=""+list52.get(0).getImg();
			}
			if(list52.get(1).getImg()==null||"".equals(list52.get(1).getImg())){
				starimg2="img02.jpg";
			}else{
				starimg2=""+list52.get(1).getImg();
			}
			if(list52.get(2).getImg()==null||"".equals(list52.get(2).getImg())){
				starimg3="img03.jpg";
			}else{
				starimg3=list52.get(2).getImg();
			}
			if(list52.get(3).getImg()==null||"".equals(list52.get(3).getImg())){
				starimg4="img01.jpg";
			}else{
				starimg4=list52.get(3).getImg();
			}
			if(list52.get(4).getImg()==null||"".equals(list52.get(4).getImg())){
				starimg5="img02.jpg";
			}else{
				starimg5=list52.get(4).getImg();
			}
			if(list52.get(5).getImg()==null||"".equals(list52.get(5).getImg())){
				starimg6="img04.jpg";
			}else{
				starimg6=list52.get(5).getImg();
			}
			if(list52.get(6).getImg()==null||"".equals(list52.get(6).getImg())){
				starimg7="img05.jpg";
			}else{
				starimg7=list52.get(6).getImg();
			}
		}else{
			starimg1="img01.jpg";
			starimg2="img02.jpg";
			starimg3="img03.jpg";
			starimg4="img01.jpg";
			starimg5="img02.jpg";
			starimg6="img04.jpg";
			starimg7="img05.jpg";
		}
		String videoimg1=null;
		String videoimg2=null;
		String videoimg3=null;
		String videoimg4=null;
		if(list53.size()>3){
			if(list53.get(0).getImg()==null||"".equals(list53.get(0).getImg())){
				videoimg1="img01.jpg";
			}else{
				videoimg1=list53.get(0).getImg();
			}
			if(list53.get(1).getImg()==null||"".equals(list53.get(1).getImg())){
				videoimg2="img02.jpg";
			}else{
				videoimg2=list53.get(1).getImg();
			}
			if(list53.get(2).getImg()==null||"".equals(list53.get(2).getImg())){
				videoimg3="img04.jpg";
			}else{
				videoimg3=list53.get(2).getImg();
			}
			if(list53.get(3).getImg()==null||"".equals(list53.get(3).getImg())){
				videoimg4="img05.jpg";
			}else{
				videoimg4=list53.get(3).getImg();
			}
		}else{
			videoimg1="img01.jpg";
			videoimg2="img02.jpg";
			videoimg3="img04.jpg";
			videoimg4="img05.jpg";
		}
		req.setAttribute("NewsList", list1);
		req.setAttribute("toplunbo1", toplunbo1);
		req.setAttribute("toplunbo2", toplunbo2);
		req.setAttribute("toplunbo3", toplunbo3);
		req.setAttribute("toplunbo4", toplunbo4);
		req.setAttribute("href1", href1);
		req.setAttribute("href2", href2);
		req.setAttribute("href3", href3);
		req.setAttribute("href4", href4);
		req.setAttribute("trainlunbo1", trainlunbo1);
		req.setAttribute("trainlunbo2", trainlunbo2);
		req.setAttribute("trainlunbo3", trainlunbo3);
		req.setAttribute("starimg1", starimg1);
		req.setAttribute("starimg2", starimg2);
		req.setAttribute("starimg3", starimg3);
		req.setAttribute("starimg4", starimg4);
		req.setAttribute("starimg5", starimg5);
		req.setAttribute("starimg6", starimg6);
		req.setAttribute("starimg7", starimg7);
		req.setAttribute("videoimg1", videoimg1);
		req.setAttribute("videoimg2", videoimg2);
		req.setAttribute("videoimg3", videoimg3);
		req.setAttribute("videoimg4", videoimg4);		
		return "/index.jsp";
	}

}
