package com.team3.dao;

import java.sql.Connection;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.team3.vo.companyVo;
import com.team3.vo.ldetailVo;
import com.team3.vo.lsearch;
import com.team3.vo.member;
import com.team3.vo.reply;
import com.team3.vo.topVo;
import com.team3.vo.zzim;
import com.team3.vo.board;
import com.team3.vo.calendar;

import common.JDBCTemplate;

public class daoImpl extends JDBCTemplate implements dao {

	
		@Override
		public member login(String id, String pwd) {
			
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			ResultSet res = null;
			member m = new member();
			
			try {
				
				pstmt = con.prepareStatement(loginSelect);
				pstmt.setString(1, id);
				pstmt.setString(2, pwd);
				
				res = pstmt.executeQuery();
				
				while(res.next()) {
					
					m.setUserid(res.getString(1));
					m.setUserpw(res.getString(2));
					m.setNickname(res.getString(3));
					m.setEmail(res.getString(4));
					m.setIsdel(res.getString(5));
					
				}
				
				close(res);
				close(pstmt);
				close(con);
				
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}

			return m;
		}


	@Override
	public List<lsearch> all(String ccode) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<lsearch> list = new ArrayList();
		
		String sql = "SELECT LNAME, LCODE, "
				+ "(SELECT CNAME FROM CATEGORY_TB WHERE CCODE3 = CCODE) "
				+ "FROM LSEARCH_TB "
				+ "WHERE CCODE3 = ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, ccode);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				lsearch search = new lsearch();
				search.setLname(rs.getString(1));
				search.setLcode(rs.getString(2));
				search.setCcode3(rs.getString(3));
					
