package com.itbank.model;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

@Repository
public interface PromotionDAO {
	
	@Select("select * from promotion"
			+ 	" order by name asc "
			+ 	" OFFSET #{offset} ROWS "
			+ 	" FETCH NEXT 6 ROWS ONLY ")
	List<PromotionDTO> selectList(int offset);
}
