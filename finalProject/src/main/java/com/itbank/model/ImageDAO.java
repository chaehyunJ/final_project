package com.itbank.model;


import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface ImageDAO {
	@Select("select * from mcmorning_table")
	List<MacMorningDTO> getmacList();

	@Select("select * from burger_table")
	List<BurgerDTO> getburgerList();

}
