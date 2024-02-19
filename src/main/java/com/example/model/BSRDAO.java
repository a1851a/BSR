package com.example.model;

import java.util.Date;
import java.util.List;
import java.util.Optional;

import com.example.entity.BP;
import com.example.entity.BasicInformation;
import com.example.entity.Blood;
import com.example.entity.Electrolyte;
import com.example.entity.HealthInformation;
import com.example.entity.Hyperlipidemia;
import com.example.entity.RenalFunction;
import com.example.entity.Sediment;
import com.example.entity.Urine;
import com.example.entity.User;

public interface BSRDAO {
	//使用者
	/**
	 *1.根據email查詢使用者(註冊)
	 **/
	Boolean checkUserExistsByEmail(String email);
	
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
	 **/
	Boolean updateUserByUserId(String userId, String email, String name, String gender, String birth, Integer age); 
	
	/**
	 *7.根據使用者Id刪除所有資料(包含帳戶)
	 **/
	Boolean removeUserByUserId(String userId);
	
	//基礎資訊
	/**
	 *1.新增基礎資訊資訊(有輸入基本資料)
	 **/
	void addBasicInformation(String userId,Double height,Double weight,Double BMI,Double BMR,String record_day);
	
	/**
	 *2.新增基礎資訊資訊(無輸入基本資料:無BMR)
	 **/
	void addBasicInformation(String userId,Double height,Double weight,Double BMI,String record_day);
	
	/**
	 *3.根據使用者Id查詢所有基礎資訊紀錄 
	 *@param userId
	 **/
	List <BasicInformation> findBasicInformationByUserId(String userId);
	
	//血壓
	/**
	 *1.新增血壓相關資訊 
	 **/
	void addBP(String userId, Integer SBP, Integer DBP, Integer pulse,String record_day);
	
	/**
	 *2. 根據使用者Id查詢所有血壓紀錄
	 **/
	List <BP> findBPByUserId(String userId);
	
	//血糖
	
	//血脂肪
	/**
	 *1.新增血壓相關資訊(有完整輸入) 
	 **/
	void addHyperlipidemia(String userId, Integer TG, Integer TC, Integer HDL, Integer LDL, Integer vldl,Double angiosclerosis,Double stroke, String record_day);
	
	/**
	 *2.新增血壓相關資訊(無完整輸入) 
	 **/
	void addHyperlipidemia(String userId, Integer TG, Integer TC, Integer HDL, Integer LDL,Double angiosclerosis,Double stroke, String record_day);
	
	/**
	 *3. 根據使用者Id查詢所有血脂肪紀錄
	 **/
	List <Hyperlipidemia> findHyperlipidemiaByUserId(String userId);
	
	
	//腎臟功能
	/**
	 *1.新增腎臟功能相關資訊(有完整輸入) 
	 **/
	void addRenalFunction(String userId, Double BUN, Double Cr, Double UA,Double mAlb, String record_day);
	
	/**
	 *2. 根據使用者Id查詢所有血脂肪紀錄
	 **/
	List <RenalFunction> findRenalFunctionByUserId(String userId);
	
	//肝臟
	
	//電解質
	/**
	 *1.新增電解質相關資訊(有完整輸入) 
	 **/
	void addElectrolyte(String userId, Integer na, Integer k, Integer cl, Double Ca, Double P, String record_day);
	
	/**
	 *2.新增電解質相關資訊(無完整輸入:缺na) 
	 **/
	void addElectrolyteWithOutNa(String userId, Integer k, Integer cl, Double Ca, Double P, String record_day);
	
	/**
	 *.新增電解質相關資訊(無完整輸入) 
	 **/
	void addElectrolyteWithOutNaAndKAndCl(String userId, Double Ca, Double P, String record_day);
	
	
	//血液
	/**
	 *1.新增血液相關資訊(有完整輸入) 
	 **/
	void addBlood(String userId, Integer WBC, Double RBC, Double Hgb, Double Hct,Double MCV, Double MCH, Double MCHC, Integer PLT, String record_day);
	
	/**
	 *2. 根據使用者Id查詢所有血液紀錄
	 **/
	List <Blood> findBloodByUserId(String userId);
	
	//尿液
	/**
	 *1.新增尿液相關資訊(有完整輸入) 
	 **/
	void addUrine(String userId, String appearance, Double PH, String leukocytes, String glucose, String protein, String bilirubin, String urobilirubin, String ketones,
			String occult_blood, Double specific_gravity, String nitrite, String record_day);
	
	/**
	 *2.新增尿液相關資訊(無完整輸入) 
	 **/
	void addUrine(String userId, String appearance, Double PH, String leukocytes, String glucose,String protein, String bilirubin, String ketones,
			String occult_blood, Double specific_gravity, String nitrite, String record_day);
	
	/**
	 *3. 根據使用者Id查詢所有尿液紀錄
	 **/
	List <Urine> findUrineByUserId(String userId);
	
	//尿液沉渣
	/**
	 *1.新增尿液沉渣相關資訊(有完整輸入) 
	 **/
	void addSediment(String userId, Integer RBC, Integer WBC, Integer epithelium, String crystal,String cast, String bacteria, String other, String record_day);
	
	/**
	 *2. 根據使用者Id查詢所有尿液沉渣紀錄
	 **/
	List <Sediment> findSedimentByUserId(String userId);
	
	//新增結果
	/**
	 *1.新增輸入結果 
	 **/
	void addOutcomeByUserId(String userId, String Disease,String record_day);
	
	/**
	 *2.判斷是否有結果 
	 **/
	Boolean checkIsOutcome(String userId);
	
	//健康資訊
	/**
	 *1.新增健康資訊 
	 **/
	void addHealthInformation(String category, String title, String web_url);
	
	/**
	 *2.根據標題名稱判斷是否存在
	 **/
	Boolean findHealthInformationByWebTitle(String title); 

	/**
	 *3.推送健康資訊
	 **/
	List <HealthInformation> readAllHealthInformations();
	
	/**
	 *4.根據使用者狀況推送相關健康資訊
	 **/
	List <HealthInformation> findUserStatusToPushRelevantHealthInformations(String userId);
	
}
