package dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.NoticeDTO;

public class NoticeDAO {
	private static NoticeDAO instance;
	synchronized public static NoticeDAO getInstance() {
		if(instance == null) {
			instance = new NoticeDAO();
		}
		return instance;
	}

	private NoticeDAO() {}
	private Connection getConnection() throws Exception{
		Context ctx = new InitialContext();
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/oracle");
		return ds.getConnection();
	}

	// 공지사항 작성 (C)
	public int insertNoticeContents(NoticeDTO dto) throws Exception{
		String sql = "insert into notice values(?, ?, ?, sysdate, ?, ?, 0)";
		try(Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setInt(1, dto.getN_seq());
			pstat.setString(2, dto.getN_category());
			pstat.setString(3, dto.getN_writer());
			pstat.setString(4, dto.getN_title());
			pstat.setString(5, dto.getN_content());

			int result = pstat.executeUpdate();

			con.commit();
			return result;
		}
	}

	// 공지사항 출력 (R)
	public NoticeDTO selectNoticeContents(int n_seq) throws Exception {

		String sql = "select * from notice `where n_seq = ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setInt(1, n_seq);
			try(ResultSet rs = pstat.executeQuery();){

				rs.next();
				NoticeDTO dto = new NoticeDTO();
				dto.setN_seq(rs.getInt("n_seq"));
				dto.setN_category(rs.getString("n_category"));
				dto.setN_writer(rs.getString("n_writer"));
				dto.setN_write_date(rs.getTimestamp("n_write_date"));
				dto.setN_title(rs.getString("n_title"));
				dto.setN_content(rs.getString("n_content"));
				dto.setN_view_count(rs.getInt("n_view_count"));
				return dto;
			}

		}
	}


	// 공지사항 수정 (U)
	public int updateNoticeContents(String n_title, String n_content, int n_seq) throws Exception{
		String sql = "update notice set n_write_date=sysdate, n_title=?, n_content=? where n_seq=?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){
			pstat.setString(1, n_title);
			pstat.setString(2, n_content);
			pstat.setInt(3, n_seq);

			int result = pstat.executeUpdate();
			con.commit();
			return result;
		}}



	// 공지사항 삭제 (D)
	public int deleteNoticeContents(int n_seq) throws Exception{
		String sql = "delete from notice where n_seq = ?";
		try(Connection con = getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setInt(1, n_seq);
			int result = pstat.executeUpdate();

			con.commit();
			return result;
		}
	}


	// 게시글 번호 미리 받아두기
	public int getNoticeNextVal() throws Exception{

		String sql = "select notice_seq.nextval from dual";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){

			rs.next();
			return rs.getInt(1);
		}
	}

	// 게시글 조회수 출력
	public int addNoticeViewCount(int n_seq) throws Exception{

		String sql = "update notice set n_view_count=n_view_count+1 where n_seq = ?";

		try (Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){


			pstat.setInt(1, n_seq);

			int result = pstat.executeUpdate();

			con.commit();
			return result;
		}
	}

	// 공지사항 리스트 출력 (R)
	public List<NoticeDTO> selectNoticeByRange(int start, int end) throws Exception{

		String sql = "select * from (select notice.*, row_number() over(order by n_seq desc) rn from notice) where rn between ? and ?";

		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);){

			pstat.setInt(1, start);
			pstat.setInt(2, end);

			try(ResultSet rs = pstat.executeQuery();){

				List<NoticeDTO> list = new ArrayList<>();
				while(rs.next()) {
					NoticeDTO dto = new NoticeDTO();
					dto.setN_seq(rs.getInt("n_seq"));
					dto.setN_category(rs.getString("n_category"));
					dto.setN_writer(rs.getString("n_writer"));
					dto.setN_write_date(rs.getTimestamp("n_write_date"));
					dto.setN_title(rs.getString("n_title"));
					dto.setN_content(rs.getString("n_content"));
					dto.setN_view_count(rs.getInt("n_view_count"));
					list.add(dto);
				}
				return list;
			}
		}

	}



	public int getRecordCount() throws Exception {
		String sql = "select count(*) from notice";
		try(Connection con = this.getConnection();
				PreparedStatement pstat = con.prepareStatement(sql);
				ResultSet rs = pstat.executeQuery();){
			rs.next();
			return rs.getInt(1);
		}
	}

	//페이징
	public List<String> getNoticePageNavi(int currentPage) throws Exception {
		List<String>list=new ArrayList<>();
		int recordTotalCount = this.getRecordCount(); 

		int recordCountPerPage = 20; 
		int naviCountPerPage = 10; 

		int pageTotalCount = 0;
		if(recordTotalCount % recordCountPerPage > 0) {
			pageTotalCount = recordTotalCount / recordCountPerPage + 1; 
		}else {
			pageTotalCount = recordTotalCount / recordCountPerPage;
		}

		if(currentPage < 1) {
			currentPage = 1;
		}else if(currentPage > pageTotalCount) {
			currentPage = pageTotalCount;
		}

		int startNavi = (currentPage-1) / naviCountPerPage * naviCountPerPage + 1;
		int endNavi=0;
		if(endNavi > pageTotalCount) {
			endNavi = pageTotalCount;
		}else {
			endNavi=startNavi + naviCountPerPage - 1;
		}

		boolean needPrev = true;
		boolean needNext = true;

		if(startNavi == 1) {needPrev = false;}
		if(endNavi == pageTotalCount) {needNext = false;}

		StringBuilder sb = new StringBuilder();

		if(needPrev) {
			sb.append("<a href='/noticeList.notice?cpage="+(startNavi-1)+"'><</a> ");
		}

		for(int i = startNavi; i <= endNavi; i++) {
			sb.append("<a href='/noticeList.notice?cpage="+i+"'>" + i + "</a> ");
		}

		if(needNext) {
			sb.append("<a href='/noticeList.notice?cpage="+(endNavi+1)+"'>></a> ");
		}
		String navi=sb.toString();
		list.add(String.valueOf(endNavi));
		list.add(navi);
		return list;
	}


	//공지사항 검색 리스트 출력 (R) 페이징해서 다시 해야 함
	public List<NoticeDTO> selectNoticeSearchList(String noticeSearchOption,String noticeSearchWord) throws Exception{
		List<NoticeDTO>list = new ArrayList<>();

		if(noticeSearchOption.equals("n_title")) {
			String sql="select * from notice where n_title like ?";
			try(Connection con = getConnection();
					PreparedStatement pstat= con.prepareStatement(sql);){

				pstat.setString(1,"%"+noticeSearchWord+"%");

				try(ResultSet rs = pstat.executeQuery();){


					while(rs.next()) {
						NoticeDTO dto = new NoticeDTO();
						dto.setN_seq(rs.getInt("n_seq"));
						dto.setN_category(rs.getString("n_category"));
						dto.setN_writer(rs.getString("n_writer"));
						dto.setN_write_date(rs.getTimestamp("n_write_date"));
						dto.setN_title(rs.getString("n_title"));
						dto.setN_content(rs.getString("n_content"));
						dto.setN_view_count(rs.getInt("n_view_count"));
						list.add(dto);
					}
				}
			}
		}else if(noticeSearchOption.equals("n_writer")) {
			String sql="select * from notice where n_writer like ?";
			try(Connection con = getConnection();
					PreparedStatement pstat= con.prepareStatement(sql);){

				pstat.setString(1,"%"+noticeSearchWord+"%");

				try(ResultSet rs = pstat.executeQuery();){


					while(rs.next()) {
						NoticeDTO dto = new NoticeDTO();
						dto.setN_seq(rs.getInt("n_seq"));
						dto.setN_category(rs.getString("n_category"));
						dto.setN_writer(rs.getString("n_writer"));
						dto.setN_write_date(rs.getTimestamp("n_write_date"));
						dto.setN_title(rs.getString("n_title"));
						dto.setN_content(rs.getString("n_content"));
						dto.setN_view_count(rs.getInt("n_view_count"));
						list.add(dto);
					}
				}
			}
		}else if(noticeSearchOption.equals("n_content")) {
			String sql="select * from notice where n_content like ?";
			try(Connection con = getConnection();
					PreparedStatement pstat= con.prepareStatement(sql);){

				pstat.setString(1,"%"+noticeSearchWord+"%");

				try(ResultSet rs = pstat.executeQuery();){


					while(rs.next()) {
						NoticeDTO dto = new NoticeDTO();
						dto.setN_seq(rs.getInt("n_seq"));
						dto.setN_category(rs.getString("n_category"));
						dto.setN_writer(rs.getString("n_writer"));
						dto.setN_write_date(rs.getTimestamp("n_write_date"));
						dto.setN_title(rs.getString("n_title"));
						dto.setN_content(rs.getString("n_content"));
						dto.setN_view_count(rs.getInt("n_view_count"));
						list.add(dto);
					}
				}
			}
		}
		return list;

	}


}
