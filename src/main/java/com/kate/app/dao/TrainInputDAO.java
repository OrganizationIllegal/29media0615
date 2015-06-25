package com.kate.app.dao;


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
	//添加经纪人服务区域
	/*public int InsertServiceArea(String  broker_num,String area_code,int view_shunxu){
		int exeResult=0;
		try {
			String sql = "insert into broker_service_area(broker_num,area_code,view_shunxu) values(?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, broker_num);
			pstmt.setString(2, area_code);
			pstmt.setInt(3, view_shunxu);
			exeResult = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return exeResult;
	}  */
				
}
