package com.kate.app.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.kate.app.model.NewsImage;


@Repository 
public class NewsImageDAO extends BaseDao {
	public List<NewsImage> findByNewsImgId(int newsId){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;

		List<NewsImage> list = new ArrayList<NewsImage>();
		try{
			
			String sql = " select * from news_image where news_id=?";
			  pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, newsId);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){					
				NewsImage data = new NewsImage();
				data.setId(rs.getInt("id"));
				data.setNews_image(rs.getString("news_image"));
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