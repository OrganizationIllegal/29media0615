package com.kate.app.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.kate.app.model.Train;

@Repository 
public class TrainDAO extends BaseDao{
	public List<Train> findAll(){
		List<Train> list = new ArrayList<Train>();
		try{
			
			String sql = " select * from Train";
	        Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()){					
				Train data = new Train();
				data.setId(rs.getInt("id"));
				data.setTrain_desc(rs.getString("train_desc"));
				data.setTrain_id(rs.getInt("train_id"));
				data.setTrain_image(rs.getString("train_image"));
				data.setTrain_name(rs.getString("train_name"));
				list.add(data);
			}
			
		}catch (Exception e) {
            
        }
		
		return list;
        
	}
}
