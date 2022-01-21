package com.itbank.model;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.web.bind.annotation.RestController;

@RestController
public interface StoreInfoDAO {

	List<StoreInfoDTO> selectStore(String info);

	@Select("select * from storeinfo_table  where ${ cate } = 'y' order by store_seq")
	List<HashMap<String, Object>> selectCate(String cate);

}
