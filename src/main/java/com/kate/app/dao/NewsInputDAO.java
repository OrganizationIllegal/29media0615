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
	public int InsertNewsTrends(int news_id, String  title,String time,String detail,String image){
		int exeResult=0;
		try {
			String sql = "insert into news_trends(news_id,title,time,detail,image) values(?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, news_id);
			pstmt.setString(2, title);
			pstmt.setString(3, time);
			pstmt.setString(4, detail);
			pstmt.setString(5, image);
			exeResult = pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return exeResult;
	} 
	
	//新闻图片录入
		public int InsertNewsImage(int news_id, String  news_image){
			int exeResult=0;
			try {
				String sql = "insert into news_image(news_id,news_image) values(?,?)";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, news_id);
				pstmt.setString(2, news_image);
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
	public int editNewsTrends(int id, int news_id, String  title,String time,String detail,String image){
		int exeResult=0;
		try{
			String sql = " update news_trends set news_id=?, title=?, time=?, detail=?,image=? where id=?";
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, news_id);
			pstmt.setString(2, title);
			pstmt.setString(3, time);
			pstmt.setString(4, detail);
			pstmt.setString(5, image);
			pstmt.setInt(6, id);			
			exeResult = pstmt.executeUpdate();
		}catch (Exception e) {
            e.printStackTrace();
        }
		return exeResult;
        
	}
	//查找新闻
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
	
	//新闻图片列表
		public JSONArray selectNewsimgList(){
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
			}
			return jsonArray;
		} 
	
		//删除新闻图片
		public int deleteNewsImg(int news_id){
			int exeResult=0;
			try{
					String sql = " delete from news_image where news_id= ?";
					PreparedStatement pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, news_id);
					exeResult = pstmt.executeUpdate();
				}catch (Exception e) {
		            e.printStackTrace();
		        }
			    return exeResult;
		}		
}
