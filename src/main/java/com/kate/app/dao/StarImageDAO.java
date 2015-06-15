package com.kate.app.dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import org.springframework.stereotype.Repository;

import com.kate.app.model.NewsTrends;
import com.kate.app.model.StarImage;

@Repository 
public class StarImageDAO extends BaseDao {
	public List<StarImage> findAll(){
	List<StarImage> list = new ArrayList<StarImage>();
	try{
		
		String sql = " select * from star_image";
        Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){					
			StarImage data = new StarImage();
			data.setId(rs.getInt("id"));
			data.setImg(rs.getString("img"));
			data.setStar_num(rs.getInt("star_num"));
			list.add(data);
		}
		
	}catch (Exception e) {
        
    }
		return list;
	}
}