package com.example.model;

import java.util.List;

import com.example.entity.User;
import com.example.exception.AccountException;

/**
 * 定義帳號頁面功能
 * 查詢
 * 修改
 * 刪除
 * */
public interface AccountDAO {
	List<User> readInformationByUserId() throws AccountException;
	List<User> updateInformationByUserId() throws AccountException;
	void deleteUserByUserId(User user) throws AccountException;
}
