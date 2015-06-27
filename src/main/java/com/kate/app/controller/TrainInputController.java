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
import com.kate.app.dao.ImageDao;
import com.kate.app.dao.TrainInputDAO;
import com.kate.app.model.LianXi;
import com.kate.app.model.StarVedio;
import com.kate.app.model.Train;
import com.kate.app.model.TrainDetail;

@Controller
public class TrainInputController {
	@Autowired
	private TrainInputDAO trainInputDao;
	
	//新闻动态列表
	@RequestMapping({ "/TrainList" })    
	public void selectAreaList(HttpServletRequest req, HttpServletResponse resp){
		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();
		array = trainInputDao.selectTrainList();
		int count = array.size();
		json.put("total", count);
		json.put("rows", array);
		
		try{
			writeJson(json.toJSONString(),resp);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	//新闻录入
		@RequestMapping({ "/inputTrain" })
		public void inputTrain(HttpServletRequest req, HttpServletResponse resp) throws Exception{
			String traininfo=req.getParameter("traininfo");		
			Train train = (Train) JSONToObj(traininfo, Train.class);
			int train_id=train.getTrain_id();
			String train_name=train.getTrain_name();
			String train_desc=train.getTrain_desc();
					
			String trainimglist=req.getParameter("trainimglist");
			JSONArray trainimgArray = JSONArray.parseArray(trainimglist);
			List<TrainDetail> imagelist=new ArrayList<TrainDetail>();
			int flag2=0;
			for (int i=0;i<trainimgArray.size();i++){
				 JSONObject object = (JSONObject)trainimgArray.get(i); //对于每个json对象
				 TrainDetail e = (TrainDetail) JSONToObj(object.toString(), TrainDetail.class);
				 imagelist.add(e);
				 String title=e.getTitle();
				 String time;
				 String detail1=e.getDetail();
				 String train_img=e.getTrain_img();
				 if(e.getTime()==null||"".equals(e.getTime())){
						time = "2015-05-09";
					}else{
						Date date=e.getTime();
						DateFormat df= DateFormat.getDateInstance();//日期格式，精确到日
						time=df.format(date);			
					}
				 flag2=trainInputDao.InsertTrainDetail(train_id, title, time, detail1, train_img);		 
			}
			//System.out.println("imagelist.length():"+imagelist.size());
			System.out.println(flag2);
			
			String yinenglist=req.getParameter("yinenglist");
			JSONArray yinengArray = JSONArray.parseArray(yinenglist);
			List<LianXi> lianxilist=new ArrayList<LianXi>();
			int flag3=0;
			for (int i=0;i<yinengArray.size();i++){
				 JSONObject object = (JSONObject)yinengArray.get(i); //对于每个json对象
				 LianXi e = (LianXi) JSONToObj(object.toString(), LianXi.class);
				 lianxilist.add(e);
				 String typename=e.getTypename();
				 String detail2=e.getDetail();
				 String img=e.getImg();
				 flag3=trainInputDao.InsertLianxi(train_id, typename, detail2, img);	 
			}
			System.out.println(flag3);
					
			int flag1 = 0;
			JSONObject json = new JSONObject();
			flag1 =trainInputDao.InsertTrain(train_id, train_name, train_desc);
			System.out.println(flag1);
			json.put("flag", flag1+flag2+flag3);
			try{
				writeJson(json.toJSONString(),resp);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		//删除培训
		@RequestMapping({ "/deleteTrain" })
		public void deleteNewsTrends(HttpServletRequest req, HttpServletResponse resp) throws Exception{
			int id = Integer.parseInt(req.getParameter("id"));
			int flag =trainInputDao.deleteTrain(id);
			JSONObject json = new JSONObject();
			json.put("data", flag);
			try{
				writeJson(json.toJSONString(),resp);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		@RequestMapping(value = "/trainimgInput")
	    public void handleFormUpload( @RequestParam("file") MultipartFile file, HttpServletResponse resp) {
			JSONObject json = new JSONObject();		
	        if (!file.isEmpty()) {
	        	try{	        		
	        			ImageDao.CopyImage(file,new String(file.getOriginalFilename().getBytes("ISO8859_1"),"utf-8"));
	        	}
	        	catch(Exception e){
	        		e.printStackTrace();
	        	}
	        	try{
	    			writeJson(json.toJSONString(),resp);
	    		}catch(Exception e){
	    			e.printStackTrace();
	    		}
	        }
	    }
		@RequestMapping(value = "/yinengInput")
	    public void handleFormUpload2( @RequestParam("file") MultipartFile file, HttpServletResponse resp) {
			JSONObject json = new JSONObject();		
	        if (!file.isEmpty()) {
	        	try{	        		
	        			ImageDao.CopyImage(file,new String(file.getOriginalFilename().getBytes("ISO8859_1"),"utf-8"));
	        	}
	        	catch(Exception e){
	        		e.printStackTrace();
	        	}
	        	try{
	    			writeJson(json.toJSONString(),resp);
	    		}catch(Exception e){
	    			e.printStackTrace();
	    		}
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
