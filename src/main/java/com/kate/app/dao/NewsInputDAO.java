package com.kate.app.dao;


import java.sql.ResultSet;
import java.sql.Statement;


import org.springframework.stereotype.Repository;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

@Repository 
public class NewsInputDAO extends BaseDao {
	//新闻列表
	public JSONArray selectNewsList(){
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
