package com.kate.app.dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.kate.app.model.StarInfo;
import com.kate.app.model.StarVedio;

@Repository 
public class VedioDAO extends BaseDao {
	//根据star_num从star_video中找到信息
	public List<StarVedio> findVedioByStarNum(String star_num){
		List<StarVedio> list = new ArrayList<StarVedio>();
		try{
			
			String sql = " select * from star_vedio where star_num='"+star_num+"'";
	        Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){					
				StarVedio starVedio=new StarVedio();
				starVedio.setId(rs.getInt("id"));
				starVedio.setStar_num(rs.getString("star_num"));
				starVedio.setVideo_pic(rs.getString("video_pic"));
				starVedio.setVideo_id(rs.getString("video_id"));
				starVedio.setVideo_link(rs.getString("video_link"));
				list.add(starVedio);
			}
			
		}catch (Exception e) {
	        
	    }
			return list;
		}

	
}