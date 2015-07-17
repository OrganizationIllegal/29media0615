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
		String id=req.getParameter("id");
		int idInt = 0;
		StarVedio vedio = new StarVedio();
		List<StarInfo> starlist=new ArrayList<StarInfo>();
		List<StarVedio> vedioList=vedioDao.findVedio();
		if(id!=null && !"".equals(id)){
			idInt = Integer.parseInt(id);
			vedio = vedioDao.findVedioById(idInt);
		}
		else{
			if(vedioList!=null && vedioList.size()>0){
				vedio = vedioList.get(0);
			}
			
		}
		starlist=starInfoDAO.findAll();
		
		req.setAttribute("vedio", vedio);
		req.setAttribute("starlist", starlist);
		req.setAttribute("vedioList", vedioList);
		return "/video.jsp";
	}

}
