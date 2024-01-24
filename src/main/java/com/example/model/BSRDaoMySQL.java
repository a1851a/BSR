package com.example.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import com.example.entity.BasicInformation;
import com.example.entity.Gender;
import com.example.entity.User;

public class BSRDaoMySQL implements BSRDAO{

	private Connection conn;
	
	public BSRDaoMySQL() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/bsr?serverTimezone=Asia/Taipei";
			String username = "BSR";
			String password = "a147b963c981501033";
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Boolean checkUserExistsByEmail(String email) {
		String sql = "select email from user where email = ?;";
		Boolean userIsExists = false;
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1, email);
			try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
	            	userIsExists = true;
	            }
	        }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userIsExists;
	}
	
	@Override
	public void addUserByUserIdAndEmail(String userId,String email) {
		String sql = "insert into user(userId,email) values(?,?);";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1,userId);
			pstmt.setString(2,email);
			// 提交送出
			int rowcount = pstmt.executeUpdate();
			System.out.println("rowcount(異動筆數) = " + rowcount);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public Boolean checkUserExistsByUserId(String userId) {
		String sql = "select userId from user where userId = ?;";
		Boolean userIsExists = false;
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1, userId);
			try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
	            	userIsExists = true;
	            }
	        }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return userIsExists;
	}

	@Override
	public void addUserByUserId(String userId) {
		String sql = "insert into user (userId) values(?);";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1,userId);
			// 提交送出
			int rowcount = pstmt.executeUpdate();
			System.out.println("rowcount(異動筆數) = " + rowcount);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public Optional<User> findUserByUserId(String userId) {
		String sql = "select name,gender,birth,age from user where userId= ?;";
		User user = null;
	    try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, userId);

	        try (ResultSet rs = pstmt.executeQuery()) {
				pstmt.setString(1, userId);
	            while (rs.next()) {
					user = new User();
					String name = rs.getString("name");
					if(name != null) {
						user.setName(name);
						user.setGender(rs.getString("gender"));
						user.setBirth(rs.getString("birth"));
						user.setAge(Integer.parseInt(rs.getString("age")));
					}
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return  Optional.ofNullable(user);
	}

	@Override
	public Boolean updateUserByUserId(String userId, String email, String name, String gender, String birth, Integer age) {
		String sql = "update user set name=?,gender=?,birth=?,age=? where userId=?;";
		Boolean updateUserIsSuccess= true;
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1, name);
	        pstmt.setString(2, gender);
	        pstmt.setString(3, birth);
	        pstmt.setInt(4, age);
	        pstmt.setString(5, userId);
			int rowcount = pstmt.executeUpdate();
			System.out.println("rowcount(異動筆數) = " + rowcount);
	        updateUserIsSuccess = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return updateUserIsSuccess;
	}

	@Override
	public Boolean removeUserByUserId(String userId) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void addBasicInformation(String userId,Double height,Double weight,Double BMI,String record_day) {
		String sql = "insert into basic_information(userId,height,weight,BMI,record_day) values(?,?,?,?,?);";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1,userId);
			pstmt.setDouble(2,height);
			pstmt.setDouble(3,weight);
			pstmt.setDouble(4,BMI);
			pstmt.setString(5,record_day);
			// 提交送出
			int rowcount = pstmt.executeUpdate();
			System.out.println("rowcount(異動筆數) = " + rowcount);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public void addBasicInformation(String userId,Double height,Double weight,Double BMI,Double BMR,String record_day) {
		String sql = "insert into basic_information(userId,height,weight,BMI,BMR,record_day) values(?,?,?,?,?,?);";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1,userId);
			pstmt.setDouble(2,height);
			pstmt.setDouble(3,weight);
			pstmt.setDouble(4,BMI);
			pstmt.setDouble(5,BMR);
			pstmt.setString(6,record_day);
			// 提交送出
			int rowcount = pstmt.executeUpdate();
			System.out.println("rowcount(異動筆數) = " + rowcount);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List <BasicInformation> findBasicInformationByUserId(String userId) {
		String sql = "select height,weight,BMI,BMR,record_day from basic_information where userId = ? order by basicInformationId";
		List <BasicInformation> basicInformations = new ArrayList<>();
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, userId);
	        try (ResultSet rs = pstmt.executeQuery()) {
				pstmt.setString(1, userId);
	            while (rs.next()) {
                    BasicInformation basicInformation = new BasicInformation();
                    basicInformation.setHeight(rs.getDouble("height"));
                    basicInformation.setWeight(rs.getDouble("weight"));
                    basicInformation.setBMI(rs.getDouble("BMI"));
                    basicInformation.setBMR(rs.getDouble("BMR"));
                    basicInformation.setRecordDay(rs.getString("record_day"));
                    //加到basicInformations
                    basicInformations.add(basicInformation);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		return basicInformations;
	}

	
}
