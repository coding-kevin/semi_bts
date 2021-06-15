package com.bts.plan.model;



import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mystudy.db.ConnectionPoolMgr2;

public class TourplaceDAO {
	private ConnectionPoolMgr2 pool;
	
	public TourplaceDAO() {
		pool = new ConnectionPoolMgr2();
	}
	
	public List<TourplaceVO> selectAll() throws SQLException{
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<TourplaceVO> list = new ArrayList<TourplaceVO>();
		try {
			//1,2
			conn = pool.getConnection();
			
			//3
			String sql = "select * from tourplace";
			
			ps = conn.prepareStatement(sql);
			
			//4
			rs = ps.executeQuery();
			while(rs.next()) {
				
				int placeNo = rs.getInt("placeNo");
				String placeName  = rs.getString("placeName");
				String placetitle = rs.getString("placetitle");
				String placeAddress  = rs.getString("placeAddress");
				String placeTel  = rs.getString("placeTel");
				String homepage  = rs.getString("homepage");
				String placeInfo  = rs.getString("placeInfo");
				String latitude  = rs.getString("latitude");
				String longitude  = rs.getString("longitude");
				int catNo = rs.getInt("catNo");
				String imageURL  = rs.getString("imageURL");
				String imagemain  = rs.getString("imagemain");
			
				TourplaceVO dto = new TourplaceVO(placeNo,placeName,placetitle,placeAddress,placeTel,homepage,placeInfo,latitude,longitude,catNo,imageURL,imagemain);
				list.add(dto);
			}
			
			System.out.println("글 목록 조회 결과 list.size="+list.size());
			
			return list;
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}
	
	
	public List<TourplaceVO> selectAll(String condition, String keyword) throws SQLException{
	
		Connection conn = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		List<TourplaceVO> list = new ArrayList<TourplaceVO>();
		try {
			//1,2
			conn = pool.getConnection();
			
			//3
			String sql = "select * from tourplace  ";
			
			if(keyword!=null && !keyword.isEmpty()) {
				sql+="  where "+ condition +" like '%' || ? || '%'";
			}
			sql+="  order by placeNo";
			
			ps = conn.prepareStatement(sql);
			
			
			//4
			rs = ps.executeQuery();
			while(rs.next()) {
				
				int placeNo = rs.getInt("placeNo");
				String placeName  = rs.getString("placeName");
				String placetitle = rs.getString("placetitle");
				String placeAddress  = rs.getString("placeAddress");
				String placeTel  = rs.getString("placeTel");
				String homepage  = rs.getString("homepage");
				String placeInfo  = rs.getString("placeInfo");
				String latitude  = rs.getString("latitude");
				String longitude  = rs.getString("longitude");
				int catNo = rs.getInt("catNo");
				String imageURL  = rs.getString("imageURL");
				String imagemain  = rs.getString("imagemain");
			
				TourplaceVO dto = new TourplaceVO(placeNo,placeName,placetitle,placeAddress,placeTel,homepage,placeInfo,latitude,longitude,catNo,imageURL,imagemain);
				list.add(dto);
			}
			
			System.out.println("글 목록 조회 결과 list.size="+list.size()
			+ ", 매개변수 condition="+condition+", keyword="+keyword);
			
			return list;
		}finally {
			pool.dbClose(rs, ps, conn);
		}
	}
	
}
