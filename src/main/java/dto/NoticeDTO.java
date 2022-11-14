package dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class NoticeDTO {

	private int n_seq;
	private String n_category;
	private String n_writer;
	private Timestamp n_write_date;
	private String n_title;
	private String n_content;
	private int n_view_count;


	public NoticeDTO() {
		super();
	}
	public NoticeDTO(int n_seq, String n_category, String n_writer, Timestamp n_write_date, String n_title,
			String n_content, int n_view_count) {
		this.n_seq = n_seq;
		this.n_category = n_category;
		this.n_writer = n_writer;
		this.n_write_date = n_write_date;
		this.n_title = n_title;
		this.n_content = n_content;
		this.n_view_count = n_view_count;
	}

	public int getN_seq() {
		return n_seq;
	}
	public void setN_seq(int n_seq) {
		this.n_seq = n_seq;
	}
	public String getN_category() {
		return n_category;
	}
	public void setN_category(String n_category) {
		this.n_category = n_category;
	}
	public String getN_writer() {
		return n_writer;
	}
	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}
	public String  getN_write_date()  {
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyMMdd");
		String sdf1_b_write_date = sdf1.format(this.n_write_date);
		String sdf1_currentTime = sdf1.format(System.currentTimeMillis());
		if(sdf1_b_write_date.equals(sdf1_currentTime)) {
			SimpleDateFormat sdf2 = new SimpleDateFormat("HH시 mm분");
			return sdf2.format(this.n_write_date);
		}else {
			SimpleDateFormat sdf3 = new SimpleDateFormat("MM월 dd일");
			return sdf3.format(this.n_write_date);
		}		
	}
	public void setN_write_date(Timestamp n_write_date) {
		this.n_write_date = n_write_date;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public int getN_view_count() {
		return n_view_count;
	}
	public void setN_view_count(int n_view_count) {
		this.n_view_count = n_view_count;
	}

}
