package com.example.model;

import java.util.List;
import com.example.entity.User;

public interface BSRDAO {
	//使用者
	/**
	 *1.查詢所有使用者
	 *@return 所有使用者列表 
	 */
	List<User> findAllUsers();
	
	/**
	 *2.新增使用者
	 *@param user 
	 */
	void addUser(User user);
	
	
}
