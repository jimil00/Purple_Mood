package dto;

import java.sql.Timestamp;

public class NoticeCommentComplainDTO {
	private int ncc_seq;
	private String ncc_complainer;
	private Timestamp ncc_date;
	private int nc_seq;
	private String nc_writer;
	private String nc_content;
	public NoticeCommentComplainDTO() {
		super();
	}
	public NoticeCommentComplainDTO(int ncc_seq, String ncc_complainer, Timestamp ncc_date, int nc_seq,
			String nc_writer, String nc_content) {
		this.ncc_seq = ncc_seq;
		this.ncc_complainer = ncc_complainer;
		this.ncc_date = ncc_date;
		this.nc_seq = nc_seq;
		this.nc_writer = nc_writer;
		this.nc_content = nc_content;
	}
	public int getNcc_seq() {
		return ncc_seq;
	}
	public void setNcc_seq(int ncc_seq) {
		this.ncc_seq = ncc_seq;
	}
	public String getNcc_complainer() {
		return ncc_complainer;
	}
	public void setNcc_complainer(String ncc_complainer) {
		this.ncc_complainer = ncc_complainer;
	}
	public Timestamp getNcc_date() {
		return ncc_date;
	}
	public void setNcc_date(Timestamp ncc_date) {
		this.ncc_date = ncc_date;
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
	public String getNc_content() {
		return nc_content;
	}
	public void setNc_content(String nc_content) {
		this.nc_content = nc_content;
	}
	
	
	

}
