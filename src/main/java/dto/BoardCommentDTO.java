package dto;

import java.sql.Timestamp;

public class BoardCommentDTO {
	private int bcm_seq;
	private String bcm_writer;
	private Timestamp bcm_write_date;
	private String bcm_content;
	private int b_seq;
	public BoardCommentDTO() {
		super();
	}
	public BoardCommentDTO(int bcm_seq, String bcm_writer, Timestamp bcm_write_date, String bcm_content, int b_seq) {
		super();
		this.bcm_seq = bcm_seq;
		this.bcm_writer = bcm_writer;
		this.bcm_write_date = bcm_write_date;
		this.bcm_content = bcm_content;
		this.b_seq = b_seq;
	}
	public int getBcm_seq() {
		return bcm_seq;
	}
	public void setBcm_seq(int bcm_seq) {
		this.bcm_seq = bcm_seq;
	}
	public String getBcm_writer() {
		return bcm_writer;
	}
	public void setBcm_writer(String bcm_writer) {
		this.bcm_writer = bcm_writer;
	}
	public Timestamp getBcm_write_date() {
		return bcm_write_date;
	}
	public void setBcm_write_date(Timestamp bcm_write_date) {
		this.bcm_write_date = bcm_write_date;
	}
	public String getBcm_content() {
		return bcm_content;
	}
	public void setBcm_content(String bcm_content) {
		this.bcm_content = bcm_content;
	}
	public int getB_seq() {
		return b_seq;
	}
	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}
	
	
}
