package com.bts.plan.model;

import java.sql.SQLException;
import java.util.List;

public class TourPlaceService {
	private TourPlaceDAO tpDao;
	
	public TourPlaceService() {
		tpDao = new TourPlaceDAO();
	}
	
	public List<TourPlaceVO> selecAll() throws SQLException{
		return  tpDao.selecAll();
	}
}
