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

	//帳戶管理
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
		Boolean updateUserIsSuccess= false;
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
	
	//基本資訊
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
	public List <BasicInformation> findBasicInformationByUserId(String userId) {
		String sql = "select height,weight,BMI,BMR,record_day from basic_information where userId = ? order by basicInformationId";
		List <BasicInformation> basicInformations = new ArrayList<>();
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, userId);
	        try (ResultSet rs = pstmt.executeQuery()) {
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

	//血壓
	@Override
	public void addBP(String userId, Integer SBP, Integer DBP, Integer pulse,String record_day) {
		String sql = "insert into bp(userId,SBP,DBP,pulse,record_day) values(?,?,?,?,?);";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1,userId);
			pstmt.setInt(2,SBP);
			pstmt.setInt(3,DBP);
			pstmt.setInt(4,pulse);
			pstmt.setString(5,record_day);
			// 提交送出
			int rowcount = pstmt.executeUpdate();
			System.out.println("rowcount(異動筆數) = " + rowcount);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<BP> findBPByUserId(String userId) {
		String sql = "select SBP,DBP,pulse,record_day from bp where userId = ? order by BPId";
		List <BP> BPInformations = new ArrayList<>();
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, userId);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
                    BP BPInformation = new BP();
                    BPInformation.setSBP(rs.getInt("SBP"));
                    BPInformation.setDBP(rs.getInt("DBP"));
                    BPInformation.setPulse(rs.getInt("pulse"));
                    BPInformation.setRecordDay(rs.getString("record_day"));
                    //加到BPInformations
                    BPInformations.add(BPInformation);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		return BPInformations;
	}

	//血糖

	//血脂肪
	@Override
	public void addHyperlipidemia(String userId, Integer TG, Integer TC, Integer HDL, Integer LDL, Integer vldl,Double angiosclerosis,Double stroke, String record_day) {
		String sql = "insert into hyperlipidemia(userId,TG,TC,HDL,LDL,vldl,angiosclerosis,stroke,record_day) values(?,?,?,?,?,?,?,?,?);";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1,userId);
			pstmt.setInt(2,TG);
			pstmt.setInt(3,TC);
			pstmt.setInt(4,HDL);
			pstmt.setInt(5,LDL);
			pstmt.setInt(6,vldl);
			pstmt.setDouble(7,angiosclerosis);
			pstmt.setDouble(8,stroke);
			pstmt.setString(9,record_day);
			// 提交送出
			int rowcount = pstmt.executeUpdate();
			System.out.println("rowcount(異動筆數) = " + rowcount);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}

	@Override
	public void addHyperlipidemia(String userId, Integer TG, Integer TC, Integer HDL, Integer LDL,Double angiosclerosis,Double stroke, String record_day) {
		String sql = "insert into hyperlipidemia(userId,TG,TC,HDL,LDL,angiosclerosis,stroke,record_day) values(?,?,?,?,?,?,?,?);";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1,userId);
			pstmt.setInt(2,TG);
			pstmt.setInt(3,TC);
			pstmt.setInt(4,HDL);
			pstmt.setInt(5,LDL);
			pstmt.setDouble(6,angiosclerosis);
			pstmt.setDouble(7,stroke);
			pstmt.setString(8,record_day);
			// 提交送出
			int rowcount = pstmt.executeUpdate();
			System.out.println("rowcount(異動筆數) = " + rowcount);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}

	@Override
	public List <Hyperlipidemia> findHyperlipidemiaByUserId(String userId) {
		String sql = "select TG,TC,HDL,LDL,vldl,angiosclerosis,stroke,record_day from hyperlipidemia where userId = ? order by hyperlipidemiaId";
		List <Hyperlipidemia> HyperlipidemiaInformations = new ArrayList<>();
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, userId);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
	            	Hyperlipidemia HyperlipidemiaInformation = new Hyperlipidemia();
	            	HyperlipidemiaInformation.setTG(rs.getInt("TG"));
	            	HyperlipidemiaInformation.setTC(rs.getInt("TC"));
	            	HyperlipidemiaInformation.setHDL(rs.getInt("HDL"));
	            	HyperlipidemiaInformation.setLDL(rs.getInt("LDL"));
	            	HyperlipidemiaInformation.setVldl(rs.getInt("vldl"));
	            	HyperlipidemiaInformation.setAngiosclerosis(rs.getDouble("angiosclerosis"));
	            	HyperlipidemiaInformation.setStroke(rs.getDouble("stroke"));
	            	HyperlipidemiaInformation.setRecordDay(rs.getString("record_day"));
	            	//加到HyperlipidemiaInformations
	            	HyperlipidemiaInformations.add(HyperlipidemiaInformation);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		return HyperlipidemiaInformations;
	}

	//腎臟功能
	@Override
	public void addRenalFunction(String userId, Double BUN, Double Cr, Double UA,Double mAlb, String record_day) {
		String sql = "insert into renalfunction(userId,BUN,Cr,UA,mAlb,record_day) values(?,?,?,?,?,?);";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1,userId);
			pstmt.setDouble(2,BUN);
			pstmt.setDouble(3,Cr);
			pstmt.setDouble(4,UA);
			pstmt.setDouble(5,mAlb);
			pstmt.setString(6,record_day);
			// 提交送出
			int rowcount = pstmt.executeUpdate();
			System.out.println("rowcount(異動筆數) = " + rowcount);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}

	@Override
	public List <RenalFunction> findRenalFunctionByUserId(String userId) {
		String sql = "select BUN,Cr,UA,mAlb,record_day from renalfunction where userId = ? order by renalFunctionId";
		List <RenalFunction> RenalFunctionInformations = new ArrayList<>();
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, userId);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
	            	RenalFunction renalFunctionInformation = new RenalFunction();
	            	renalFunctionInformation.setBUN(rs.getDouble("BUN"));
	            	renalFunctionInformation.setCr(rs.getDouble("Cr"));
	            	renalFunctionInformation.setUA(rs.getDouble("UA"));
	            	renalFunctionInformation.setmAlb(rs.getDouble("mAlb"));
	            	renalFunctionInformation.setRecordDay(rs.getString("record_day"));
	            	//加到HyperlipidemiaInformations
	            	RenalFunctionInformations.add(renalFunctionInformation);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		return RenalFunctionInformations;
	}

	//肝臟
	
	//電解質
	@Override
	public void addElectrolyte(String userId, Integer na, Integer k, Integer cl, Double Ca, Double P,
			String record_day) {
		String sql = "insert into electrolyte(userId,na,k,cl,Ca,P,record_day) values(?,?,?,?,?,?,?);";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1,userId);
			pstmt.setInt(2,na);
			pstmt.setInt(3,k);
			pstmt.setInt(4,cl);
			pstmt.setDouble(5,Ca);
			pstmt.setDouble(6,P);
			pstmt.setString(7,record_day);
			// 提交送出
			int rowcount = pstmt.executeUpdate();
			System.out.println("rowcount(異動筆數) = " + rowcount);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	
	@Override
	public void addElectrolyteWithOutNa(String userId, Integer k, Integer cl, Double Ca, Double P, String record_day) {
		String sql = "insert into electrolyte(userId,k,cl,Ca,P,record_day) values(?,?,?,?,?,?);";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1,userId);
			pstmt.setInt(2,k);
			pstmt.setInt(3,cl);
			pstmt.setDouble(4,Ca);
			pstmt.setDouble(5,P);
			pstmt.setString(6,record_day);
			// 提交送出
			int rowcount = pstmt.executeUpdate();
			System.out.println("rowcount(異動筆數) = " + rowcount);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	
	
	
	@Override
	public void addElectrolyteWithOutNaAndKAndCl(String userId, Double Ca, Double P, String record_day) {
		String sql = "insert into electrolyte(userId,Ca,P,record_day) values(?,?,?,?);";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1,userId);
			pstmt.setDouble(2,Ca);
			pstmt.setDouble(3,P);
			pstmt.setString(4,record_day);
			// 提交送出
			int rowcount = pstmt.executeUpdate();
			System.out.println("rowcount(異動筆數) = " + rowcount);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	
	//血液
	@Override
	public void addBlood(String userId, Integer WBC, Double RBC, Double Hgb, Double Hct,Double MCV, Double MCH, Double MCHC, Integer PLT, String record_day) {
		String sql = "insert into blood(userId,WBC,RBC,Hgb,Hct,MCV,MCH,MCHC,PLT,record_day) values(?,?,?,?,?,?,?,?,?,?);";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1,userId);
			pstmt.setInt(2,WBC);
			pstmt.setDouble(3,RBC);
			pstmt.setDouble(4,Hgb);
			pstmt.setDouble(5,Hct);
			pstmt.setDouble(6,MCV);
			pstmt.setDouble(7,MCH);
			pstmt.setDouble(8,MCHC);
			pstmt.setInt(9,PLT);
			pstmt.setString(10,record_day);
			// 提交送出
			int rowcount = pstmt.executeUpdate();
			System.out.println("rowcount(異動筆數) = " + rowcount);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}

	@Override
	public List <Blood> findBloodByUserId(String userId) {
		String sql = "select WBC,RBC,Hgb,Hct,MCV,MCH,MCHC,PLT,record_day from blood where userId = ? order by bloodId";
		List <Blood> BloodInformations = new ArrayList<>();
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, userId);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
	            	Blood bloodInformation = new Blood();
	            	bloodInformation.setWBC(rs.getInt("WBC"));
	            	bloodInformation.setRBC(rs.getDouble("RBC"));
	            	bloodInformation.setHgb(rs.getDouble("Hgb"));
	            	bloodInformation.setHct(rs.getDouble("Hct"));
	            	bloodInformation.setMCV(rs.getDouble("MCV"));
	            	bloodInformation.setMCH(rs.getDouble("MCH"));
	            	bloodInformation.setMCHC(rs.getDouble("MCHC"));
	            	bloodInformation.setPLT(rs.getInt("PLT"));
	            	bloodInformation.setRecordDay(rs.getString("record_day"));
	            	//加到HyperlipidemiaInformations
	            	BloodInformations.add(bloodInformation);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		return BloodInformations;
	}
	
	//尿液
	@Override
	public void addUrine(String userId, String appearance, Double PH, String leukocytes, String glucose, String protein,
			String bilirubin, String urobilirubin, String ketones, String occult_blood, Double specific_gravity,
			String nitrite, String record_day) {
		String sql = "insert into urine(userId,appearance,PH,leukocytes,glucose,protein,bilirubin,urobilirubin,ketones,occult_blood,specific_gravity,nitrite,record_day) values(?,?,?,?,?,?,?,?,?,?,?,?,?);";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1,userId);
			pstmt.setString(2,appearance);
			pstmt.setDouble(3,PH);
			pstmt.setString(4,leukocytes);
			pstmt.setString(5,glucose);
			pstmt.setString(6,protein);
			pstmt.setString(7,bilirubin);
			pstmt.setString(8,urobilirubin);
			pstmt.setString(9,ketones);
			pstmt.setString(10,occult_blood);
			pstmt.setDouble(11,specific_gravity);
			pstmt.setString(12,nitrite);
			pstmt.setString(13,record_day);
			// 提交送出
			int rowcount = pstmt.executeUpdate();
			System.out.println("rowcount(異動筆數) = " + rowcount);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}

	@Override
	public void addUrine(String userId, String appearance, Double PH, String leukocytes, String glucose, String protein,
			String bilirubin, String ketones, String occult_blood, Double specific_gravity, String nitrite, String record_day) {
		String sql = "insert into urine(userId,appearance,PH,leukocytes,glucose,protein,bilirubin,ketones,occult_blood,specific_gravity,nitrite,record_day) values(?,?,?,?,?,?,?,?,?,?,?,?);";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1,userId);
			pstmt.setString(2,appearance);
			pstmt.setDouble(3,PH);
			pstmt.setString(4,leukocytes);
			pstmt.setString(5,glucose);
			pstmt.setString(6,protein);
			pstmt.setString(7,bilirubin);
			pstmt.setString(8,ketones);
			pstmt.setString(9,occult_blood);
			pstmt.setDouble(10,specific_gravity);
			pstmt.setString(11,nitrite);
			pstmt.setString(12,record_day);
			// 提交送出
			int rowcount = pstmt.executeUpdate();
			System.out.println("rowcount(異動筆數) = " + rowcount);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}

	@Override
	public List<Urine> findUrineByUserId(String userId) {
		String sql = "select appearance,PH,leukocytes,glucose,protein,bilirubin,urobilirubin,ketones,occult_blood,specific_gravity,nitrite,record_day from urine where userId = ? order by urineId";
		List <Urine> UrineInformations = new ArrayList<>();
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, userId);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
	            	Urine urineInformation = new Urine();
	            	urineInformation.setAppearance(rs.getString("appearance"));
	            	urineInformation.setPH(rs.getDouble("PH"));
	            	urineInformation.setLeukocytes(rs.getString("leukocytes"));
	            	urineInformation.setGlucose(rs.getString("glucose"));
	            	urineInformation.setProtein(rs.getString("protein"));
	            	urineInformation.setBilirubin(rs.getString("bilirubin"));
	            	urineInformation.setUrobilirubin(rs.getString("urobilirubin"));
	            	urineInformation.setKetones(rs.getString("ketones"));
	            	urineInformation.setOccultBlood(rs.getString("occult_blood"));
	            	urineInformation.setSpecificGravity(rs.getDouble("specific_gravity"));
	            	urineInformation.setNitrite(rs.getString("nitrite"));
	            	//加到HyperlipidemiaInformations
	            	UrineInformations.add(urineInformation);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		return UrineInformations;
	}
	
	//尿液沉渣
	@Override
	public void addSediment(String userId, Integer RBC, Integer WBC, Integer epithelium, String crystal, String cast,
			String bacteria, String other, String record_day) {
		String sql = "insert into sediment(userId,RBC,WBC,epithelium,crystal,cast,bacteria,other,record_day) values(?,?,?,?,?,?,?,?,?);";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1,userId);
			pstmt.setInt(2,RBC);
			pstmt.setInt(3,WBC);
			pstmt.setInt(4,epithelium);
			pstmt.setString(5,crystal);
			pstmt.setString(6,cast);
			pstmt.setString(7,bacteria);
			pstmt.setString(8,other);
			pstmt.setString(9,record_day);
			// 提交送出
			int rowcount = pstmt.executeUpdate();
			System.out.println("rowcount(異動筆數) = " + rowcount);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}

	@Override
	public List<Sediment> findSedimentByUserId(String userId) {
		String sql = "select RBC,WBC,epithelium,crystal,cast,bacteria,other,record_day from sediment where userId = ? order by sedimentId";
		List <Sediment> SedimentInformations = new ArrayList<>();
		try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
	        pstmt.setString(1, userId);
	        try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
	            	Sediment sedimentInformation = new Sediment();
	            	sedimentInformation.setRBC(rs.getInt("RBC"));
	            	sedimentInformation.setWBC(rs.getInt("WBC"));
	            	sedimentInformation.setEpithelium(rs.getInt("epithelium"));;
	            	sedimentInformation.setCrystal(rs.getString("crystal"));
	            	sedimentInformation.setCast(rs.getString("cast"));
	            	sedimentInformation.setBacteria(rs.getString("bacteria"));
	            	sedimentInformation.setOther(rs.getString("other"));
	            	sedimentInformation.setRecordDay(rs.getString("record_day"));
	            	//加到HyperlipidemiaInformations
	            	SedimentInformations.add(sedimentInformation);
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
		return SedimentInformations;
	}
	
	//結果
	@Override
	public void addOutcomeByUserId(String userId, String Disease, String record_day) {
		String sql = "insert into outcome(userId,Disease,record_day) values(?,?,?);";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1,userId);
			pstmt.setString(2,Disease);
			pstmt.setString(3,record_day);
			// 提交送出
			int rowcount = pstmt.executeUpdate();
			System.out.println("rowcount(異動筆數) = " + rowcount);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	
	@Override
	public Boolean checkIsOutcome(String userId) {
		String sql = "select Disease from outcome where userId = ?;";
		Boolean outcomeIsExists = false;
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1, userId);
			try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
	            	outcomeIsExists = true;
	            }
	        }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return outcomeIsExists;
	}
	
	//健康資訊
	@Override
	public void addHealthInformation(String category, String title, String web_url) {
		String sql = "insert into Health_information(category,title,web_url) values(?,?,?);";
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1,category);
			pstmt.setString(2,title);
			pstmt.setString(3,web_url);
			// 提交送出
			int rowcount = pstmt.executeUpdate();
			System.out.println("rowcount(異動筆數) = " + rowcount);
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}

	@Override
	public Boolean findHealthInformationByWebTitle(String title) {
		String sql = "select title from health_information where title = ?;";
		Boolean isHealthInformationExists= false;
		try(PreparedStatement pstmt = conn.prepareStatement(sql)) {
			// 配置 sql ? 資料
			pstmt.setString(1, title);
			try (ResultSet rs = pstmt.executeQuery()) {
	            while (rs.next()) {
	            	isHealthInformationExists = true;
	            }
	        }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return isHealthInformationExists;
	}

	@Override
	public List<HealthInformation> readAllHealthInformations() {
		String sql = "select title,web_url from health_information order by healthInformationId desc limit 8";
		List <HealthInformation> HealthInformations = new ArrayList<>();
		try(Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(sql) ) {
				// 將 rs 的資料逐筆注入到 HealthInformation 物件中
				while (rs.next()) {
					HealthInformation healthInformation = new HealthInformation();
					healthInformation.setTitle(rs.getString("title"));
					healthInformation.setWeb_url(rs.getString("web_url"));
					// 加入到 HealthInformations 集合中
					HealthInformations.add(healthInformation);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			return HealthInformations;
	}

	@Override
	public List<HealthInformation> findUserStatusToPushRelevantHealthInformations(String userId) {
		String sql = "SELECT H.title, H.web_url FROM OUTCOME O "
		        + "JOIN Health_information H ON O.Disease = H.category "
		        + "WHERE O.Disease IS NOT NULL AND userId=?  LIMIT 8";
		List <HealthInformation> RelevantHealthInformations = new ArrayList<>();
		 try (PreparedStatement pstmt = conn.prepareStatement(sql)) {
		        pstmt.setString(1, userId);
		        try (ResultSet rs = pstmt.executeQuery()) {
		            while (rs.next()) {
		                HealthInformation healthInformation = new HealthInformation();
		                healthInformation.setTitle(rs.getString("title"));
		                healthInformation.setWeb_url(rs.getString("web_url"));
		                // 加入到 HealthInformations 集合中
		                RelevantHealthInformations.add(healthInformation);
		            }
		        }
		  } catch (SQLException e) {
			e.printStackTrace();
	    }
		return RelevantHealthInformations;
	}

	

}
