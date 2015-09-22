package com.kate.app.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kate.app.dao.StarInfoDAO;
import com.kate.app.model.StarInfo;
import com.kate.app.service.ArtistService;


@Controller
public class ArtistController {
	@Autowired
	private ArtistService artistService;
	@Autowired
	private StarInfoDAO starInfoDAO;
	
	@RequestMapping({"/Artist" })
	public String getTrain(HttpServletRequest req,HttpServletResponse resp){
		List<StarInfo> list=new ArrayList<StarInfo>();
		list=starInfoDAO.findAll();
		StarInfo star1 = null;
		int id = 0;
		String starNum = req.getParameter("id");
		
		if(starNum == null || "".equals(starNum)){
			if(list!=null&&!list.isEmpty()){
				star1 = list.get(0);
			}
		}
		else{
			id = Integer.parseInt(starNum);
			star1=starInfoDAO.findByStarId(id);
			String detail = star1.getStar_detail();
			/*detail = detail.replace("\n", "<p>");
			detail = detail.replace("\\n", "<p>");
			detail = detail.replace(" ", "&nbsp;");
			detail = detail.replace("&gt;", ">");
			detail = detail.replace("&lt;", "<");*/
			star1.setStar_detail(detail);
		}
		req.setAttribute("star1", star1);
		req.setAttribute("list", list);
		//return "artistdetail.jsp";
		return "artist.jsp";
	}

}
