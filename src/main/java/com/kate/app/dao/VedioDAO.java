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
public class VedioDAO extends BaseDao {
	//鏍规嵁star_num浠巗tar_video涓壘鍒颁俊鎭�
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
	
	//鏍规嵁star_num浠巗tar_video涓壘鍒颁俊鎭�
		public List<StarVedio> findVedio(){
			try{
				con = DriverManager.getConnection(url, username, password);
			}catch(Exception e){
				e.printStackTrace();
			}
			PreparedStatement pstmt = null;

			List<StarVedio> list = new ArrayList<StarVedio>();
			try{
				
				String sql = " select * from vedio ";
		        Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){					
					StarVedio starVedio=new StarVedio();
					starVedio.setId(rs.getInt("id"));
					
					starVedio.setVideo_pic(rs.getString("video_pic"));
					starVedio.setVideo_id(rs.getString("video_id"));
					starVedio.setVideo_link(rs.getString("video_link"));
					starVedio.setVideo_desc(rs.getString("video_desc"));
					starVedio.setType(rs.getString("type"));
					
					list.add(starVedio);
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

		public StarVedio findVedioById(int id){
			try{
				con = DriverManager.getConnection(url, username, password);
			}catch(Exception e){
				e.printStackTrace();
			}
			PreparedStatement pstmt = null;
			StarVedio data = new StarVedio();
			
			try{
				
				String sql = " select * from vedio where id=?";
				  pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, id);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
					data.setId(rs.getInt("id"));
					data.setVideo_link(rs.getString("video_id"));
					data.setVideo_link(rs.getString("video_link"));
					data.setVideo_pic(rs.getString("video_pic"));
					data.setVideo_desc(rs.getString("video_desc"));
					data.setType(rs.getString("type"));
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
				return data;
			}
		
		public List<String> findType(){
			try{
				con = DriverManager.getConnection(url, username, password);
			}catch(Exception e){
				e.printStackTrace();
			}
			PreparedStatement pstmt = null;

			List<String> list = new ArrayList<String>();
			try{
				
				String sql = " select distinct type from vedio";
				  pstmt = con.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
					String data = rs.getString("type");
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