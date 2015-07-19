package com.kate.app.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.kate.app.model.News;


@Repository 
public class WinExperienceDAO extends BaseDao {
	public List<News> findAll(){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
	List<News> list = new ArrayList<News>();
	try{
		
		String sql = " select * from News";
        Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){					
			News data = new News();
			data.setId(rs.getInt("id"));
			data.setNews_detail(rs.getString("news_detail"));
			data.setNews_id(rs.getInt("news_id"));
			data.setNews_time(rs.getDate("news_time"));
			data.setNews_title(rs.getString("news_title"));
			list.add(data);
		}
		
	}catch (Exception e) {
        
    }finally{  
        if(pstmt != null){  
            try {  
            	pstmt.close();  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        }  
        if(con != null){  
            try {  
                con.close();  
            } catch (SQLException e) {  
                e.printStackTrace();  
            }  
        }  
    }
		return list;
	}
}