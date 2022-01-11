package com.itbank.member;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberDAO {

	@Select("select * from user_table where userid = #{ userid } and userpw = #{ userpw }")
	MemberDTO login(MemberDTO dto);

	@Select("select * from user_table where userid = #{ userid }")
	MemberDTO selectMember(String userid);

}