				list.add(search);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return list;
	}


	@Override
	public List<topVo> top() {
			
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		List<topVo> list = new ArrayList<topVo>();
		
		
		String sql = "SELECT * FROM(SELECT L.LCODE, L.LNAME, L.CCODE3, L.CNT, C.CIMG, C.CNAME, ROW_NUMBER() OVER(ORDER BY CNT DESC) NUM FROM LSEARCH_TB L, CATEGORY_TB C WHERE L.CCODE3 = C.CCODE) WHERE NUM BETWEEN 1 AND 10";
		
		try {
			
			pstmt = con.prepareStatement(sql);
			res = pstmt.executeQuery();
			
			while(res.next()) {
				
				topVo t = new topVo();
				t.setLcode(res.getString(1));
				t.setLname(res.getString(2));
				t.setCcode3(res.getString(3));
				t.setConut(res.getInt(4));
				t.setCimg(res.getString(5));
				t.setCname(res.getString(6));
				
				list.add(t);
				
			}
			
			close(res);
			close(pstmt);
			close(con);
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}

		return list;
		
	}


	@Override
	public List<board> qna(String tabloc) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<board> res = new ArrayList<board>();
		
		try {
			pstmt = con.prepareStatement(qnareplyyn);
			pstmt.setString(1, tabloc);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				board tmp = new board(
						rs.getInt(1),rs.getString(2),categoryname(rs.getString(3)),rs.getString(4),
						rs.getString(5),rs.getDate(6),rs.getString(7),rs.getString(8),rs.getInt(9),
						rs.getInt(10),countGrade(rs.getString(2))
						);
				tmp.setCountComment(countComment(rs.getInt(1)));
				res.add(tmp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
			close(con);
		}

		return res;
	}


		@Override
		public member mypage(String id) {
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			ResultSet res = null;
			member m = new member();
			
			try {	
				pstmt = con.prepareStatement(selectMember);
				pstmt.setString(1, id);
				
				res = pstmt.executeQuery();
				
				while(res.next()) {		
					String userid = res.getString("userid");
					String usernickname = res.getString("nickname");
					String useremail = res.getString("email");
					m = new member(usernickname, userid, useremail);			

				}
				close(res);
				close(pstmt);
				close(con);
				
			} catch (SQLException e) {
				e.printStackTrace();
			}

			return m;
		}


	@Override
	public List<zzim> zzim(String id) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<zzim> ll = new ArrayList<zzim>();
		String selectCerti = "SELECT L.LNAME, L.LCODE, " + 
				"SUBSTR((SELECT CNAME FROM CATEGORY_TB WHERE CCODE1=CCODE),1,2), " + 
				"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE3=CCODE), " +
				"Z.ZZIMCODE, L.CCODE3 " +
				"FROM LSEARCH_TB L, ZZIM_TB Z " + 
				"WHERE L.LCODE = Z.LCODE AND USERID=? " +
				"ORDER BY Z.ZZIMCODE ASC";
		
		
		try {
			pstmt = con.prepareStatement(selectCerti);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				zzim zzim = new zzim();
				zzim.setLname(rs.getString(1));
				zzim.setLcode(rs.getString(2));
				zzim.setCcode1(rs.getString(3));
				zzim.setCcode3(rs.getString(4));
				zzim.setZzimcode(rs.getString(5));
				zzim.setCcodeimg(rs.getString(6));
				zzim.setUserid(id);
				
				ll.add(zzim);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		
		return ll;
	}


	@Override
	public List<calendar> calendar(String userid) {

		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		List<calendar> list = new ArrayList<calendar>();
		
		String calendarsql = "SELECT Z.USERID, Z.LCODE, L.LNAME, E.NTH, E.W_PERIOD, E.W_TEST, E.W_PASS, E.P_PREIOD, E.P_TEST, E.P_PASS FROM ZZIM_TB Z, EXAMDATE_TB E, LSEARCH_TB L WHERE Z.LCODE = E.LCODE AND Z.LCODE = L.LCODE AND USERID = ?";

		try {
			
			pstmt = con.prepareStatement(calendarsql);
			pstmt.setString(1, userid);
			
			res = pstmt.executeQuery();
			
			while(res.next()) {
				
				calendar c = new calendar();
				c.setUserid(res.getString(1));
				c.setLcode(res.getString(2));
				c.setLname(res.getString(3));
				c.setNth(res.getString(4));
				c.setW_period(res.getString(5));
				c.setW_test(res.getString(6));
				c.setW_pass(res.getString(7));
				c.setP_period(res.getString(8));
				c.setP_test(res.getString(9));
				c.setP_pass(res.getString(10));
			
				list.add(c);
			}
			
			close(res);
			close(pstmt);
			close(con);
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		}
		
		
		
		return list;
		
	}


	@Override
	public List<companyVo> company(String code) {
		
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		List<companyVo> list = new ArrayList<companyVo>();
		
		String sql = "SELECT CO.DCODE, CO.KEYWORD, CO.DNAME, CO.INDUSTRY, CO.DIVIDE, CO.HOMEPAGE, CO.LOGO, CA.CNAME, CA.CIMG FROM COMPANY_TB CO, CATEGORY_TB CA WHERE CA.CCODE = CO.KEYWORD AND CO.KEYWORD = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, code);
			res = pstmt.executeQuery();
			int i =0;
			
			while(res.next()) {
			
					companyVo v = new companyVo();
					v.setDcode(res.getInt(1));
					v.setKeyword(res.getString(2));
					v.setDname(res.getString(3));
					v.setIndustry(res.getString(4));
					v.setDivide(res.getString(5));
					v.setHomepage(res.getString(6));
					v.setLogo(res.getString(7));
					v.setCname(res.getString(8));
					v.setCimg(res.getString(9));
					
					list.add(v);
					
					if(i<2) {
						i++;
					} else {
						break;
					}
					
			} 
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		

	return list;
	}


	@Override
	public List<ldetailVo> detail(String lcode) {

		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		
		Connection con2 = getConnection();
		PreparedStatement pstmt2 = null;
		int res2 = 0;
		
		List<ldetailVo> list = new ArrayList<ldetailVo>();
		
		
		String sql = "SELECT LS.LCODE, LS.LNAME, LS.CCODE3, C.CNAME , LS.CNT, LD.INSTITUTE, LD.URLS, LD.SUMMARY, LD.JOBS, LD.OUTLOOK, LD.CHK_W, LD.CHK_P, LD.PRICE_W, LD.PRICE_P, NVL(LD.SUBJECT_W, '-') AS SUBJECT_W, NVL(LD.SUBJECT_P, '-') AS SUBJECT_P, NVL(LD.PASS, '-') AS PASS, NVL(E.NTH, '-') AS NTH, NVL(E.W_PERIOD, '-') AS W_PERIOD, NVL(E.W_TEST, '-') AS W_TEST, NVL(W_PASS, '-') AS W_PASS, NVL(E.P_PREIOD, '-') AS P_PERIOD, NVL(E.P_TEST,'-') AS P_TEST, NVL(E.P_PASS, '-') AS P_PASS FROM LSEARCH_TB LS JOIN LDETAIL_TB LD ON LS.LCODE = LD.LCODE JOIN CATEGORY_TB C ON LS.CCODE3 = C.CCODE LEFT OUTER JOIN EXAMDATE_TB E ON E.LCODE = LS.LCODE WHERE LS.LCODE = ? ORDER BY LS.LCODE ASC";
		String updatecntsql = "UPDATE LSEARCH_TB SET CNT = CNT+1 WHERE LCODE = ?";	
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, lcode);
			res = pstmt.executeQuery();
			
			while(res.next()) {
				
				ldetailVo l = new ldetailVo();
				
				l.setLcode(res.getString(1));
				l.setLname(res.getString(2));
				l.setCcode3(res.getString(3));
				l.setCname(res.getString(4));
				l.setCnt(res.getInt(5));
				l.setInstitute(res.getString(6));
				l.setUrls(res.getString(7));
				l.setSummary(res.getString(8));
				l.setJobs(res.getString(9));
				l.setOutlook(res.getString(10));
				l.setChk_w(res.getString(11));
				l.setChk_p(res.getString(12));
				l.setPrice_w(res.getInt(13));
				l.setPrice_p(res.getInt(14));
				l.setSubject_w(res.getString(15));
				l.setSubject_p(res.getString(16));
				l.setPass(res.getString(17));
				l.setNth(res.getString(18));
				l.setW_period(res.getString(19));
				l.setW_test(res.getString(20));
				l.setW_pass(res.getString(21));
				l.setP_period(res.getString(22));
				l.setP_test(res.getString(23));
				l.setP_pass(res.getString(24));				
				
				list.add(l);
				
			}
			
			con2 = getConnection();
			pstmt2 = con2.prepareStatement(updatecntsql);
			pstmt2.setString(1, lcode);
			res2 = pstmt2.executeUpdate();
			
			close(pstmt2);
			close(con2);
			close(res);
			close(pstmt);
			close(con);
			
			
		} catch (SQLException e) {
	
			e.printStackTrace();
		}

		return list;
		
	}
	


	@Override
	public List<lsearch> conditionlist(String name, String big, String middle, String small) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<lsearch> list = new ArrayList();
		
		String sql = "";
	
		if(name == null && big == null && middle == null && small == null) {
			sql = "SELECT LCODE, LNAME, "
					+ "(SELECT CNAME FROM CATEGORY_TB WHERE CCODE1 = CCODE),"
					+ "CCODE3,"
					+ "(SELECT CNAME FROM CATEGORY_TB WHERE CCODE3 = CCODE) "
					+ "FROM LSEARCH_TB";
			
			try {
				pstm = con.prepareStatement(sql);
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					lsearch search = new lsearch();
					search.setLcode(rs.getString(1));
					search.setLname(rs.getString(2));
					search.setCcode1(rs.getString(3));
					search.setCcode2(rs.getString(4));
					search.setCcode3(rs.getString(5));
					
					list.add(search);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstm);
				close(con);
			}
		}
		

		if(name != null && big != null && middle != null && small != null) {
			sql = "SELECT LCODE, LNAME," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE1 = CCODE) ," + 
					"CCODE3," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE3 = CCODE) " + 
					"FROM LSEARCH_TB " +
					"WHERE LNAME LIKE '%'||?||'%' AND CCODE1 = ? AND CCODE2 = ? AND CCODE3 = ?";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, name);
				pstm.setString(2, big);
				pstm.setString(3, middle);
				pstm.setString(4, small);
				
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					lsearch search = new lsearch();
					search.setLcode(rs.getString(1));
					search.setLname(rs.getString(2));
					search.setCcode1(rs.getString(3));
					search.setCcode2(rs.getString(4));
					search.setCcode3(rs.getString(5));
					
					list.add(search);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstm);
				close(con);
			}
		}

		if(name == null && big != null && middle != null && small != null) {
			sql = "SELECT LCODE, LNAME," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE1 = CCODE) ," + 
					"CCODE3," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE3 = CCODE) " + 
					"FROM LSEARCH_TB " +
					"WHERE CCODE1 = ? AND CCODE2 = ? AND CCODE3 = ?";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, big);
				pstm.setString(2, middle);
				pstm.setString(3, small);
				
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					lsearch search = new lsearch();
					search.setLcode(rs.getString(1));
					search.setLname(rs.getString(2));
					search.setCcode1(rs.getString(3));
					search.setCcode2(rs.getString(4));
					search.setCcode3(rs.getString(5));
					
					list.add(search);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstm);
				close(con);
			}
		}
		

		if(name != null && big == null && middle == null && small == null) {
			sql = "SELECT LCODE, LNAME," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE1 = CCODE) ," + 
					"CCODE3," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE3 = CCODE) " + 
					"FROM LSEARCH_TB " +
					"WHERE LNAME LIKE '%'||?||'%'";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, name);
				
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					lsearch search = new lsearch();
					search.setLcode(rs.getString(1));
					search.setLname(rs.getString(2));
					search.setCcode1(rs.getString(3));
					search.setCcode2(rs.getString(4));
					search.setCcode3(rs.getString(5));
					
					list.add(search);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstm);
				close(con);
			}
		}
		
	
		if(name != null && big == null && middle == null && small != null) {
			sql = "SELECT LCODE, LNAME," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE1 = CCODE) ," + 
					"CCODE3," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE3 = CCODE) " + 
					"FROM LSEARCH_TB " +
					"WHERE LNAME LIKE '%'||?||'%' AND CCODE3 = ?";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, name);
				pstm.setString(2, small);
				
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					lsearch search = new lsearch();
					search.setLcode(rs.getString(1));
					search.setLname(rs.getString(2));
					search.setCcode1(rs.getString(3));
					search.setCcode2(rs.getString(4));
					search.setCcode3(rs.getString(5));
					
					list.add(search);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstm);
				close(con);
			}
		}
		

		if(name == null && big != null && middle == null && small == null) {
			sql = "SELECT LCODE, LNAME," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE1 = CCODE) ," + 
					"CCODE3," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE3 = CCODE) " + 
					"FROM LSEARCH_TB " +
					"WHERE CCODE1 = ?";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, big); 
				
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					lsearch search = new lsearch();
					search.setLcode(rs.getString(1));
					search.setLname(rs.getString(2));
					search.setCcode1(rs.getString(3));
					search.setCcode2(rs.getString(4));
					search.setCcode3(rs.getString(5));
					
					list.add(search);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstm);
				close(con);
			}
		}
		
	
		if(name != null && big != null && middle == null && small != null) {
			sql = "SELECT LCODE, LNAME," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE1 = CCODE) ," + 
					"CCODE3," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE3 = CCODE) " + 
					"FROM LSEARCH_TB " +
					"WHERE LNAME LIKE '%'||?||'%' AND CCODE1 = ? AND CCODE3 = ?";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, name);
				pstm.setString(2, big);
				pstm.setString(3, small);
				
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					lsearch search = new lsearch();
					search.setLcode(rs.getString(1));
					search.setLname(rs.getString(2));
					search.setCcode1(rs.getString(3));
					search.setCcode2(rs.getString(4));
					search.setCcode3(rs.getString(5));
					
					list.add(search);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstm);
				close(con);
			}
		}
		

		if(name == null && big == null && middle == null && small != null) {
			sql = "SELECT LCODE, LNAME," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE1 = CCODE) ," + 
					"CCODE3," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE3 = CCODE) " + 
					"FROM LSEARCH_TB " +
					"WHERE CCODE3 = ?";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, small);
				
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					lsearch search = new lsearch();
					search.setLcode(rs.getString(1));
					search.setLname(rs.getString(2));
					search.setCcode1(rs.getString(3));
					search.setCcode2(rs.getString(4));
					search.setCcode3(rs.getString(5));
					
					list.add(search);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstm);
				close(con);
			}
		}
		
	
		if(name != null && big != null && middle != null && small == null) {
			sql = "SELECT LCODE, LNAME," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE1 = CCODE) ," + 
					"CCODE3," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE3 = CCODE) " + 
					"FROM LSEARCH_TB " +
					"WHERE LNAME LIKE '%'||?||'%' AND CCODE1 = ? AND CCODE2 = ?";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, name);
				pstm.setString(2, big);
				pstm.setString(3, middle);
				
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					lsearch search = new lsearch();
					search.setLcode(rs.getString(1));
					search.setLname(rs.getString(2));
					search.setCcode1(rs.getString(3));
					search.setCcode2(rs.getString(4));
					search.setCcode3(rs.getString(5));
					
					list.add(search);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstm);
				close(con);
			}
		}
		
		
		if(name == null && big != null && middle != null && small == null) {
			sql = "SELECT LCODE, LNAME," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE1 = CCODE) ," + 
					"CCODE3," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE3 = CCODE) " + 
					"FROM LSEARCH_TB " +
					"WHERE CCODE1 = ? AND CCODE2 = ?";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, big);
				pstm.setString(2, middle);
				
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					lsearch search = new lsearch();
					search.setLcode(rs.getString(1));
					search.setLname(rs.getString(2));
					search.setCcode1(rs.getString(3));
					search.setCcode2(rs.getString(4));
					search.setCcode3(rs.getString(5));
					
					list.add(search);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstm);
				close(con);
			}
		}

		if(name == null && big != null && middle == null && small != null) {
			sql = "SELECT LCODE, LNAME," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE1 = CCODE) ," + 
					"CCODE3," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE3 = CCODE) " + 
					"FROM LSEARCH_TB " +
					"WHERE CCODE1 = ? AND CCODE3 = ?";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, big);
				pstm.setString(2, small);
				
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					lsearch search = new lsearch();
					search.setLcode(rs.getString(1));
					search.setLname(rs.getString(2));
					search.setCcode1(rs.getString(3));
					search.setCcode2(rs.getString(4));
					search.setCcode3(rs.getString(5));
					
					list.add(search);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstm);
				close(con);
			}
		}


		if(name != null && big != null && middle == null && small == null) {
			sql = "SELECT LCODE, LNAME," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE1 = CCODE) ," + 
					"CCODE3," + 
					"(SELECT CNAME FROM CATEGORY_TB WHERE CCODE3 = CCODE) " + 
					"FROM LSEARCH_TB " +
					"WHERE LNAME LIKE '%'||?||'%' AND CCODE1 = ?";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, name);
				pstm.setString(2, big);
				
				rs = pstm.executeQuery();
				
				while(rs.next()) {
					lsearch search = new lsearch();
					search.setLcode(rs.getString(1));
					search.setLname(rs.getString(2));
					search.setCcode1(rs.getString(3));
					search.setCcode2(rs.getString(4));
					search.setCcode3(rs.getString(5));
					
					list.add(search);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstm);
				close(con);
			}
		}
		
		return list; 
	}


		@Override
		public int sign(member m) {
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			int res=0;

			try {
				pstmt = con.prepareStatement(signMember);
				pstmt.setString(1, m.getUserid());
				pstmt.setString(2, m.getUserpw());
				pstmt.setString(3, m.getNickname());
				pstmt.setString(4, m.getEmail());
				
				res = pstmt.executeUpdate();
				if(res>0) {
					commit(con);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(con);
			}
			return res;
		}


	@Override
	public List<board> headtag(String tabloc,String horsehead) {
	      Connection con = getConnection();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      List<board> res = new ArrayList<board>();
	      
	      try {
	         pstmt = con.prepareStatement(headtaglist);
	         pstmt.setString(1, tabloc);
	         pstmt.setString(2, horsehead);
	         rs = pstmt.executeQuery();
	         
	         while(rs.next()) {
	            board tmp = new board(
	                  rs.getInt(1),rs.getString(2),categoryname(rs.getString(3)),rs.getString(4),
	                  rs.getString(5),rs.getDate(6),rs.getString(7),rs.getString(8),rs.getInt(9)
	                  );
	            tmp.setGradeCount(countGrade(rs.getString(2)));
	            tmp.setCountComment(countComment(rs.getInt(1)));
	            res.add(tmp);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         close(rs);
	         close(pstmt);
	         close(con);
	      }

	      return res;
	   }


	@Override
	public boolean zzimheart(String lcode, String userid) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		int res = 0;
		boolean result = true;
		
		String sql = "SELECT * FROM ZZIM_TB WHERE USERID = ? AND LCODE = ?";
		
		try {
			pstm = con.prepareStatement(sql);
			pstm.setString(1, userid);
			pstm.setString(2, lcode);
			
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				sql = "DELETE FROM ZZIM_TB WHERE USERID = ? AND LCODE = ?";
				
				pstm = con.prepareStatement(sql);
				pstm.setString(1, userid);
				pstm.setString(2, lcode);
				
				res = pstm.executeUpdate();
				result = false;
				
			} else {
				sql = "INSERT INTO ZZIM_TB VALUES(ZZIMSEQ.NEXTVAL, ?, ?)";
				
				pstm = con.prepareStatement(sql);
				pstm.setString(1, userid);
				pstm.setString(2, lcode);
				
				res = pstm.executeUpdate();
				result = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(con);
			close(pstm);
		}
		
		return result;
	}


	@Override
	public List countNum() {
		
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		List list = new ArrayList();
		ResultSet res = null;
		int rs = 0;
		
		String sqlCompany = "SELECT COUNT(*) FROM COMPANY_TB";
		String sqlMember = "SELECT COUNT(*) FROM MEMBER_TB";
		String sqlCerti = "SELECT COUNT(*) FROM LSEARCH_TB";
		String sqlVisit = "SELECT * FROM VISIT_TB";
		String updateVisit = "UPDATE VISIT_TB SET VISITNUM=VISITNUM+1";
		
		try {
			
			pstmt = con.prepareStatement(updateVisit);
			rs = pstmt.executeUpdate();
			
			pstmt = con.prepareStatement(sqlCompany);
			res = pstmt.executeQuery();
			
			while(res.next()) {
				
				int num = res.getInt(1);
				list.add(num);
				
			}
			
			pstmt = con.prepareStatement(sqlMember);
			res = pstmt.executeQuery();
			
			while(res.next()) {
				int num = res.getInt(1);
				list.add(num);
			}
			
			pstmt = con.prepareStatement(sqlCerti);
			res = pstmt.executeQuery();
			
			while(res.next()) {
				int num = res.getInt(1);
				list.add(num);
			}	
			
			pstmt = con.prepareStatement(sqlVisit);
			res = pstmt.executeQuery();
			
			while(res.next()) {
				int num = res.getInt(1);
				list.add(num);
			}
			
			con.commit();			

			
		} catch (SQLException e) {
	
			e.printStackTrace();
		}
		
		return list;
	}
	

	public member idfind(String email) {

		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		member m = new member();
				
		String sql = "SELECT * FROM MEMBER_TB WHERE EMAIL = ? AND ISDEL='N'";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			
			res = pstmt.executeQuery();
			
			while(res.next()) {
				
				m.setUserid(res.getString(1));
				m.setEmail(res.getString(4));
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return m;
	}
	

	public member selectone(String id) {
		
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet res = null;
		member m = new member();
		
		String sql = "SELECT * FROM MEMBER_TB WHERE USERID = ?";
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			
			res = pstmt.executeQuery();
			
			while(res.next()) {
				
				m.setUserid(res.getString(1));
				m.setEmail(res.getString(4));				
			}
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
		
		
		return m;
	}
	

	public int updatepwd(String userid, String userpwd) {
		
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		int res =0;
		
		String sql = "UPDATE MEMBER_TB SET USERPW = ? WHERE USERID = ?";
		
		try {
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userpwd);
			pstmt.setString(2, userid);
			
			res = pstmt.executeUpdate();
			
			if(res>0) {
				commit(con);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	@Override
	public String categorycode(String cname) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String result = "";
		
		
		try {
			
			pstm = con.prepareStatement(category2);
			pstm.setString(1, cname);
			
			rs=pstm.executeQuery();
			
			
			while(rs.next()) {
				
				result = rs.getString(1);
			
				
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		return result;
		
	}
	

	@Override
	public String categoryname(String ccode) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		String result = "";
		
		
			
		
		try {
			
			pstm = con.prepareStatement(category);
			pstm.setString(1, ccode);
			
			rs=pstm.executeQuery();
			
			
			while(rs.next()) {
				
				result = rs.getString(1);
				
				if(result==null) {
					result="";
				}
			}
			
		} catch (SQLException e) {
		
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
		}
		
		return result;
	}
	

	@Override
	public int noticeupdate(int boardno,String notice) {
		int res = 0;
		Connection con = getConnection();
		PreparedStatement pstm = null;
		
		try {
			pstm = con.prepareStatement(noticeupdate);
			pstm.setString(1, notice);
			pstm.setInt(2, boardno);
			
			res = pstm.executeUpdate();
			
			if(res>0) {
				commit(con);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);
		}
		
		return res;
	}


	@Override
	public List<board> noticelist(String tabloc) {
		Connection con = getConnection();
		PreparedStatement pstm = null;
		ResultSet rs = null;
		List<board> boardlist = new ArrayList<board>();
		try {
			pstm = con.prepareStatement(noticelist);
			pstm.setString(1, tabloc);
			
			rs = pstm.executeQuery();
			
			while(rs.next()) {
				board tmp = new board();
				tmp.setBoardno(rs.getInt(1));
				tmp.setNickname(rs.getString(2));
				tmp.setHeadtag(rs.getString(3));
				tmp.setTitle(rs.getString(4));
				tmp.setContent(rs.getString(5));
				tmp.setRegdate(rs.getDate(6));
				tmp.setTabloc(rs.getString(7));
				tmp.setNotice(rs.getString(8));
				tmp.setCount(rs.getInt(9));
				
				boardlist.add(tmp);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstm);
			close(con);
			
		}
		
			
		return boardlist;
	}
	

	@Override
	public int boardcountupdate(int boardno) {
	
		int res = 0;
		Connection con = getConnection();
		PreparedStatement pstm = null;
		try {
			pstm = con.prepareStatement(boardcountupdate);
			pstm.setInt(1, boardno);
			
			res = pstm.executeUpdate();
			
			if(res>0) {
				commit(con);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstm);
			close(con);		
		}
		return res;
	}
	

	@Override
	public board boarddetail(int boardno) {
		Connection con = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		board res = null;
		try {
			pstmt = con.prepareStatement(boarddetail);
			pstmt.setInt(1, boardno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				res = new board(
						rs.getInt(1),rs.getString(2),categoryname(rs.getString(3)),rs.getString(4),
						rs.getString(5),rs.getDate(6),rs.getString(7),rs.getString(8),rs.getInt(9)
						);
				res.setGradeCount(countGrade(rs.getString(2)));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
			close(con);
		}
		return res;
		
	}

	   @Override
	   public List<reply> replylist(int boardno) {
	      Connection con = getConnection();
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      List<reply> res = new ArrayList<reply>();
	      
	      try {
	         pstmt = con.prepareStatement(replylist);
	         pstmt.setInt(1, boardno);
	         rs = pstmt.executeQuery();
	         while(rs.next()) {
	            reply tmp = new reply(
	                  rs.getInt(1),rs.getInt(2),rs.getString(3),rs.getDate(4),rs.getString(5)
	                  );
	            tmp.setGradeCount(countGrade(rs.getString(3)));
	            res.add(tmp);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(rs);
	         close(pstmt);
	         close(con);
	      }
	      
	      return res;
	   }
	   

	   @Override
	   public boolean replyinsert(reply rvo) {
	      Connection con = getConnection();
	      PreparedStatement pstmt = null;
	      int res = 0;
	      try {
	         pstmt = con.prepareStatement(replyinsert);
	         pstmt.setInt(1, rvo.getBoardno());
	         pstmt.setString(2, rvo.getNickname());
	         pstmt.setString(3, rvo.getComments());
	         res = pstmt.executeUpdate();
	         
	         if(res>0) {
	            commit(con);
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close(pstmt);
	         close(con);
	      }
	      return (res>0)?true:false;
	   }
	   

	      @Override
	      public boolean replyupdate(reply rvo) {
	         Connection con = getConnection();
	         PreparedStatement pstmt = null;
	         int res = 0;
	         try {
	            pstmt = con.prepareStatement(replyupdate);
	            pstmt.setString(1, rvo.getComments());
	            pstmt.setInt(2, rvo.getCommentno());
	            res = pstmt.executeUpdate();
	            
	            if(res>0) {
	               commit(con);
	            }
	         } catch (SQLException e) {
	            e.printStackTrace();
	         } finally {
	            close(pstmt);
	            close(con);
	         }
	         return (res>0)?true:false;
	      }
	      

	      @Override
	      public boolean replydelete(int commentno) {
	         Connection con = getConnection();
	         PreparedStatement pstmt = null;
	         int res = 0;
	         try {
	            pstmt = con.prepareStatement(replydelete);
	            pstmt.setInt(1, commentno);
	            res = pstmt.executeUpdate();
	            
	            if(res>0) {
	               commit(con);
	            }
	         } catch (SQLException e) {
	            e.printStackTrace();
	         } finally {
	            close(pstmt);
	            close(con);
	         }
	         return (res>0)?true:false;
	      }
	      

	  	@Override
	  	public int write(board insert) {
	  	Connection con = getConnection();
	  	PreparedStatement pstm = null;
	  	int res = 0;
	  	
	  	try {
	  		pstm = con.prepareStatement(write);
	  		pstm.setString(1, insert.getNickname());
	  		pstm.setString(2, insert.getHeadtag());
	  		pstm.setString(3, insert.getTitle());
	  		pstm.setString(4, insert.getContent());
	  		pstm.setString(5, insert.getTabloc());
	  		
	  		res = pstm.executeUpdate();
	  		
	  		if(res>0) {
	  			commit(con);
	  		}
	  		
	  	} catch (SQLException e) {
	  		
	  		e.printStackTrace();
	  	} finally {
	  		close(pstm);
	  		close(con);
	  	}
	  	
	  	return res;	
	  	}
	  	

	  	@Override
		public int update(board b) {
			Connection con = getConnection();
			PreparedStatement pstm = null;
			int res = 0;

			try {
				pstm = con.prepareStatement(update);
				pstm.setString(1, b.getHeadtag());
				pstm.setString(2, b.getTitle());
				pstm.setString(3, b.getContent());
				pstm.setInt(4, b.getBoardno());
				
				res = pstm.executeUpdate();
				
				if(res>0) {
					
					commit(con);
				}
			} catch (SQLException e) {


				e.printStackTrace();
			} finally {
				close(pstm);
				close(con);
			}
					
			return res;
		}
	  	

		@Override
		public int delete(int boardno) {
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			int res = 0;
				
			try {
				pstmt = con.prepareStatement(delete);
				pstmt.setInt(1, boardno);
				res = pstmt.executeUpdate();
				
				if(res>0) {
					commit(con);
					
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(con);
			}
			
			
			return res;
		}
		

		@Override
		public List<board> community(String tabloc) {
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<board> res = new ArrayList<board>();
			
			try {
				pstmt = con.prepareStatement(boardlist);
				pstmt.setString(1, tabloc);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					board tmp = new board(
							rs.getInt(1),rs.getString(2),categoryname(rs.getString(3)),rs.getString(4),
							rs.getString(5),rs.getDate(6),rs.getString(7),rs.getString(8),rs.getInt(9)
							);
					
					tmp.setGradeCount(countGrade(rs.getString(2)));
					tmp.setCountComment(countComment(rs.getInt(1)));
					res.add(tmp);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
				close(con);
			}

			return res;
			
		}

		@Override
		public List<board> study(String tabloc) {
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<board> res = new ArrayList<board>();
			
			try {
				pstmt = con.prepareStatement(boardlist);
				pstmt.setString(1, tabloc);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					board tmp = new board(
							rs.getInt(1),rs.getString(2),categoryname(rs.getString(3)),rs.getString(4),
							rs.getString(5),rs.getDate(6),rs.getString(7),rs.getString(8),rs.getInt(9)
							);
					tmp.setGradeCount(countGrade(rs.getString(2)));
					tmp.setCountComment(countComment(rs.getInt(1)));
				
					res.add(tmp);
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
				close(con);
			}

			return res;
			
		}

		@Override
		public boolean qnareplyyn(int boardno) {
			Connection con = getConnection();
			PreparedStatement pstm = null;
			ResultSet rs = null;
			
			
			return false;
		}
		

		@Override
		public List<board> titlesearch(String boardkeyword,String tabloc) {
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<board> res = new ArrayList<board>();
			try {
				pstmt = con.prepareStatement(boardtitle);
				pstmt.setString(1, boardkeyword);
				pstmt.setString(2, tabloc);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					board tmp = new board(
							rs.getInt(1),rs.getString(2),categoryname(rs.getString(3)),rs.getString(4),
							rs.getString(5),rs.getDate(6),rs.getString(7),rs.getString(8),rs.getInt(9)
							);
					tmp.setGradeCount(countGrade(rs.getString(2)));
					tmp.setCountComment(countComment(rs.getInt(1)));
					res.add(tmp);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
				close(con);
			}

			return res;
		}


		@Override
		public List<board> nicknamesearch(String boardkeyword,String tabloc) {
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<board> res = new ArrayList<board>();
			try {
				pstmt = con.prepareStatement(boardnickname);
				pstmt.setString(1, boardkeyword);
				pstmt.setString(2, tabloc);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					board tmp = new board(
							rs.getInt(1),rs.getString(2),categoryname(rs.getString(3)),rs.getString(4),
							rs.getString(5),rs.getDate(6),rs.getString(7),rs.getString(8),rs.getInt(9)
							);
					tmp.setGradeCount(countGrade(rs.getString(2)));
					tmp.setCountComment(countComment(rs.getInt(1)));
					res.add(tmp);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
				close(con);
			}

			return res;
		}


		@Override
		public List<board> contentsearch(String boardkeyword,String tabloc) {
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<board> res = new ArrayList<board>();
			try {
				pstmt = con.prepareStatement(boardcontent);
				pstmt.setString(1, boardkeyword);
				pstmt.setString(2, tabloc);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					board tmp = new board(
							rs.getInt(1),rs.getString(2),categoryname(rs.getString(3)),rs.getString(4),
							rs.getString(5),rs.getDate(6),rs.getString(7),rs.getString(8),rs.getInt(9)
							);
					tmp.setGradeCount(countGrade(rs.getString(2)));
					tmp.setCountComment(countComment(rs.getInt(1)));
					res.add(tmp);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
				close(con);
			}

			return res;
		}

	
		@Override
		public List<board> bothsearch(String boardkeyword, String tabloc) {
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			List<board> res = new ArrayList<board>();
			try {
				pstmt = con.prepareStatement(boardboth);
				pstmt.setString(1, boardkeyword);
				pstmt.setString(2, boardkeyword);
				pstmt.setString(3, tabloc);
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					board tmp = new board(
							rs.getInt(1),rs.getString(2),categoryname(rs.getString(3)),rs.getString(4),
							rs.getString(5),rs.getDate(6),rs.getString(7),rs.getString(8),rs.getInt(9)
							);
					tmp.setGradeCount(countGrade(rs.getString(2)));
					tmp.setCountComment(countComment(rs.getInt(1)));
					res.add(tmp);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
				close(con);
			}

			return res;
		}
		

		@Override
		public boolean idChk(String id) {
			Connection con = getConnection();
			PreparedStatement pstm = null;
			ResultSet rs = null;
			boolean res = true;
			String sql = "SELECT * FROM MEMBER_TB WHERE USERID=? AND ISDEL = 'N'";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, id);
				rs = pstm.executeQuery();
				if(rs.next()) {
					res = true;
				} else {
					res = false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstm);
				close(con);
			}	
			return res;
		}


		@Override
		public boolean pwChk(String id, String pw) {
			Connection con = getConnection();
			PreparedStatement pstm = null;
			ResultSet rs = null;
			boolean res = true;
			String sql = "SELECT * FROM MEMBER_TB WHERE USERID = ? AND USERPW=? AND ISDEL = 'N'";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, id);
				pstm.setString(2, pw);
				
				rs = pstm.executeQuery();
				if(rs.next()) {
					res = true;
				} else {
					res = false;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstm);
				close(con);
			}	
			return res;
		}
		

		@Override
		public int updateinfo(member m, String pwd, String nickname, String email) {
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			int res=0;
			
			try {
				pstmt = con.prepareStatement(updateMember);
				//"UPDATE MEMBER_TB SET USERPW=?, NICKNAME=?, EMAIL=? WHERE USERID=?"
				pstmt.setString(1, pwd);
				pstmt.setString(2, nickname);
				pstmt.setString(3, email);
				pstmt.setString(4, m.getUserid());
				
				res = pstmt.executeUpdate();
			
				if(res>0) {
					commit(con);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(con);
			}
			return res;
		}
		

		@Override
		public int deleteinfo(String id) {
			
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			
			int res=0;
			
			try {
				pstmt = con.prepareStatement(deleteMember);
				pstmt.setString(1, id);		
				res = pstmt.executeUpdate();
				
				if(res>0) {
					
					
					commit(con);
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(pstmt);
				close(con);
			}
			return res;
		}
		

		@Override
		public boolean updateNickChk(String nickname) {
			Connection con = getConnection();
			PreparedStatement pstm = null;
			ResultSet rs = null;
			boolean res = true;
			String sql = "SELECT * FROM MEMBER_TB WHERE NICKNAME=? AND ISDEL='N'";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, nickname);
				rs = pstm.executeQuery();
				if(rs.next()) {
					res = false;
				} else {
					res = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstm);
				close(con);
			}	
			return res;
		}


		@Override
		public boolean updateEmailChk(String email) {
			Connection con = getConnection();
			PreparedStatement pstm = null;
			ResultSet rs = null;
			boolean res = true;
			String sql = "SELECT * FROM MEMBER_TB WHERE EMAIL=? AND ISDEL='N'";
			
			try {
				pstm = con.prepareStatement(sql);
				pstm.setString(1, email);
				rs = pstm.executeQuery();
				if(rs.next()) {
					res = false;
				} else {
					res = true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstm);
				close(con);
			}	
			return res;
		}
		
		

		@Override
		public boolean reidChk(String id) {

			
			Connection con = getConnection(); 
			PreparedStatement pstmt = null; 
			ResultSet rs = null; 
			String sql = "SELECT * FROM MEMBER_TB WHERE USERID = ?"; 
			boolean cnt = true; 
			
			try {
				pstmt = con.prepareStatement(sql); 
				pstmt.setString(1, id); 
				
				rs = pstmt.executeQuery(); 
				if(rs.next()) {
					cnt = false; 
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
				close(con);
			}
			
			return cnt;
		}

			@Override
			public boolean nickChk(String id) {
	
				
				Connection con = getConnection(); 
				PreparedStatement pstmt = null; 
				ResultSet rs = null; 
				String sql = "SELECT * FROM MEMBER_TB WHERE NICKNAME = ?"; 
				boolean cnt = true; 
				
				try {
					pstmt = con.prepareStatement(sql); 
					pstmt.setString(1, id); 
					
					rs = pstmt.executeQuery(); 
					if(rs.next()) {
						cnt = false; 
					}
				} catch (SQLException e) {
					e.printStackTrace();
				} finally {
					close(rs);
					close(pstmt);
					close(con);
				}
				
				return cnt;
			}
			
	
		@Override
		public boolean emailChk(String id) {
	
			
			Connection con = getConnection(); 
			PreparedStatement pstmt = null; 
			ResultSet rs = null; 
			String sql = "SELECT * FROM MEMBER_TB WHERE EMAIL = ?"; 
			boolean cnt = true; 
			
			try {
				pstmt = con.prepareStatement(sql); 
				pstmt.setString(1, id); 
				
				rs = pstmt.executeQuery(); 
				if(rs.next()) {
					cnt = false; 
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rs);
				close(pstmt);
				close(con);
			}
			
			return cnt;
		}
		

		public int countGrade(String nick) {
			
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			ResultSet res = null;
			int cnt = 0;
			int grade = 1;
			
			String sql1 = "SELECT COUNT(*) FROM BOARD_TB WHERE NICKNAME = ?";
			String sql2 = "SELECT COUNT(*) FROM COMMENT_TB WHERE NICKNAME = ?";
			
			try {
				
				pstmt = con.prepareStatement(sql1);
				pstmt.setString(1, nick);
				res = pstmt.executeQuery();
				
				while(res.next()) {
					
					cnt = res.getInt(1);
					
				}
				
				pstmt = con.prepareStatement(sql2);
				pstmt.setString(1, nick);
				res = pstmt.executeQuery();
				
				while(res.next()) {
					
					cnt += res.getInt(1);
					
				}		
				
				if(cnt >=0 && cnt <= 20) {
					grade = 1;
				} else if(cnt>20 && cnt <= 40) {
					grade = 2;
				} else if(cnt>40 && cnt <= 60) {
					grade = 3;
				} else if(cnt>60 && cnt <= 80) {
					grade = 4;
				} else{
					grade = 5;
				}
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			
			System.out.println(nick + "님의 점수 : " + cnt);
			
			return grade;
		}

		public List<lsearch> some(){
			
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			ResultSet res = null;
			
			List<lsearch> list = new ArrayList<lsearch>();
			
			String sql = "SELECT * FROM LSEARCH_TB WHERE LCODE BETWEEN 11 AND 30";
			try {
				
				pstmt = con.prepareStatement(sql);
				res = pstmt.executeQuery();
				
				while(res.next()) {
					lsearch l = new lsearch();
					l.setLname(res.getString(2));
					l.setConut(res.getInt(6));
					
					list.add(l);
					
				}
				
			} catch (SQLException e) {
		
				e.printStackTrace();
			}
			
			
			return list;
			
		}

		@Override
		public int countComment(int boardno) {
			Connection con = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int res = 0;
			
			String sql = " SELECT COUNT(*) FROM COMMENT_TB WHERE BOARDNO = ? ";
			
			try {
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, boardno);
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					res = rs.getInt(1);
				}
				
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}finally {
				close(rs);
				close(pstmt);
				close(con);
			}
			
			return res;
		}

}
