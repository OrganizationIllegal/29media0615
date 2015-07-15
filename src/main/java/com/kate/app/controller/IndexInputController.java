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

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.kate.app.dao.LunboImageDAO;
import com.kate.app.model.JoinUs;
import com.kate.app.model.LianXi;
import com.kate.app.model.LunboImage;
import com.kate.app.model.TrainDetail;

@Controller
public class IndexInputController {
	@Autowired
	private LunboImageDAO lunboImageDAO;
	
	//鏉烆喗鎸遍崶鎯у灙鐞涳拷
		@RequestMapping({ "/LunboList" })    
		public void LunboList(HttpServletRequest req, HttpServletResponse resp){
			JSONObject json = new JSONObject();
			JSONArray array = new JSONArray();
			array = lunboImageDAO.selectLunboList();
			int count = array.size();
			json.put("total", count);
			json.put("rows", array);
			
			try{
				writeJson(json.toJSONString(),resp);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		//閸掔娀娅庢潪顔芥尡
				@RequestMapping({ "/deleteLunbo" })
				public void deleteLunbo(HttpServletRequest req, HttpServletResponse resp) throws Exception{
					int id = Integer.parseInt(req.getParameter("id"));
					int flag =lunboImageDAO.deleteLunbo(id);
					JSONObject json = new JSONObject();
					json.put("flag", flag);
					try{
						writeJson(json.toJSONString(),resp);
					}catch(Exception e){
						e.printStackTrace();
					}
				}
	
	//鏉烆喗鎸遍崶鎯х秿閸忥拷
			@RequestMapping({ "/inputLunbo" })
			public void inputLunbo(HttpServletRequest req, HttpServletResponse resp) throws Exception{
				String indeximglist=req.getParameter("indeximglist");
				
				
				/*JoinUs joinUs = (JoinUs) JSONToObj(newsinfo,JoinUs.class);
				String name = joinUs.getUsername();
				String email  = joinUs.getEmail();
				String content = joinUs.getContent();
				int join_id = 0;
				flag1 =newsInputDao.addJoinUs(name, email, content);*/
				
				
				JSONArray indeximgArray = JSONArray.parseArray(indeximglist);
				List<LunboImage> imagelist=new ArrayList<LunboImage>();
				int flag=0;
				JSONObject json = new JSONObject();
				for (int i=0;i<indeximgArray.size();i++){
					 JSONObject object = (JSONObject)indeximgArray.get(i); //鐎甸�绨В蹇庨嚋json鐎电钖�
					 LunboImage e = (LunboImage) JSONToObj(object.toString(), LunboImage.class);
					 imagelist.add(e);
					 String type=e.getType();
					 String img=e.getImg();
					 String href=e.getHref();
					 
					 flag=lunboImageDAO.InsertTrain(type, img, href);
					 System.out.println(flag);
				     json.put("flag", flag);
				}
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
