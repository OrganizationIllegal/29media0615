package com.kate.app.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.kate.app.dao.ArtistInputDAO;
import com.kate.app.dao.ImageDao;
import com.kate.app.model.NewsImage;
import com.kate.app.model.NewsTrends;
import com.kate.app.model.StarImage;
import com.kate.app.model.StarInfo;
import com.kate.app.model.StarVedio;
import com.kate.app.model.TrainDetail;
import com.kate.app.service.ConvertJson;

@Controller
public class ArtistInputController {
	@Autowired
	private ArtistInputDAO artistInputDao;
	
	//艺人列表
	@RequestMapping({ "/ArtistList" })    
	public void selectAreaList(HttpServletRequest req, HttpServletResponse resp){
		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();
		array = artistInputDao.selectArtistList();
		int count = array.size();
		json.put("total", count);
		json.put("rows", array);
		
		try{
			writeJson(json.toJSONString(),resp);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//艺人录入
		@RequestMapping({ "/inputArtist" })
		public void inputArtist(HttpServletRequest req, HttpServletResponse resp) throws Exception{
			String artistinfo=req.getParameter("artistinfo");
			StarInfo starinfo = (StarInfo) JSONToObj(artistinfo, StarInfo.class);
			String star_num=starinfo.getStar_num();
			String chinese_name=starinfo.getChinese_name();
			String english_name=starinfo.getEnglish_name();
			String bieming=starinfo.getBieming();
			String nation=starinfo.getNation();
			String constellation=starinfo.getConstellation();
			String bloodtype=starinfo.getBloodtype();
			String height=starinfo.getHeight();
			String weight=starinfo.getWeight();
			String birthplace=starinfo.getBirthplace();
			String birthday=starinfo.getBirthday();
			String occupation=starinfo.getOccupation();
			String brokerfirm=starinfo.getBrokerfirm();
			String animal=starinfo.getAnimal();
			String representativeworks=starinfo.getRepresentativeworks();
			String residence=starinfo.getResidence();
			String gratuateunivercity=starinfo.getGratuateunivercity();
			String achivements=starinfo.getAchivements();
			String nationality=starinfo.getNationality();
			String sex=starinfo.getSex();
			String specialty=starinfo.getSpecialty();
			String musicalstyle=starinfo.getMusicalstyle();
			String star_detail=starinfo.getStar_detail();
			
			String artistimglist=req.getParameter("artistimglist");
			JSONArray artistimgArray = JSONArray.parseArray(artistimglist);
			List<StarImage> imagelist=new ArrayList<StarImage>();
			JSONObject obj = (JSONObject)artistimgArray.get(0);
			StarImage starimg=(StarImage) JSONToObj(obj.toString(), StarImage.class);
			String image="/images/artist/"+starimg.getImg();
			int flag2=0;
			for (int i=0;i<artistimgArray.size();i++){
				 JSONObject object = (JSONObject)artistimgArray.get(i); //对于每个json对象
				 StarImage e = (StarImage) JSONToObj(object.toString(), StarImage.class);
				 imagelist.add(e);
				 String img=e.getImg();
				 flag2=artistInputDao.InsertArtistImage(star_num, img);		 
			}
			//System.out.println("imagelist.length():"+imagelist.size());
			System.out.println(flag2);
			
			String videoimglist=req.getParameter("videoimglist");
			JSONArray videoimgArray = JSONArray.parseArray(videoimglist);
			List<StarVedio> videolist=new ArrayList<StarVedio>();
			int flag3=0;
			for (int i=0;i<videoimgArray.size();i++){
				 JSONObject object = (JSONObject)videoimgArray.get(i); //对于每个json对象
				 StarVedio e = (StarVedio) JSONToObj(object.toString(), StarVedio.class);
				 videolist.add(e);
				 String video_id=e.getVideo_id();
				 String video_link=e.getVideo_link();
				 String video_pic=e.getVideo_link();
				 flag3=artistInputDao.InsertArtistVideo(star_num, video_id, video_pic, video_link);		 
			}
			System.out.println(flag3);
			
			int flag1 = 0;
			JSONObject json = new JSONObject();
			flag1 =artistInputDao.InsertArtistInfo(star_num, chinese_name, english_name, bieming, nation, constellation, bloodtype, height, weight, birthplace, birthday, occupation, brokerfirm, animal, representativeworks, residence, gratuateunivercity, achivements, nationality, sex, specialty, musicalstyle, star_detail,image);
			System.out.println(flag1);
			json.put("flag", flag1+flag2+flag3);
			try{
				writeJson(json.toJSONString(),resp);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		//删除艺人
		@RequestMapping({ "/deleteArtist" })
		public void deleteNewsTrends(HttpServletRequest req, HttpServletResponse resp) throws Exception{
			int id = Integer.parseInt(req.getParameter("id"));
			String star_num=req.getParameter("star_num");
			int flag =0;
			flag+=artistInputDao.deleteArtist(id);
			flag+=artistInputDao.deleteArtistImg(star_num);
			flag+=artistInputDao.deleteArtistVideo(star_num);
			JSONObject json = new JSONObject();
			json.put("flag", flag);
			try{
				writeJson(json.toJSONString(),resp);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		//艺人查找
		@RequestMapping({ "/findArtist" })
		public String findArtist(HttpServletRequest req,HttpServletResponse resp){
			int id = Integer.parseInt(req.getParameter("id"));
			StarInfo starinfo = artistInputDao.findById(id);
			List<StarVedio> videoList = new ArrayList<StarVedio>();
			videoList=artistInputDao.findByStarNum(starinfo.getStar_num());
			req.setAttribute("starinfo", starinfo);
			req.setAttribute("videoList", videoList);
			req.setAttribute("videoListJson", ConvertJson.list2json(videoList));
			return "/artistEdit.jsp";
		}
		
		//艺人编辑
				@RequestMapping({ "/editArtist" })
				public void editArtist(HttpServletRequest req, HttpServletResponse resp) throws Exception{
					String artistinfo=req.getParameter("artistinfo");
					//System.out.println(artistinfo);
					StarInfo starinfo = (StarInfo) JSONToObj(artistinfo, StarInfo.class);
					int id=starinfo.getId();
					String star_num=starinfo.getStar_num();
					String chinese_name=starinfo.getChinese_name();
					String english_name=starinfo.getEnglish_name();
					String bieming=starinfo.getBieming();
					String nation=starinfo.getNation();
					String constellation=starinfo.getConstellation();
					String bloodtype=starinfo.getBloodtype();
					String height=starinfo.getHeight();
					String weight=starinfo.getWeight();
					String birthplace=starinfo.getBirthplace();
					String birthday=starinfo.getBirthday();
					String occupation=starinfo.getOccupation();
					String brokerfirm=starinfo.getBrokerfirm();
					String animal=starinfo.getAnimal();
					String representativeworks=starinfo.getRepresentativeworks();
					String residence=starinfo.getResidence();
					String gratuateunivercity=starinfo.getGratuateunivercity();
					String achivements=starinfo.getAchivements();
					String nationality=starinfo.getNationality();
					String sex=starinfo.getSex();
					String specialty=starinfo.getSpecialty();
					String musicalstyle=starinfo.getMusicalstyle();
					String star_detail=req.getParameter("detail");
							
					String artistimglist=req.getParameter("artistimglist");
					JSONArray artistimgArray = JSONArray.parseArray(artistimglist);
					List<StarImage> imagelist=new ArrayList<StarImage>();
					JSONObject obj = (JSONObject)artistimgArray.get(0);
					StarImage starimg=(StarImage) JSONToObj(obj.toString(), StarImage.class);
					String image="/images/artist/"+starimg.getImg();
					int flag2=0;
					for (int i=0;i<artistimgArray.size();i++){
						 JSONObject object = (JSONObject)artistimgArray.get(i); //对于每个json对象
						 StarImage e = (StarImage) JSONToObj(object.toString(), StarImage.class);
						 imagelist.add(e);
						 String img=e.getImg();
						 flag2=artistInputDao.InsertArtistImage(star_num, img);		 
					}
					//System.out.println("imagelist.length():"+imagelist.size());
					System.out.println(flag2);
					
					String videoimglist=req.getParameter("videoimglist");
					JSONArray videoimgArray = JSONArray.parseArray(videoimglist);
					List<StarVedio> videolist=new ArrayList<StarVedio>();
					int flag3=0;
					for (int i=0;i<videoimgArray.size();i++){
						 JSONObject object = (JSONObject)videoimgArray.get(i); //对于每个json对象
						 StarVedio e = (StarVedio) JSONToObj(object.toString(), StarVedio.class);
						 videolist.add(e);
						 int id3=0;
						 String video_id=e.getVideo_id();
						 String video_link=e.getVideo_link();
						 String video_pic=e.getVideo_link();
						 if(e.getId()==0){
								flag3=artistInputDao.InsertArtistVideo(star_num, video_id, video_pic, video_link);
								System.out.println("add"+flag3);
							}else{
								id3=e.getId();
								flag3=artistInputDao.editStarVideo(id3, star_num, video_id, video_pic, video_link);
								System.out.println("edit"+flag3);
							}		 
					}
					
					
					int flag1 = 0;
					JSONObject json = new JSONObject();
					flag1 =artistInputDao.EditArtistInfo(id, star_num, chinese_name, english_name, bieming, nation, constellation, bloodtype, height, weight, birthplace, birthday, occupation, brokerfirm, animal, representativeworks, residence, gratuateunivercity, achivements, nationality, sex, specialty, musicalstyle, star_detail,image);
					System.out.println(flag1);
					json.put("flag", flag1+flag2+flag3);
					try{
						writeJson(json.toJSONString(),resp);
					}catch(Exception e){
						e.printStackTrace();
					}
					
				}
					
	public void writeJson(String json, HttpServletResponse response)throws Exception{
	    response.setContentType("text/html");
	    response.setCharacterEncoding("UTF-8");
	    PrintWriter out = response.getWriter();
	    if(StringUtils.isNotEmpty(json)){
	        out.println(json);
	    }
	    out.flush();
	    out.close();
	}
	
	 public static<T> Object JSONToObj(String jsonStr,Class<T> obj) {
	        T t = null;
	        try {
	            ObjectMapper objectMapper = new ObjectMapper();
	            t = objectMapper.readValue(jsonStr,
	                    obj);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        return t;
	    }
	
}
