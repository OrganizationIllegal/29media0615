package com.kate.app.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.kate.app.model.LianXi;
import com.kate.app.model.Train;

@Repository 
public class TrainDAO extends BaseDao{
	public List<Train> findAll(){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;

		List<Train> list = new ArrayList<Train>();
		try{
			
			String sql = " select * from Train order by id desc";
	        Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){					
				Train data = new Train();
				data.setId(rs.getInt("id"));
				data.setTrain_desc(rs.getString("train_desc"));
				data.setTrain_id(rs.getInt("train_id"));
				data.setTrain_image(rs.getString("train_image"));
				data.setTrain_name(rs.getString("train_name"));
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
	
	
	public List<LianXi> findAllLianXi(){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		List<LianXi> list = new ArrayList<LianXi>();
		try{
			
			String sql = " select * from lianxi";
	        Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){					
				LianXi data = new LianXi();
				data.setId(rs.getInt("id"));
				data.setDetail(rs.getString("detail"));
				data.setImg(rs.getString("img"));
				data.setTrain_id(rs.getInt("train_id"));
				data.setTypename(rs.getString("typename"));
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
	public List<LianXi> findAllLianXiByTrainId(int train_id){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;

		List<LianXi> list = new ArrayList<LianXi>();
		try{
			
			String sql = " select * from lianxi where train_id="+train_id;
	        Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){					
				LianXi data = new LianXi();
				data.setId(rs.getInt("id"));
				data.setDetail(rs.getString("detail"));
				data.setImg(rs.getString("img"));
				data.setTrain_id(rs.getInt("train_id"));
				data.setTypename(rs.getString("typename"));
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
	public List<LianXi> findAllLianXiById(int id){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		List<LianXi> list = new ArrayList<LianXi>();
		try{
			
			String sql = " select * from lianxi where id="+id;
	        Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){					
				LianXi data = new LianXi();
				data.setId(rs.getInt("id"));
				data.setDetail(rs.getString("detail"));
				data.setImg(rs.getString("img"));
				data.setTrain_id(rs.getInt("train_id"));
				data.setTypename(rs.getString("typename"));
				list.add(data);
			}
			
		}catch (Exception e) {
            
        }
		finally{  
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
	
	public LianXi findLianXiById(int train_id){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		LianXi data = new LianXi();
		try{
			
			String sql = " select * from lianxi where train_id=?";
			  pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, train_id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){					
				data.setId(rs.getInt("id"));
				data.setDetail(rs.getString("detail"));
				data.setImg(rs.getString("img"));
				data.setTrain_id(rs.getInt("train_id"));
				data.setTypename(rs.getString("typename"));
			}
			
		}catch (Exception e) {
            
        }
		finally{  
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
	public LianXi findnewsById(int id){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		LianXi data = new LianXi();
		try{
			
			String sql = " select * from lianxi where id=?";
			  pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){					
				data.setId(rs.getInt("id"));
				data.setDetail(rs.getString("detail"));
				data.setImg(rs.getString("img"));
				data.setTrain_id(rs.getInt("train_id"));
				data.setTypename(rs.getString("typename"));
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
	
}
