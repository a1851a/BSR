package com.example.model;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CopyOnWriteArrayList;

import com.example.entity.Gender;
import com.example.entity.User;
import com.example.exception.AccountException;

public class AccountDAOInMemory implements AccountDAO {
	// In-Memory 模擬資料庫
	private static List<User> users;

	// 類別成員初始區段
	static {
		users = new ArrayList<User>();
		// 預設 2 筆資料
		users.add(new User("test1@gmail.com", "123", "test1", Gender.Man, "1999-1-1"));
		//users.add(new User("test2@gmail.com", "456", "test2", Gender.NotAavailable, "1999-12-1"));
	}

	@Override
	public List<User> readInformationByUserId() throws AccountException {
		users.stream()
			.filter(u->u.equals(u.getUserId()))
			.forEach(u->System.out.print(u));
		return users;
	}

	@Override
	public List<User> updateInformationByUserId() throws AccountException {
		users.stream()
		.filter(u->u.equals(u.getUserId()))
		.forEach(u->System.out.print(u));
		return null;
	}

	@Override
	public void deleteUserByUserId(User user) throws AccountException {
		// TODO Auto-generated method stub
		
	}

}
