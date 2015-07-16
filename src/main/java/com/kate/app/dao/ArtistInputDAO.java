package com.kate.app.dao;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.kate.app.model.LianXi;
import com.kate.app.model.StarInfo;
import com.kate.app.model.StarVedio;

@Repository 
public class ArtistInputDAO extends BaseDao {
	//艺人列表
	public JSONArray selectArtistList(){
		JSONArray jsonArray=new JSONArray();
		try {
			String sql = " select * from star_info";
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()){
				JSONObject obj = new JSONObject();
				obj.put("id", rs.getInt("id"));
				obj.put("star_num", rs.getString("star_num"));
				obj.put("chinese_name", rs.getString("chinese_name"));
				obj.put("english_name", rs.getString("english_name"));
				obj.put("bieming", rs.getString("bieming"));
				obj.put("sex", rs.getString("sex"));
				obj.put("star_img", rs.getString("star_img"));
				jsonArray.add(obj);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return jsonArray;
	} 
	
	
	
	//艺人列表
		public JSONArray selectVedioList(){
			JSONArray jsonArray=new JSONArray();
			try {
				String sql = " select * from vedio";
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(sql);
				while(rs.next()){
					JSONObject obj = new JSONObject();
					obj.put("id", rs.getInt("id"));
					obj.put("video_id", rs.getString("video_id"));
					obj.put("video_pic", rs.getString("video_pic"));
					obj.put("video_link", rs.getString("video_link"));
					obj.put("video_desc", rs.getString("video_desc"));
					
					jsonArray.add(obj);
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return jsonArray;
		} 
		
		
	//艺人录入
		public int InsertArtistInfo(String star_num, String  chinese_name,String english_name,String bieming,String nation, String  constellation,String bloodtype,String height,String weight, String  birthplace,String birthday,String occupation,String brokerfirm,String animal, String  representativeworks,String residence,String gratuateunivercity,String achivements,String nationality, String  sex,String specialty,String musicalstyle,String star_detail,String star_img){
			int exeResult=0;
			try {
				String sql = "insert into star_info(star_num,chinese_name,english_name,bieming,nation,constellation,bloodtype,height,weight,birthplace,birthday,occupation,brokerfirm,animal,representativeworks,residence,gratuateunivercity,achivements,nationality,sex,specialty,musicalstyle,star_detail,star_img) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				PreparedStatement pstmt = con.prepareStatement(sql);
				pstmt.setString(1, star_num);
				pstmt.setString(2, chinese_name);
				pstmt.setString(3, english_name);
				pstmt.setString(4, bieming);
				pstmt.setString(5, nation);
				pstmt.setString(6, constellation);
				pstmt.setString(7, bloodtype);
				pstmt.setString(8, height);
				pstmt.setString(9, weight);
				pstmt.setString(10, birthplace);
				pstmt.setString(11, birthday);
				pstmt.setString(12, occupation);
				pstmt.setString(13, brokerfirm);
				pstmt.setString(14, animal);
				pstmt.setString(15, representativeworks);
				pstmt.setString(16, residence);
				pstmt.setString(17, gratuateunivercity);
				pstmt.setString(18, achivements);
				pstmt.setString(19, nationality);
				pstmt.setString(20, sex);
				pstmt.setString(21, specialty);
				pstmt.setString(22, musicalstyle);
				pstmt.setString(23, star_detail);
				pstmt.setString(24, star_img);
				exeResult = pstmt.executeUpdate();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return exeResult;
		} 
		
		//艺人图片录入
				public int InsertArtistImage(String star_num, String  img){
					int exeResult=0;
					try {
						String sql = "insert into star_image(star_num,img) values(?,?)";
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setString(1, star_num);
						pstmt.setString(2, img);
						exeResult = pstmt.executeUpdate();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return exeResult;
				} 
				//艺人影视录入
				public int InsertArtistVideo(String star_num, String  video_id, String video_pic, String  video_link){
					int exeResult=0;
					try {
						String sql = "insert into star_vedio(star_num,video_id,video_pic,video_link) values(?,?,?,?)";
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setString(1, star_num);
						pstmt.setString(2, video_id);
						pstmt.setString(3, video_pic);
						pstmt.setString(4, video_link);
						exeResult = pstmt.executeUpdate();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return exeResult;
				} 	
				
				public int InsertVideo(String  video_id, String video_pic, String  video_link, String video_desc){
					int exeResult=0;
					try {
						String sql = "insert into vedio(video_id,video_pic,video_link,video_desc) values(?,?,?,?)";
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setString(1, video_id);
						pstmt.setString(2, video_pic);
						pstmt.setString(3, video_link);
						pstmt.setString(4, video_desc);
						exeResult = pstmt.executeUpdate();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return exeResult;
				} 		


				//删除艺人
				public int deleteArtist(int id){
					int exeResult=0;
					try{
							String sql = " delete from star_info where id= ?";
							PreparedStatement pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, id);
							exeResult = pstmt.executeUpdate();
						}catch (Exception e) {
				            e.printStackTrace();
				        }
					    return exeResult;
				}
				
				//删除艺人
				public int deleteVedio(int id){
					int exeResult=0;
					try{
							String sql = " delete from vedio where id= ?";
							PreparedStatement pstmt = con.prepareStatement(sql);
							pstmt.setInt(1, id);
							exeResult = pstmt.executeUpdate();
						}catch (Exception e) {
				            e.printStackTrace();
				        }
					    return exeResult;
				}
				
				
				
				//删除艺人图片
				public int deleteArtistImg(String star_num){
					int exeResult=0;
					try{
							String sql = " delete from star_image where star_num= ?";
							PreparedStatement pstmt = con.prepareStatement(sql);
							pstmt.setString(1, star_num);
							exeResult = pstmt.executeUpdate();
						}catch (Exception e) {
				            e.printStackTrace();
				        }
					    return exeResult;
				}
				
				//删除艺人影视
				public int deleteArtistVideo(String star_num){
					int exeResult=0;
					try{
							String sql = " delete from star_vedio where star_num= ?";
							PreparedStatement pstmt = con.prepareStatement(sql);
							pstmt.setString(1, star_num);
							exeResult = pstmt.executeUpdate();
						}catch (Exception e) {
				            e.printStackTrace();
				        }
					    return exeResult;
				}
				
				
				//删除艺人影视
				public int deleteVideo(){
					int exeResult=0;
					try{
							String sql = " delete from vedio";
							PreparedStatement pstmt = con.prepareStatement(sql);
							
							exeResult = pstmt.executeUpdate();
						}catch (Exception e) {
				            e.printStackTrace();
				        }
					    return exeResult;
				}
				
				
				//艺人编辑
				public int EditArtistInfo(int id, String star_num, String  chinese_name,String english_name,String bieming,String nation, String  constellation,String bloodtype,String height,String weight, String  birthplace,String birthday,String occupation,String brokerfirm,String animal, String  representativeworks,String residence,String gratuateunivercity,String achivements,String nationality, String  sex,String specialty,String musicalstyle,String star_detail,String star_img){
					int exeResult=0;
					try {
						String sql = "update star_info set star_num=?,chinese_name=?,english_name=?,bieming=?,nation=?,constellation=?,bloodtype=?,height=?,weight=?,birthplace=?,birthday=?,occupation=?,brokerfirm=?,animal=?,representativeworks=?,residence=?,gratuateunivercity=?,achivements=?,nationality=?,sex=?,specialty=?,musicalstyle=?,star_detail=?,star_img=? where id=?";
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setString(1, star_num);
						pstmt.setString(2, chinese_name);
						pstmt.setString(3, english_name);
						pstmt.setString(4, bieming);
						pstmt.setString(5, nation);
						pstmt.setString(6, constellation);
						pstmt.setString(7, bloodtype);
						pstmt.setString(8, height);
						pstmt.setString(9, weight);
						pstmt.setString(10, birthplace);
						pstmt.setString(11, birthday);
						pstmt.setString(12, occupation);
						pstmt.setString(13, brokerfirm);
						pstmt.setString(14, animal);
						pstmt.setString(15, representativeworks);
						pstmt.setString(16, residence);
						pstmt.setString(17, gratuateunivercity);
						pstmt.setString(18, achivements);
						pstmt.setString(19, nationality);
						pstmt.setString(20, sex);
						pstmt.setString(21, specialty);
						pstmt.setString(22, musicalstyle);
						pstmt.setString(23, star_detail);
						pstmt.setString(24, star_img);
						pstmt.setInt(25, id);
						exeResult = pstmt.executeUpdate();
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					return exeResult;
				} 
				
				//查找艺人
				public StarInfo findById(int id){
					StarInfo data = new StarInfo();
					try{
						
						String sql = " select * from star_info where id=?";
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setInt(1, id);
						ResultSet rs = pstmt.executeQuery();
						while(rs.next()){
						data.setId(rs.getInt("id"));
						data.setStar_num(rs.getString("star_num"));
						data.setChinese_name(rs.getString("chinese_name"));
						data.setEnglish_name(rs.getString("english_name"));
						data.setBieming(rs.getString("bieming"));
						data.setNation(rs.getString("nation"));
						data.setConstellation(rs.getString("constellation"));
						data.setBloodtype(rs.getString("bloodtype"));
						data.setHeight(rs.getString("height"));
						data.setWeight(rs.getString("weight"));
						data.setBirthplace(rs.getString("birthplace"));
						data.setBirthday(rs.getString("birthday"));
						data.setOccupation(rs.getString("occupation"));
						data.setBrokerfirm(rs.getString("brokerfirm"));
						data.setAnimal(rs.getString("animal"));
						data.setRepresentativeworks(rs.getString("representativeworks"));
						data.setResidence(rs.getString("residence"));
						data.setGratuateunivercity(rs.getString("gratuateunivercity"));
						data.setAchivements(rs.getString("achivements"));
						data.setNationality(rs.getString("nationality"));
						data.setSex(rs.getString("sex"));
						data.setSpecialty(rs.getString("specialty"));
						data.setMusicalstyle(rs.getString("musicalstyle"));
						data.setStar_detail(rs.getString("star_detail"));
						}
					}catch (Exception e) {
				        
				    }
						return data;
					}

				//查找艺人影视
				public List<StarVedio> findByStarNum(String starnum){
					List<StarVedio> list = new ArrayList<StarVedio>();
					try{
						
						String sql = " select * from star_vedio where star_num=?";
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setString(1,starnum);
						ResultSet rs = pstmt.executeQuery();
						
						while(rs.next()){					
							StarVedio data = new StarVedio();
							data.setId(rs.getInt("id"));
							data.setVideo_link(rs.getString("video_id"));
							data.setVideo_link(rs.getString("video_link"));
							data.setVideo_pic(rs.getString("video_pic"));							
							list.add(data);
						}
						
					}catch (Exception e) {
				        
				    }
						return list;
					}
				
				
				
				//查找艺人影视
				public List<StarVedio> findVedio(){
					List<StarVedio> list = new ArrayList<StarVedio>();
					try{
						
						String sql = " select * from vedio";
						PreparedStatement pstmt = con.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();
						
						while(rs.next()){					
							StarVedio data = new StarVedio();
							data.setId(rs.getInt("id"));
							data.setVideo_link(rs.getString("video_id"));
							data.setVideo_link(rs.getString("video_link"));
							data.setVideo_pic(rs.getString("video_pic"));							
							list.add(data);
						}
						
					}catch (Exception e) {
				        
				    }
						return list;
					}
				
				
				
				//编辑艺人影视
				public int editStarVideo(int id, String star_num, String  video_id, String video_pic, String  video_link){
					int exeResult=0;
					try{
						String sql = " update star_vedio set star_num=?, video_id=?, video_pic=?,video_link=?  where id=?";
						PreparedStatement pstmt = con.prepareStatement(sql);
						pstmt.setString(1, star_num);
						pstmt.setString(2, video_id);
						pstmt.setString(3, video_pic);
						pstmt.setString(4, video_link);
						pstmt.setInt(5, id);			
						exeResult = pstmt.executeUpdate();
					}catch (Exception e) {
			            e.printStackTrace();
			        }
					return exeResult;
			        
				}
				
}
