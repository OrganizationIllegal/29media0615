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
import com.kate.app.dao.TrainDetailDAO;
import com.kate.app.dao.TrainInputDAO;
import com.kate.app.model.LianXi;
import com.kate.app.model.NewsImage;
import com.kate.app.model.Train;
import com.kate.app.model.TrainDetail;
import com.kate.app.service.ConvertJson;

@Controller
public class TrainInputController {
	@Autowired
	private TrainInputDAO trainInputDao;
	@Autowired
	private TrainDetailDAO trainDetailDAO;
	
	//鍩硅鍒楄〃
	@RequestMapping({ "/TrainList" })    
	public void TrainList(HttpServletRequest req, HttpServletResponse resp){
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
	
	//鏌ユ壘鍩硅
		@RequestMapping({ "/findTrain" })
		public String findTrain(HttpServletRequest req,HttpServletResponse resp){
			int id = Integer.parseInt(req.getParameter("id"));
			List<TrainDetail> detailList = new ArrayList<TrainDetail>();
			List<LianXi> lianxiList = new ArrayList<LianXi>();
			Train train = trainInputDao.findById(id);
			detailList=trainDetailDAO.findByTrainId(train.getTrain_id());
			lianxiList=trainInputDao.findByTrainId(train.getTrain_id());
			req.setAttribute("train", train);
			req.setAttribute("detailList", detailList);
			req.setAttribute("detailListJson", ConvertJson.list2json(detailList));
			req.setAttribute("lianxiList", lianxiList);
			req.setAttribute("lianxiListJson", ConvertJson.list2json(lianxiList));
			return "/trainEdit.jsp";
		}
		
	
	//鍩硅褰曞叆
		@RequestMapping({ "/inputTrain" })
		public void inputTrain(HttpServletRequest req, HttpServletResponse resp) throws Exception{
			String traininfo=req.getParameter("traininfo");		
			Train train = (Train) JSONToObj(traininfo, Train.class);
			int train_id=train.getTrain_id();
			String train_name=train.getTrain_name();
			String train_desc=train.getTrain_desc();
			train_desc = filter(train_desc);	
			String trainimglist=req.getParameter("trainimglist");
			JSONArray trainimgArray = JSONArray.parseArray(trainimglist);
			List<TrainDetail> imagelist=new ArrayList<TrainDetail>();
			JSONObject obj = (JSONObject)trainimgArray.get(0);
			TrainDetail trainimg=(TrainDetail) JSONToObj(obj.toString(), TrainDetail.class);
			String image=trainimg.getTrain_img();
			int flag2=0;
			for (int i=0;i<trainimgArray.size();i++){
				 JSONObject object = (JSONObject)trainimgArray.get(i); //瀵逛簬姣忎釜json瀵硅薄
				 TrainDetail e = (TrainDetail) JSONToObj(object.toString(), TrainDetail.class);
				 imagelist.add(e);
				 String title=e.getTitle();
				 String time;
				 String detail1=e.getDetail();
				 detail1 = filter(detail1);
				 String train_img=e.getTrain_img();
				 if(e.getTime()==null||"".equals(e.getTime())){
						time = "2015-05-09";
					}else{
						Date date=e.getTime();
						DateFormat df= DateFormat.getDateInstance();//鏃ユ湡鏍煎紡锛岀簿纭埌鏃�
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
				 JSONObject object = (JSONObject)yinengArray.get(i); //瀵逛簬姣忎釜json瀵硅薄
				 LianXi e = (LianXi) JSONToObj(object.toString(), LianXi.class);
				 lianxilist.add(e);
				 String typename=e.getTypename();
				 String detail2=e.getDetail();
				 detail2 = filter(detail2);
				 String img=e.getImg();
				 flag3=trainInputDao.InsertLianxi(train_id, typename, detail2, img);	 
			}
			System.out.println(flag3);
					
			int flag1 = 0;
			JSONObject json = new JSONObject();
			flag1 =trainInputDao.InsertTrain(train_id, train_name, train_desc, image);
			System.out.println(flag1);
			json.put("flag", flag1+flag2+flag3);
			try{
				writeJson(json.toJSONString(),resp);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		//鍒犻櫎鍩硅
		@RequestMapping({ "/deleteTrain" })
		public void deleteNewsTrends(HttpServletRequest req, HttpServletResponse resp) throws Exception{
			int id = Integer.parseInt(req.getParameter("id"));
			int train_id = Integer.parseInt(req.getParameter("train_id"));
			int flag =0;
			flag+=trainInputDao.deleteTrain(id);
			flag+=trainInputDao.deleteTrainDetail(train_id);
			flag+=trainInputDao.deleteLianXi(train_id);
			JSONObject json = new JSONObject();
			json.put("flag", flag);
			try{
				writeJson(json.toJSONString(),resp);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		
		//缂栬緫鍩硅
				@RequestMapping({ "/editTrain" })
				public void editTrain(HttpServletRequest req, HttpServletResponse resp) throws Exception{
					String traininfo=req.getParameter("traininfo");		
					Train train = (Train) JSONToObj(traininfo, Train.class);
					int id=train.getId();
					int train_id=train.getTrain_id();
					String train_name=train.getTrain_name();
					String train_desc=train.getTrain_desc();
					
					train_desc = filter(train_desc);
					int result = 0;
					result+=trainInputDao.deleteTrainDetail(train_id);
					result+=trainInputDao.deleteLianXi(train_id);
					TrainDetail trainimg = null;
					String image = null;
					String trainimglist=req.getParameter("trainimglist");
					JSONArray trainimgArray = JSONArray.parseArray(trainimglist);
					if(trainimgArray.size() > 0){
						JSONObject obj = (JSONObject)trainimgArray.get(0);
						trainimg=(TrainDetail) JSONToObj(obj.toString(), TrainDetail.class);
						if(trainimg!=null && !"".equals(trainimg)){
							image=trainimg.getTrain_img();
						}
						
					}
					List<TrainDetail> imagelist=new ArrayList<TrainDetail>();
					
					
					int flag2=0;
					for (int i=0;i<trainimgArray.size();i++){
						 JSONObject object = (JSONObject)trainimgArray.get(i); //瀵逛簬姣忎釜json瀵硅薄
						 TrainDetail e = (TrainDetail) JSONToObj(object.toString(), TrainDetail.class);
						 imagelist.add(e);
						 int id2=0;
						 String title=e.getTitle();
						 String time;
						 String detail2=e.getDetail();
						 detail2 = filter(detail2);
						 String train_img=e.getTrain_img();
						 if(e.getTime()==null||"".equals(e.getTime())){
								time = "2015-05-09";
							}else{
								Date date=e.getTime();
								DateFormat df= DateFormat.getDateInstance();//鏃ユ湡鏍煎紡锛岀簿纭埌鏃�
								time=df.format(date);			
							}
						/* if(e.getId()==0){*/
								flag2=trainInputDao.InsertTrainDetail(train_id, title, time, detail2, train_img);
								System.out.println("add"+flag2);
							/*}else{
								id2=e.getId();
								flag2=trainInputDao.editTrainDetail(id2, train_id, title, time, detail2, train_img);
								System.out.println("edit"+flag2);
							}	*/ 
					}
					//System.out.println("imagelist.length():"+imagelist.size());
					
					String yinenglist=req.getParameter("yinenglist");
					JSONArray yinengArray = JSONArray.parseArray(yinenglist);
					List<LianXi> lianxilist=new ArrayList<LianXi>();
					int flag3=0;
					for (int i=0;i<yinengArray.size();i++){
						 JSONObject object = (JSONObject)yinengArray.get(i); //瀵逛簬姣忎釜json瀵硅薄
						 LianXi e = (LianXi) JSONToObj(object.toString(), LianXi.class);
						 lianxilist.add(e);
						 int id3=0;
						 String typename=e.getTypename();
						 String detail3=e.getDetail();
						 detail3 = filter(detail3);
						 String img=e.getImg();
						 /*if(e.getId()==0){*/
								flag3=trainInputDao.InsertLianxi(train_id, typename, detail3, img);
								System.out.println("add"+flag3);
							/*}else{
								id3=e.getId();
								flag3=trainInputDao.editLianxi(id3, train_id, typename, detail3, img);
								System.out.println("edit"+flag3);
							}*/
					}
					
					int flag1 = 0;
					JSONObject json = new JSONObject();
					flag1 =trainInputDao.editTrain(id, train_id, train_name, train_desc, image);
					System.out.println(flag1);
					json.put("flag", flag1);
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
	public String filter(String text){
		String theString = text.replace(">", "&gt;");  
        theString = theString.replace("<", "&lt;");  
        theString = theString.replace(" ", "&nbsp;");  
        theString = theString.replace("\"", "&quot;");  
        theString = theString.replace("\'", "&#39;"); 
        theString = theString.replace("“", "&quot;"); 
        theString = theString.replace("”", "&quot;"); 
        theString = theString.replace("\\", "\\\\");      //对斜线的转义  
        theString = theString.replace("\n", "\\n");  
        theString = theString.replace("\r", "\\r"); 
        //theString = theString.replace(":", "\:"); 
        return theString;
	}
	
}
