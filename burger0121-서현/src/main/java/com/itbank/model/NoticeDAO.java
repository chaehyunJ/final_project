package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface NoticeDAO {

	@Select("select * from notice_table where flag ='bottom' order by notice_seq desc")
	List<NoticeDTO> selectNotice();

	@Select("select * from notice_table where notice_seq = #{ seq }")
	NoticeDTO selectNews(int seq);

	@Select("select * from notice_table where notice_seq = #{ num }")
	NoticeDTO nextNotice(int num);

//	@Update
//	int cntUpdate(int seq);

	@Update("update notice_table set cnt = #{cnt} + 1 where notice_seq = #{ seq }")
	int cntUpdate(HashMap<String, Object> map);

	
	@Insert("insert into notice_table (title, writer, content, fileName, cnt, flag) values ("
			+ "#{title},"
			+ "#{writer},"
			+ "#{content},"
			+ "#{fileName},"
			+ "#{cnt},"
			+ "#{flag})")
	int insert(NoticeDTO dto);
}
