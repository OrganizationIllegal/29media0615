package com.kate.app.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.kate.app.model.StarInfo;

@Repository 
public class StarInfoDAO extends BaseDao {
	public List<StarInfo> findAll(){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
	List<StarInfo> list = new ArrayList<StarInfo>();
	try{
		
		String sql = " select * from star_info";
        Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){					
			StarInfo data = new StarInfo();
			data.setId(rs.getInt("id"));
			data.setAchivements(rs.getString("achivements"));
			data.setAnimal(rs.getString("animal"));
			data.setBieming(rs.getString("bieming"));
			data.setBirthday(rs.getString("birthday"));
			data.setBloodtype(rs.getString("bloodtype"));
			data.setBrokerfirm(rs.getString("brokerfirm"));
			data.setChinese_name(rs.getString("chinese_name"));
			data.setConstellation(rs.getString("constellation"));
			data.setEnglish_name(rs.getString("english_name"));
			data.setGratuateunivercity(rs.getString("gratuateunivercity"));
			data.setHeight(rs.getString("height"));
			data.setId(rs.getInt("id"));
			data.setMusicalstyle(rs.getString("musicalstyle"));
			data.setNation(rs.getString("nation"));
			data.setBirthplace(rs.getString("birthplace"));
			data.setNationality(rs.getString("nationality"));
			data.setOccupation(rs.getString("occupation"));
			data.setRepresentativeworks(rs.getString("representativeworks"));
			data.setResidence(rs.getString("residence"));
			data.setSex(rs.getString("sex"));
			data.setSpecialty(rs.getString("specialty"));
			data.setStar_detail(rs.getString("star_detail"));
			data.setStar_img(rs.getString("star_img"));
			data.setStar_num(rs.getString("star_num"));
			data.setWeight(rs.getString("weight"));
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
	
	public  StarInfo findByStarNum(String starNum){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		StarInfo data = new StarInfo();
		try{
			
			String sql = " select * from star_info where star_num=?";
			  pstmt = con.prepareStatement(sql);
			pstmt.setString(1, starNum);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){					
				data.setId(rs.getInt("id"));
				data.setAchivements(rs.getString("achivements"));
				data.setAnimal(rs.getString("animal"));
				data.setBieming(rs.getString("bieming"));
				data.setBirthday(rs.getString("birthday"));
				data.setBloodtype(rs.getString("bloodtype"));
				data.setBrokerfirm(rs.getString("brokerfirm"));
				data.setChinese_name(rs.getString("chinese_name"));
				data.setConstellation(rs.getString("constellation"));
				data.setEnglish_name(rs.getString("english_name"));
				data.setGratuateunivercity(rs.getString("gratuateunivercity"));
				data.setHeight(rs.getString("height"));
				data.setId(rs.getInt("id"));
				data.setMusicalstyle(rs.getString("musicalstyle"));
				data.setNation(rs.getString("nation"));
				data.setBirthplace(rs.getString("birthplace"));
				data.setNationality(rs.getString("nationality"));
				data.setOccupation(rs.getString("occupation"));
				data.setRepresentativeworks(rs.getString("representativeworks"));
				data.setResidence(rs.getString("residence"));
				data.setSex(rs.getString("sex"));
				data.setSpecialty(rs.getString("specialty"));
				data.setStar_detail(rs.getString("star_detail"));
				data.setStar_img(rs.getString("star_img"));
				data.setStar_num(rs.getString("star_num"));
				data.setWeight(rs.getString("weight"));
				
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
	public  StarInfo findByStarId(int id){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;
		StarInfo data = new StarInfo();
		try{
			
			String sql = " select * from star_info where id=?";
			  pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){					
				data.setId(rs.getInt("id"));
				data.setAchivements(rs.getString("achivements"));
				data.setAnimal(rs.getString("animal"));
				data.setBieming(rs.getString("bieming"));
				data.setBirthday(rs.getString("birthday"));
				data.setBloodtype(rs.getString("bloodtype"));
				data.setBrokerfirm(rs.getString("brokerfirm"));
				data.setChinese_name(rs.getString("chinese_name"));
				data.setConstellation(rs.getString("constellation"));
				data.setEnglish_name(rs.getString("english_name"));
				data.setGratuateunivercity(rs.getString("gratuateunivercity"));
				data.setHeight(rs.getString("height"));
				data.setId(rs.getInt("id"));
				data.setMusicalstyle(rs.getString("musicalstyle"));
				data.setNation(rs.getString("nation"));
				data.setBirthplace(rs.getString("birthplace"));
				data.setNationality(rs.getString("nationality"));
				data.setOccupation(rs.getString("occupation"));
				data.setRepresentativeworks(rs.getString("representativeworks"));
				data.setResidence(rs.getString("residence"));
				data.setSex(rs.getString("sex"));
				data.setSpecialty(rs.getString("specialty"));
				data.setStar_detail(rs.getString("star_detail"));
				data.setStar_img(rs.getString("star_img"));
				data.setStar_num(rs.getString("star_num"));
				data.setWeight(rs.getString("weight"));
				
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