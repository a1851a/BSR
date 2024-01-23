package com.example.model;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import com.example.entity.BasicInformation;
import com.example.entity.Gender;
import com.example.entity.User;

public interface BSRDAO {
	//使用者
	
	/**
	 *1.根據email查詢使用者(註冊)
	 **/
	Boolean checkUserExistsByEmail(String mail);
	
	/**
	 *2.根據userId,email新增使用者(註冊)
	 *@param userId , email
	 **/
	void addUserByUserIdAndEmail(String userId,String email);
	
	/**
	 *3.根據userId查找使用者
	 *@param userId
	 *@return 使用者是否存在(true: 存在 , false: 不存在) 
	 **/
	Boolean checkUserExistsByUserId(String userId); 
	
	/**
	 *4.根據userId新增使用者(註冊)
	 *@param userId , email
	 **/
	void addUserByUserId(String userId);
	
	/**
	 *5.根據使用者Id查找使用者
	 *@param userId
	 *@return 使用者
	 **/
	Optional <User> findUserByUserId(String userId); 
	
	/**
	 *6.根據userId新增使用者資訊
	 *@param userId
	 *@return  
	 **/
	Boolean updateUserByUserId(String userId, String email, String name, String gender, String birth, Integer age); 
	
	
}
