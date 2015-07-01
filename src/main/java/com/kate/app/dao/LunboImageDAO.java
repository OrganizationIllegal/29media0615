package com.kate.app.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.kate.app.model.LunboImage;
import com.kate.app.model.NewsTrends;
import com.kate.app.model.Train;
@Repository 
public class LunboImageDAO extends BaseDao{
	
	//轮播图列表
		public JSONArray selectLunboList(){
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
					jsonArray.add(obj);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return jsonArray;
		} 
		
	
	//轮播图录入
		public int InsertTrain(String  type, String img){
			int exeResult=0;
			try {
				String sql = "insert into lunbo_image(type,img) values(?,?)";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, type);
				pstmt.setString(2, img);
				exeResult = pstmt.executeUpdate();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return exeResult;
		} 	
		
		//删除轮播
		public int deleteLunbo(int id){
			int exeResult=0;
			try{
					String sql = " delete from lunbo_image where id= ?";
					PreparedStatement pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, id);
					exeResult = pstmt.executeUpdate();
				}catch (Exception e) {
		            e.printStackTrace();
		        }
			    return exeResult;
		}
        //查找轮播图
		public List<LunboImage> findAll(){
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
					list.add(data);
				}
				
			}catch (Exception e) {
		        
		    }
				return list;
			}
}
