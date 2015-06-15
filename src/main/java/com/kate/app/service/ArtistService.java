package com.kate.app.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kate.app.dao.StarInfoDAO;
import com.kate.app.model.StarInfo;



@Service
public class ArtistService {
	@Autowired
	private StarInfoDAO starInfoDAO;
	
	public List<StarInfo> getArtistList(){
		List<StarInfo> list =new ArrayList<StarInfo>();
		list=starInfoDAO.findAll();
		return list;
	}
	
	
}
