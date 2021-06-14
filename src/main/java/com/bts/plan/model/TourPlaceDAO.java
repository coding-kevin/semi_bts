package com.bts.plan.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mystudy.db.ConnectionPoolMgr2;

public class TourPlaceDAO {
	private ConnectionPoolMgr2 pool;
	
	public TourPlaceDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	public List<TourPlaceVO> selecAll() throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<TourPlaceVO> list = new ArrayList<TourPlaceVO>();
		try {
			conn = pool.getConnection();
			
			String sql = "select * from tourplace";
			ps = conn.prepareStatement(sql);
		
			rs = ps.executeQuery();
			while(rs.next()) {
				int TNo = rs.getInt("TNo");
				String TName = rs.getString("TName");
				String TAddress = rs.getString("TAddress");
				String hompage = rs.getString("homepage");
				String TInfo = rs.getString("TInfo");
				String latitude = rs.getString("latitude");
				String longitude = rs.getString("longitude");
				int catNo = rs.getInt("catNo");
				int TPNo = rs.getInt("TPNo");
				
				TourPlaceVO vo = new TourPlaceVO(TNo, TName, TAddress, hompage, TInfo, latitude, longitude, catNo, TPNo);
		
				list.add(vo);
			}
			System.out.println("전체목록 = " +list.size());
			return list;
		} finally{
			pool.dbClose (rs, ps, conn);
		}
	}//
}
