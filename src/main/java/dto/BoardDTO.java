package dto;

import java.sql.Timestamp;

public class BoardDTO {
	
	private int b_seq;
	private String b_category;
	private String b_writer;
	private Timestamp b_write_date;
	private String b_title;
	private String b_content;
	private int b_view_count;
	
	
	public BoardDTO() {
		super();
	}
	public BoardDTO(int b_seq, String b_category, String b_writer, Timestamp b_write_date, String b_title,
			String b_content, int b_view_count) {
		this.b_seq = b_seq;
		this.b_category = b_category;
		this.b_writer = b_writer;
		this.b_write_date = b_write_date;
		this.b_title = b_title;
		this.b_content = b_content;
		this.b_view_count = b_view_count;
	}
	
	
	public int getB_seq() {
		return b_seq;
	}
	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}
	public String getB_category() {
		return b_category;
	}
	public void setB_category(String b_category) {
		this.b_category = b_category;
	}
	public String getB_writer() {
		return b_writer;
	}
	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}
	public Timestamp getB_write_date() {
		return b_write_date;
	}
	public void setB_write_date(Timestamp b_write_date) {
		this.b_write_date = b_write_date;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}
	public String getB_content() {
		return b_content;
	}
	public void setB_content(String b_content) {
		this.b_content = b_content;
	}
	public int getB_view_count() {
		return b_view_count;
	}
	public void setB_view_count(int b_view_count) {
		this.b_view_count = b_view_count;
	}

}
