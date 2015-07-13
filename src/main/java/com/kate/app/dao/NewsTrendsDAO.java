package com.kate.app.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import org.springframework.stereotype.Repository;

import com.kate.app.model.News;
import com.kate.app.model.NewsTrends;

@Repository 

public class NewsTrendsDAO extends BaseDao {
	public List<NewsTrends> findAll(){
	List<NewsTrends> list = new ArrayList<NewsTrends>();
	try{
		
		String sql = " select * from news_trends order by time desc";
        Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){					
			NewsTrends data = new NewsTrends();
			data.setId(rs.getInt("id"));
			data.setDetail(rs.getString("detail"));
			data.setImage(rs.getString("image"));
			data.setNews_id(rs.getInt("news_id"));
			data.setTime(rs.getDate("time"));
			data.setTitle(rs.getString("title"));
			list.add(data);
		}
		
	}catch (Exception e) {
        
    }
		return list;
	}
	
	public List<NewsTrends> findByNewsTrendId(int newsId){
		List<NewsTrends> list = new ArrayList<NewsTrends>();
		try{
			
			String sql = " select * from news_trends where news_id=? order by time desc";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, newsId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){					
				NewsTrends data = new NewsTrends();
				data.setId(rs.getInt("id"));
				data.setDetail(rs.getString("detail"));
				data.setImage(rs.getString("image"));
				data.setTime(rs.getDate("time"));
				data.setTitle(rs.getString("title"));
				list.add(data);
			}
			
		}catch (Exception e) {
	        
	    }
			return list;
		}
	
	
}