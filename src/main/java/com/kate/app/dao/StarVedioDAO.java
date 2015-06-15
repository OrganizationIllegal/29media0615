package com.kate.app.dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import org.springframework.stereotype.Repository;

import com.kate.app.model.StarImage;
import com.kate.app.model.StarVedio;


@Repository 
public class StarVedioDAO extends BaseDao {
	public List<StarVedio> findAll(){
	List<StarVedio> list = new ArrayList<StarVedio>();
	try{
		
		String sql = " select * from star_vedio";
        Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){					
			StarVedio data = new StarVedio();
			data.setId(rs.getInt("id"));
			data.setStar_num(rs.getInt("star_num"));
			data.setVideo_id(rs.getInt("video_id"));
			data.setVideo_pic(rs.getString("video_pic"));
			list.add(data);
		}
		
	}catch (Exception e) {
        
    }
		return list;
	}
}