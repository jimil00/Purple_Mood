package dto;

import java.sql.Timestamp;

public class NoticeCommentDTO {
	private int nc_seq;
	private String nc_writer;
	private Timestamp nc_write_date;
	private String nc_content;
	private int n_seq;
	public NoticeCommentDTO() {
		super();
	}
	public NoticeCommentDTO(int nc_seq, String nc_writer, Timestamp nc_write_date, String nc_content, int n_seq) {
		super();
		this.nc_seq = nc_seq;
		this.nc_writer = nc_writer;
		this.nc_write_date = nc_write_date;
		this.nc_content = nc_content;
		this.n_seq = n_seq;
	}
	public int getNc_seq() {
		return nc_seq;
	}
	public void setNc_seq(int nc_seq) {
		this.nc_seq = nc_seq;
	}
	public String getNc_writer() {
		return nc_writer;
	}
	public void setNc_writer(String nc_writer) {
		this.nc_writer = nc_writer;
	}
	public Timestamp getNc_write_date() {
		return nc_write_date;
	}
	public void setNc_write_date(Timestamp nc_write_date) {
		this.nc_write_date = nc_write_date;
	}
	public String getNc_content() {
		return nc_content;
	}
	public void setNc_content(String nc_content) {
		this.nc_content = nc_content;
	}
	public int getN_seq() {
		return n_seq;
	}
	public void setN_seq(int n_seq) {
		this.n_seq = n_seq;
	}
	
	

}
