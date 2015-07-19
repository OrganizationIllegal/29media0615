package com.kate.app.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.kate.app.model.StarImage;

@Repository 
public class StarImageDAO extends BaseDao {
	public List<StarImage> findAll(){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
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