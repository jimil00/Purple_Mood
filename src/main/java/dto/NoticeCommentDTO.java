package dto;

import java.sql.Timestamp;

public class NoticeCommentDTO {
	
	private int ncm_seq;
	private String ncm_writer;
	private Timestamp ncm_write_date;
	private String ncm_content;
	private int n_seq;
	
	
	public NoticeCommentDTO() {
		super();
	}
	public NoticeCommentDTO(int ncm_seq, String ncm_writer, Timestamp ncm_write_date, String ncm_content, int n_seq) {
		this.ncm_seq = ncm_seq;
		this.ncm_writer = ncm_writer;
		this.ncm_write_date = ncm_write_date;
		this.ncm_content = ncm_content;
		this.n_seq = n_seq;
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
	public Timestamp getNcm_write_date() {
		return ncm_write_date;
	}
	public void setNcm_write_date(Timestamp ncm_write_date) {
		this.ncm_write_date = ncm_write_date;
	}
	public String getNcm_content() {
		return ncm_content;
	}
	public void setNcm_content(String ncm_content) {
		this.ncm_content = ncm_content;
	}
	public int getN_seq() {
		return n_seq;
	}
	public void setN_seq(int n_seq) {
		this.n_seq = n_seq;
	}
	
}
