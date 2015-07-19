package com.kate.app.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.kate.app.model.LunboImage;
@Repository 
public class LunboImageDAO extends BaseDao{
	
	//杞挱鍥惧垪琛�
		public JSONArray selectLunboList(){
			try{
				con = DriverManager.getConnection(url, username, password);
			}catch(Exception e){
				e.printStackTrace();
			}
			PreparedStatement pstmt = null;
			JSONArray jsonArray=new JSONArray();
			try {
				String sql = " select * from lunbo_image";
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
					JSONObject obj = new JSONObject();
					obj.put("id", rs.getInt("id"));
					obj.put("type", rs.getString("type"));
					obj.put("img", rs.getString("img"));
					String href = rs.getString("href");
					if(href.equals("") || href==null){
						obj.put("href", "");
					}
					else{
						obj.put("href", rs.getString("href"));
					}
					jsonArray.add(obj);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
			return jsonArray;
		} 
		
	
	//杞挱鍥惧綍鍏�
		public int InsertTrain(String  type, String img, String href1){
			try{
				con = DriverManager.getConnection(url, username, password);
			}catch(Exception e){
				e.printStackTrace();
			}
			PreparedStatement pstmt = null;
			int exeResult=0;
			try {
				String sql = "insert into lunbo_image(type,img,href) values(?,?,?)";
				  pstmt = con.prepareStatement(sql);
				pstmt.setString(1, type);
				pstmt.setString(2, img);
				pstmt.setString(3, href1);
				exeResult = pstmt.executeUpdate();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
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
			return exeResult;
		} 	
		
		//鍒犻櫎杞挱
		public int deleteLunbo(int id){
			try{
				con = DriverManager.getConnection(url, username, password);
			}catch(Exception e){
				e.printStackTrace();
			}
			PreparedStatement pstmt = null;
			int exeResult=0;
			try{
					String sql = " delete from lunbo_image where id= ?";
					  pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, id);
					exeResult = pstmt.executeUpdate();
				}catch (Exception e) {
		            e.printStackTrace();
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
			    return exeResult;
		}
        //鏌ユ壘杞挱鍥�
		public List<LunboImage> findAll(){
			try{
				con = DriverManager.getConnection(url, username, password);
			}catch(Exception e){
				e.printStackTrace();
			}
			PreparedStatement pstmt = null;
			List<LunboImage> list = new ArrayList<LunboImage>();
			try{
				
				String sql = " select * from lunbo_image";
		        Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){					
					LunboImage data = new LunboImage();
					data.setId(rs.getInt("id"));
					data.setImg(rs.getString("img"));
					data.setType(rs.getString("type"));
					data.setHref(rs.getString("href"));
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
