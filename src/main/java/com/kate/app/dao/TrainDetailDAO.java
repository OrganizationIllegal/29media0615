package com.kate.app.dao;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.kate.app.model.TrainDetail;


@Repository 
public class TrainDetailDAO extends BaseDao {
	public List<TrainDetail> findByTrainId(int trainId){
		try{
			con = DriverManager.getConnection(url, username, password);
		}catch(Exception e){
			e.printStackTrace();
		}
		PreparedStatement pstmt = null;

	List<TrainDetail> list = new ArrayList<TrainDetail>();
	try{
		
		String sql = " select * from train_detail where train_id=?";
		  pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, trainId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){					
			TrainDetail data = new TrainDetail();
			data.setId(rs.getInt("id"));
			data.setDetail(rs.getString("detail"));
			data.setTitle(rs.getString("title"));
			data.setTime(rs.getDate("time"));
			data.setTrain_id(rs.getInt("train_id"));
			data.setTrain_img(rs.getString("train_img"));
			
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
	
}