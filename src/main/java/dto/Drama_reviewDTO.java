package dto;

import java.sql.Timestamp;

public class Drama_reviewDTO {
	
	private int drr_seq;
	private String drr_writer;
	private String drr_content;
	private int drr_like;
	private Timestamp drr_writer_date;
	private int dr_seq;
	
	
	public Drama_reviewDTO() {
		super();
	}

	public Drama_reviewDTO(int drr_seq, String drr_writer, String drr_content, int drr_like, Timestamp drr_writer_date,
			int dr_seq) {
		this.drr_seq = drr_seq;
		this.drr_writer = drr_writer;
		this.drr_content = drr_content;
		this.drr_like = drr_like;
		this.drr_writer_date = drr_writer_date;
		this.dr_seq = dr_seq;
	}

	
	public int getDrr_seq() {
		return drr_seq;
	}

	public void setDrr_seq(int drr_seq) {
		this.drr_seq = drr_seq;
	}

	public String getDrr_writer() {
		return drr_writer;
	}

	public void setDrr_writer(String drr_writer) {
		this.drr_writer = drr_writer;
	}

	public String getDrr_content() {
		return drr_content;
	}

	public void setDrr_content(String drr_content) {
		this.drr_content = drr_content;
	}

	public int getDrr_like() {
		return drr_like;
	}

	public void setDrr_like(int drr_like) {
		this.drr_like = drr_like;
	}

	public Timestamp getDrr_writer_date() {
		return drr_writer_date;
	}

	public void setDrr_writer_date(Timestamp drr_writer_date) {
		this.drr_writer_date = drr_writer_date;
	}

	public int getDr_seq() {
		return dr_seq;
	}

	public void setDr_seq(int dr_seq) {
		this.dr_seq = dr_seq;
	}
	
	

}
