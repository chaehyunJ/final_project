package com.itbank.member;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberDAO {

	@Select("select * from user_table where userid = #{ userid } and userpw = #{ userpw }")
	MemberDTO login(MemberDTO dto);

	@Select("select * from user_table where userid = #{ userid }")
	MemberDTO selectMember(String userid);

	int join(MemberDTO dto);

	@Update("update user_table set  "
			+ "userpw=#{userpw},"
			+ "username=#{username},"
			+ "gender=#{gender},"
			+ "phone=#{phone},"
			+ "email=#{email},"
			+ "address=#{address}"
			+ "where userid = #{ userid }")
	int update(MemberDTO dto);
	
	
}
