package com.kate.app.dao;


import java.sql.Connection;
import java.sql.DriverManager;




public class BaseDao {
	
	protected static String url = null;
	protected static String username = null;
	protected static String password = null;
	protected  Connection con = null;
	
	public BaseDao()
	{
		if(con == null){
			try {
				url = "jdbc:mysql://101.200.234.113:3306/media?autoReconnect=true";
	            username = "root";
	            password = "29media";
	            con = DriverManager.getConnection(url, username, password);
	        } catch (Exception e) {
	           System.out.print("DriverManager.getConnection faild");
	           System.out.println(e.toString());
	        }
		}else{
			
		}
		
	}
	/*static {
		try{   
		    //锟斤拷锟斤拷MySql锟斤拷锟斤拷锟斤拷   
		    Class.forName("com.mysql.jdbc.Driver") ;   
		}
		catch(ClassNotFoundException e){   
		    System.out.println("锟揭诧拷锟斤拷锟斤拷锟斤拷锟斤拷锟�锟斤拷锟斤拷锟斤拷锟斤拷失锟杰ｏ拷");   
		    e.printStackTrace() ;   
		}   
		try {
			url = "jdbc:mysql://101.200.234.113:3306/media?autoReconnect=true";
            username = "root";
            password = "29media";
            con = DriverManager.getConnection(url, username, password);
        } catch (Exception e) {
           System.out.print("DriverManager.getConnection faild");
           System.out.println(e.toString());
        }
		
	}*/
	
	
}
