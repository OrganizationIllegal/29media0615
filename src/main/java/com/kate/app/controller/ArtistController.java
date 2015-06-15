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
		StarInfo star1=list.get(0);
		req.setAttribute("star1", star1);
		//return "artistdetail.jsp";
		return "artist.jsp";
	}

}
