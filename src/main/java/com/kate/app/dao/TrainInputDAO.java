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
import com.kate.app.model.LianXi;
import com.kate.app.model.Train;

@Repository 
public class TrainInputDAO extends BaseDao {
	//培训列表
	public JSONArray selectTrainList(){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		JSONArray jsonArray=new JSONArray();
		try {
			String sql = " select * from train";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				JSONObject obj = new JSONObject();
				obj.put("id", rs.getInt("id"));
				obj.put("train_id", rs.getInt("train_id"));
				obj.put("train_name", rs.getString("train_name"));
				obj.put("train_desc", rs.getString("train_desc"));
				obj.put("train_image", rs.getString("train_image"));
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
	
	//培训录入
	public int InsertTrain(int train_id, String  train_name, String train_desc,String train_image){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		int exeResult=0;
		try {
			String sql = "insert into train(train_id,train_name,train_desc,train_image) values(?,?,?,?)";
			  pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, train_id);
			pstmt.setString(2, train_name);
			pstmt.setString(3, train_desc);
			pstmt.setString(4, train_image);
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
	
	//培训详情录入
		public int InsertTrainDetail(int train_id, String  title, String time,String detail, String train_img){
			try{
				con = DriverManager.getConnection(url, username, password);
			}catch(Exception e){
				e.printStackTrace();
			}
			PreparedStatement pstmt = null;
			int exeResult=0;
			try {
				String sql = "insert into train_detail(train_id,title,time,detail,train_img) values(?,?,?,?,?)";
				  pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, train_id);
				pstmt.setString(2, title);
				pstmt.setString(3, time);
				pstmt.setString(4, detail);
				pstmt.setString(5, train_img);
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
		
		//艺能培训录入
				public int InsertLianxi(int train_id, String  typename, String detail,String img){
					try{
						con = DriverManager.getConnection(url, username, password);
					}catch(Exception e){
						e.printStackTrace();
					}
					PreparedStatement pstmt = null;
					int exeResult=0;
					try {
						String sql = "insert into lianxi(train_id,typename,detail,img) values(?,?,?,?)";
						  pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, train_id);
						pstmt.setString(2, typename);
						pstmt.setString(3, detail);
						pstmt.setString(4, img);
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
				//删除培训
				public int deleteTrain(int id){
					try{
						con = DriverManager.getConnection(url, username, password);
					}catch(Exception e){
						e.printStackTrace();
					}
					PreparedStatement pstmt = null;

					int exeResult=0;
					try{
							String sql = " delete from train where id= ?";
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
				
				//删除培训详情
				public int deleteTrainDetail(int train_id){
					try{
						con = DriverManager.getConnection(url, username, password);
					}catch(Exception e){
						e.printStackTrace();
					}
					PreparedStatement pstmt = null;
					int exeResult=0;
					try{
							String sql = " delete from train_detail where train_id= ?";
							  pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, train_id);
							exeResult = pstmt.executeUpdate();
						}catch (Exception e) {
				            e.printStackTrace();
				        }
					    return exeResult;
				}
				
				//删除培训详情
				public int deleteLianXi(int train_id){
					try{
						con = DriverManager.getConnection(url, username, password);
					}catch(Exception e){
						e.printStackTrace();
					}
					PreparedStatement pstmt = null;
					int exeResult=0;
					try{
							String sql = " delete from lianxi where train_id= ?";
							  pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, train_id);
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
								
				//编辑培训
				public int editTrain(int id, int train_id, String  train_name, String train_desc,String train_image){
					try{
						con = DriverManager.getConnection(url, username, password);
					}catch(Exception e){
						e.printStackTrace();
					}
					PreparedStatement pstmt = null;

					int exeResult=0;
					try{
						String sql = " update train set train_id=?, train_name=?, train_desc=?,train_image=?  where id=?";
						  pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, train_id);
						pstmt.setString(2, train_name);
						pstmt.setString(3, train_desc);
						pstmt.setString(4, train_image);
						pstmt.setInt(5, id);			
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
				
				//编辑培训详情
				public int editTrainDetail(int id, int train_id, String  title, String time,String detail, String train_img){
					try{
						con = DriverManager.getConnection(url, username, password);
					}catch(Exception e){
						e.printStackTrace();
					}
					PreparedStatement pstmt = null;
					int exeResult=0;
					try{
						String sql = " update train_detail set train_id=?, title=?, time=?,detail=?,train_img=?  where id=?";
						  pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, train_id);
						pstmt.setString(2, title);
						pstmt.setString(3, time);
						pstmt.setString(4, detail);
						pstmt.setString(5, train_img);
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
				
				//编辑艺能培训
				public int editLianxi(int id, int train_id, String  typename, String detail,String img){
					try{
						con = DriverManager.getConnection(url, username, password);
					}catch(Exception e){
						e.printStackTrace();
					}
					PreparedStatement pstmt = null;
					int exeResult=0;
					try{
						String sql = " update lianxi set train_id=?, typename=?, detail=?,img=?  where id=?";
						  pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, train_id);
						pstmt.setString(2, typename);
						pstmt.setString(3, detail);
						pstmt.setString(4, img);
						pstmt.setInt(5, id);			
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
				
				//查找培训
				public Train findById(int id){
					try{
						con = DriverManager.getConnection(url, username, password);
					}catch(Exception e){
						e.printStackTrace();
					}
					PreparedStatement pstmt = null;
					Train data = new Train();
					try{
						
						String sql = " select * from train where id=?";
						  pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, id);
						ResultSet rs = pstmt.executeQuery();
						while(rs.next()){
						data.setId(rs.getInt("id"));
						data.setTrain_id(rs.getInt("train_id"));
						data.setTrain_name(rs.getString("train_name"));
						data.setTrain_desc(rs.getString("train_desc"));
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
				
				//查找艺能培训
				public List<LianXi> findByTrainId(int trainId){
					try{
						con = DriverManager.getConnection(url, username, password);
					}catch(Exception e){
						e.printStackTrace();
					}
					PreparedStatement pstmt = null;
					List<LianXi> list = new ArrayList<LianXi>();
					try{
						
						String sql = " select * from lianxi where train_id=?";
						  pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, trainId);
						ResultSet rs = pstmt.executeQuery();
						
						while(rs.next()){					
							LianXi data = new LianXi();
							data.setId(rs.getInt("id"));
							data.setTypename(rs.getString("typename"));
							data.setDetail(rs.getString("detail"));
							data.setImg(rs.getString("img"));							
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
