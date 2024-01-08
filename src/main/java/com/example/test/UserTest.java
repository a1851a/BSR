package com.example.test;

import java.lang.reflect.Array;
import java.util.Iterator;

import com.example.entity.Gender;
import com.example.entity.User;
import com.example.model.*;

public class UserTest {

	public static void main(String[] args) {

		//預設兩筆資料測試
		User[] user = new User[3];
		user[0] = new User("test1@gmail.com", "123", "test1", Gender.Man, "1999-01-01");
		user[1] = new User("test2@gmail.com", "456", "test2", Gender.NotAavailable, "2001-10-10");
		user[2] = new User("test3@gmail.com", "789", "test3", Gender.Woman, "1887-02-28");

		
		for (User u:user) {
			System.out.println(u);
		}
		
	}
}
