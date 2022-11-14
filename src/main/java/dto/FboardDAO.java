package dto;

import java.sql.Timestamp;

public class FboardDAO {

	private int fb_seq;
	private String fb_category;
	private String fb_writer;
	private Timestamp fb_write_date;
	private String fb_title;
	private String fb_content;
	private int fb_view_count;

	public FboardDAO(){}

	public FboardDAO(int fb_seq, String fb_category, String fb_writer, Timestamp fb_write_date, String fb_title,
			String fb_content, int fb_view_count) {
		super();
		this.fb_seq = fb_seq;
		this.fb_category = fb_category;
		this.fb_writer = fb_writer;
		this.fb_write_date = fb_write_date;
		this.fb_title = fb_title;
		this.fb_content = fb_content;
		this.fb_view_count = fb_view_count;
	}

	public int getFb_seq() {
		return fb_seq;
	}

	public void setFb_seq(int fb_seq) {
		this.fb_seq = fb_seq;
	}

	public String getFb_category() {
		return fb_category;
	}

	public void setFb_category(String fb_category) {
		this.fb_category = fb_category;
	}

	public String getFb_writer() {
		return fb_writer;
	}

	public void setFb_writer(String fb_writer) {
		this.fb_writer = fb_writer;
	}

	public Timestamp getFb_write_date() {
		return fb_write_date;
	}

	public void setFb_write_date(Timestamp fb_write_date) {
		this.fb_write_date = fb_write_date;
	}

	public String getFb_title() {
		return fb_title;
	}

	public void setFb_title(String fb_title) {
		this.fb_title = fb_title;
	}

	public String getFb_content() {
		return fb_content;
	}

	public void setFb_content(String fb_content) {
		this.fb_content = fb_content;
	}

	public int getFb_view_count() {
		return fb_view_count;
	}

	public void setFb_view_count(int fb_view_count) {
		this.fb_view_count = fb_view_count;
	}

}
