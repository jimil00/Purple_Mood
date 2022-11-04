package dto;

import java.sql.Timestamp;

public class NoticeCommentComplainDTO {
	
	private int ncmcp_seq;
	private String ncmcp_complainer;
	private Timestamp ncmcp_date;
	private int ncm_seq;
	private String ncm_writer;
	private String ncm_content;
	
	
	public NoticeCommentComplainDTO() {
		super();
	}
	public NoticeCommentComplainDTO(int ncmcp_seq, String ncmcp_complainer, Timestamp ncmcp_date, int ncm_seq,
			String ncm_writer, String ncm_content) {
		this.ncmcp_seq = ncmcp_seq;
		this.ncmcp_complainer = ncmcp_complainer;
		this.ncmcp_date = ncmcp_date;
		this.ncm_seq = ncm_seq;
		this.ncm_writer = ncm_writer;
		this.ncm_content = ncm_content;
	}
	
	
	public int getNcmcp_seq() {
		return ncmcp_seq;
	}
	public void setNcmcp_seq(int ncmcp_seq) {
		this.ncmcp_seq = ncmcp_seq;
	}
	public String getNcmcp_complainer() {
		return ncmcp_complainer;
	}
	public void setNcmcp_complainer(String ncmcp_complainer) {
		this.ncmcp_complainer = ncmcp_complainer;
	}
	public Timestamp getNcmcp_date() {
		return ncmcp_date;
	}
	public void setNcmcp_date(Timestamp ncmcp_date) {
		this.ncmcp_date = ncmcp_date;
	}
	public int getNcm_seq() {
		return ncm_seq;
	}
	public void setNcm_seq(int ncm_seq) {
		this.ncm_seq = ncm_seq;
	}
	public String getNcm_writer() {
		return ncm_writer;
	}
	public void setNcm_writer(String ncm_writer) {
		this.ncm_writer = ncm_writer;
	}
	public String getNcm_content() {
		return ncm_content;
	}
	public void setNcm_content(String ncm_content) {
		this.ncm_content = ncm_content;
	}

}
