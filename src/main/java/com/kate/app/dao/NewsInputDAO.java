package com.kate.app.dao;


import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.springframework.stereotype.Repository;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.kate.app.model.NewsTrends;

@Repository 
public class NewsInputDAO extends BaseDao {
	//新闻列表
	public JSONArray selectNewsList(){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		JSONArray jsonArray=new JSONArray();
		try {
			String sql = " select * from news_trends";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				JSONObject obj = new JSONObject();
				obj.put("id", rs.getInt("id"));
				obj.put("news_id", rs.getInt("news_id"));
				obj.put("title", rs.getString("title"));
				obj.put("time", rs.getString("time"));
				obj.put("detail", rs.getString("detail"));
				obj.put("image", rs.getString("image"));
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
	
	//新闻录入
	public int InsertNewsTrends(int news_id, String  title,String time,String detail,String image){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		int exeResult=0;
		try {
			String sql = "insert into news_trends(news_id,title,time,detail,image) values(?,?,?,?,?)";
			  pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, news_id);
			pstmt.setString(2, title);
			pstmt.setString(3, time);
			pstmt.setString(4, detail);
			pstmt.setString(5, image);
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
	
	//新闻图片录入
		public int InsertNewsImage(int news_id, String  news_image){
			try{
				con = DriverManager.getConnection(url, username, password);
			}catch(Exception e){
				e.printStackTrace();
			}
			PreparedStatement pstmt = null;
			int exeResult=0;
			try {
				String sql = "insert into news_image(news_id,news_image) values(?,?)";
				  pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, news_id);
				pstmt.setString(2, news_image);
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
		
		
		//新闻图片录入
				public int InsertJoinImage(int join_id, String image){
					try{
						con = DriverManager.getConnection(url, username, password);
					}catch(Exception e){
						e.printStackTrace();
					}
					PreparedStatement pstmt = null;
					int exeResult=0;
					try {
						String sql = "insert into join_image(join_id,image) values(?,?)";
						  pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, join_id);
						pstmt.setString(2, image);
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
				
				
		
	//删除新闻
	public int deleteNewsTrends(int id){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		int exeResult=0;
		try{
				String sql = " delete from news_trends where id= ?";
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
	
	
	public int deleteNewsImage(int news_id){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		int exeResult=0;
		try{
				String sql = " delete from news_image where news_id= ?";
				  pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, news_id);
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
	
	
	//编辑新闻
	public int editNewsTrends(int id, int news_id, String  title,String time,String detail,String image){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		int exeResult=0;
		try{
			String sql = " update news_trends set news_id=?, title=?, time=?, detail=?,image=? where id=?";
			  pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, news_id);
			pstmt.setString(2, title);
			pstmt.setString(3, time);
			pstmt.setString(4, detail);
			pstmt.setString(5, image);
			pstmt.setInt(6, id);			
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
	
	//编辑新闻
		public int addJoinUs(String name, String  email,String content){
			try{
				con = DriverManager.getConnection(url, username, password);
			}catch(Exception e){
				e.printStackTrace();
			}
			PreparedStatement pstmt = null;

			int exeResult=0;
			try {
				String sql = "insert into join_us(name, email,content) values(?,?,?)";
				  pstmt = con.prepareStatement(sql);
				pstmt.setString(1, name);
				pstmt.setString(2, email);
				pstmt.setString(3, content);
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
		
		//编辑新闻
				public int selectJoinUs(String  email){
					try{
						con = DriverManager.getConnection(url, username, password);
					}catch(Exception e){
						e.printStackTrace();
					}
					PreparedStatement pstmt = null;
					int exeResult=0;
					try {
						String sql = "select id from  join_us where email=?";
						  pstmt = con.prepareStatement(sql);
						pstmt.setString(1, email);
						ResultSet rs = pstmt.executeQuery();
						while(rs.next()){
							exeResult = rs.getInt("id");
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
					return exeResult;
			        
				}
				
				
	
		
	//查找新闻
	public NewsTrends findById(int id){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		NewsTrends data = new NewsTrends();
		try{
			
			String sql = " select * from news_trends where id=?";
			  pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
			data.setId(rs.getInt("id"));
			data.setNews_id(rs.getInt("news_id"));
			data.setDetail(rs.getString("detail"));
			data.setImage(rs.getString("image"));
			data.setTime(rs.getDate("time"));
			data.setTitle(rs.getString("title"));
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
	
	//新闻图片列表
		public JSONArray selectNewsimgList(){
			try{
				con = DriverManager.getConnection(url, username, password);
			}catch(Exception e){
				e.printStackTrace();
			}
			PreparedStatement pstmt = null;
			JSONArray jsonArray=new JSONArray();
			try {
				String sql = " select * from news_image";
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
					JSONObject obj = new JSONObject();
					obj.put("id", rs.getInt("id"));
					obj.put("news_id", rs.getInt("news_id"));
					obj.put("news_image", rs.getString("news_image"));
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
	
		//删除新闻图片
		public int deleteNewsImg(int news_id){
			try{
				con = DriverManager.getConnection(url, username, password);
			}catch(Exception e){
				e.printStackTrace();
			}
			PreparedStatement pstmt = null;

			int exeResult=0;
			try{
					String sql = " delete from news_image where news_id= ?";
					  pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, news_id);
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
}
