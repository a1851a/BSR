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
	 *2.根據使用者Id,email新增使用者(註冊)
	 *@param userId , email
	 **/
	void addUserByUserIdAndEmail(String userId,String email);
	
	/**
	 *3.根據使用者Id查找使用者
	 *@param userId
	 *@return 使用者是否存在(true: 存在 , false: 不存在) 
	 **/
	Boolean checkUserExistsByUserId(String userId); 
	
	/**
	 *4.根據使用者Id新增使用者(註冊)
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
	 *6.根據使用者Id新增使用者資訊
	 *@param userId
	 *@return  
	 **/
	Boolean updateUserByUserId(String userId, String email, String name, String gender, String birth, Integer age); 
	
	/**
	 *7.根據使用者Id刪除所有資料(包含帳戶)
	 **/
	Boolean removeUserByUserId(String userId);
	
	//基礎資訊
	/**
	 *1.新增基礎資訊資料(無輸入基本資料)
	 **/
	void addBasicInformation(String userId,Double height,Double weight,Double BMI,String record_day);
	
	/**
	 *2.新增基礎資訊資料(有輸入基本資料)
	 **/
	void addBasicInformation(String userId,Double height,Double weight,Double BMI,Double BMR,String record_day);
	
	/**
	 *3.根據使用者Id查詢所有基礎資料 
	 *@param userId
	 **/
	List <BasicInformation> findBasicInformationByUserId(String userId);
	
	/**
	 *4.根據使用者Id查詢所有身高 
	 *@param userId
	 **/
	//List <BasicInformation> findAllHeightByUserId(String userId);
	
	
}
