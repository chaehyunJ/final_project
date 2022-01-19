package com.itbank.model;

import java.util.HashMap;

import org.apache.ibatis.annotations.Insert;

public interface PaymentDAO {
		@Insert("insert into orderlist_table (menus, price, paystatus, orderstatus, total, count,userid,orderaddress,phone) "
				+ "values(#{menus}, #{price}, #{paystatus}, #{orderstatus}, #{total}, #{count},#{userid},#{orderaddress},#{phone})")
			int payment(HashMap<String, String> map);

}
