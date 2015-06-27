package com.kate.app.dao;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;




import org.springframework.stereotype.Repository;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Repository 
public class TrainInputDAO extends BaseDao {
	//培训列表
	public JSONArray selectTrainList(){
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
		}
		return jsonArray;
	} 
	
	//培训录入
	public int InsertTrain(int train_id, String  train_name, String train_desc){
		int exeResult=0;
		try {
			String sql = "insert into train(train_id,train_name,train_desc) values(?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, train_id);
			pstmt.setString(2, train_name);
			pstmt.setString(3, train_desc);
			exeResult = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return exeResult;
	} 	
	
	//培训详情录入
		public int InsertTrainDetail(int train_id, String  title, String time,String detail, String train_img){
			int exeResult=0;
			try {
				String sql = "insert into train_detail(train_id,title,time,detail,train_img) values(?,?,?,?,?)";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, train_id);
				pstmt.setString(2, title);
				pstmt.setString(3, time);
				pstmt.setString(4, detail);
				pstmt.setString(5, train_img);
				exeResult = pstmt.executeUpdate();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return exeResult;
		} 	
		
		//艺能培训录入
				public int InsertLianxi(int train_id, String  typename, String detail,String img){
					int exeResult=0;
					try {
						String sql = "insert into lianxi(train_id,typename,detail,img) values(?,?,?,?)";
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, train_id);
						pstmt.setString(2, typename);
						pstmt.setString(3, detail);
						pstmt.setString(4, img);
						exeResult = pstmt.executeUpdate();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return exeResult;
				} 
				//删除培训
				public int deleteTrain(int id){
					int exeResult=0;
					try{
							String sql = " delete from train where id= ?";
							PreparedStatement pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, id);
							exeResult = pstmt.executeUpdate();
						}catch (Exception e) {
				            e.printStackTrace();
				        }
					    return exeResult;
				}
}
