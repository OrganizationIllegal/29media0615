package com.kate.app.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.kate.app.model.StarVedio;


@Repository 
public class StarVedioDAO extends BaseDao {
	public List<StarVedio> findAll(){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
	List<StarVedio> list = new ArrayList<StarVedio>();
	try{
		
		String sql = " select * from star_vedio";
        Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){					
			StarVedio data = new StarVedio();
			data.setId(rs.getInt("id"));
			data.setStar_num(rs.getString("star_num"));
			data.setVideo_id(rs.getString("video_id"));
			data.setVideo_pic(rs.getString("video_pic"));
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