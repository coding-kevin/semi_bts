package com.bts.plan.model;

import java.sql.SQLException;
import java.util.List;

public class TourPlaceService {
	private TourplaceDAO tpDao;
	
	public TourPlaceService() {
		tpDao = new TourplaceDAO();
	}
	
	public List<TourplaceVO> selectAll() throws SQLException{
		return tpDao.selectAll();
	}
}
