package com.kate.app.dao;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import org.springframework.stereotype.Repository;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.kate.app.model.NewsTrends;

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
	
	//新闻录入
	public int InsertNewsTrends(int news_id, String  title,String time,String detail){
		int exeResult=0;
		try {
			String sql = "insert into news_trends(news_id,title,time,detail) values(?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, news_id);
			pstmt.setString(2, title);
			pstmt.setString(3, time);
			pstmt.setString(4, detail);
			exeResult = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return exeResult;
	} 
	
	//删除新闻
	public int deleteNewsTrends(int id){
		int exeResult=0;
		try{
				String sql = " delete from news_trends where id= ?";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, id);
				exeResult = pstmt.executeUpdate();
			}catch (Exception e) {
	            e.printStackTrace();
	        }
		    return exeResult;
	}
	//编辑新闻
	public int editNewsTrends(int id, int news_id, String  title,String time,String detail){
		int exeResult=0;
		try{
			String sql = " update news_trends set news_id=?, title=?, time=?, detail=? where id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, news_id);
			pstmt.setString(2, title);
			pstmt.setString(3, time);
			pstmt.setString(4, detail);
			pstmt.setInt(5, id);			
			exeResult = pstmt.executeUpdate();
		}catch (Exception e) {
            e.printStackTrace();
        }
		return exeResult;
        
	}
	
	public NewsTrends findById(int id){
		NewsTrends data = new NewsTrends();
		try{
			
			String sql = " select * from news_trends where id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
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
	        
	    }
			return data;
		}
	
	
				
}