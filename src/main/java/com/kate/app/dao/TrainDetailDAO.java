package com.kate.app.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.LockMode;
import org.hibernate.Query;
import org.hibernate.criterion.Example;

import org.springframework.stereotype.Repository;

import com.kate.app.model.News;
import com.kate.app.model.TrainDetail;


@Repository 
public class TrainDetailDAO extends BaseDao {
	public List<TrainDetail> findByTrainId(int trainId){
	List<TrainDetail> list = new ArrayList<TrainDetail>();
	try{
		
		String sql = " select * from train_detail where train_id=?";
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, trainId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){					
			TrainDetail data = new TrainDetail();
			data.setId(rs.getInt("id"));
			data.setDetail(rs.getString("detail"));
			data.setTitle(rs.getString("title"));
			data.setTime(rs.getDate("time"));
			data.setTrain_img(rs.getString("train_img"));
			
			list.add(data);
		}
		
	}catch (Exception e) {
        
    }
		return list;
	}
}