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
		/*String star_num=req.getParameter("starNum");*/
		//鎵惧嚭澶氭湁鑹轰汉鍥剧墖
		List<StarInfo> starlist=new ArrayList<StarInfo>();
		starlist=starInfoDAO.findAll();
		req.setAttribute("starlist", starlist);
		//鎵惧嚭鑹轰汉star_num鎵惧嚭鑹轰汉鐩稿叧鐨勮棰戜俊鎭�
		List<StarVedio> vedioList=vedioDao.findVedio();
		req.setAttribute("starVedioList", vedioList);
		return "/video.jsp";
	}

}
