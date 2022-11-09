package dto;

import java.sql.Timestamp;

public class Movie_reviewDTO {
	
	private int mvr_seq;
	private String mvr_writer;
	private String mvr_content;
	private int mvr_like;
	private Timestamp mvr_writer_date;
	private int mv_seq;
	
	public Movie_reviewDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Movie_reviewDTO(int mvr_seq, String mvr_writer, String mvr_content, int mvr_like, Timestamp mvr_writer_date,
			int mv_seq) {
		this.mvr_seq = mvr_seq;
		this.mvr_writer = mvr_writer;
		this.mvr_content = mvr_content;
		this.mvr_like = mvr_like;
		this.mvr_writer_date = mvr_writer_date;
		this.mv_seq = mv_seq;
	}

	public int getMvr_seq() {
		return mvr_seq;
	}

	public void setMvr_seq(int mvr_seq) {
		this.mvr_seq = mvr_seq;
	}

	public String getMvr_writer() {
		return mvr_writer;
	}

	public void setMvr_writer(String mvr_writer) {
		this.mvr_writer = mvr_writer;
	}

	public String getMvr_content() {
		return mvr_content;
	}

	public void setMvr_content(String mvr_content) {
		this.mvr_content = mvr_content;
	}

	public int getMvr_like() {
		return mvr_like;
	}

	public void setMvr_like(int mvr_like) {
		this.mvr_like = mvr_like;
	}

	public Timestamp getMvr_writer_date() {
		return mvr_writer_date;
	}

	public void setMvr_writer_date(Timestamp mvr_writer_date) {
		this.mvr_writer_date = mvr_writer_date;
	}

	public int getMv_seq() {
		return mv_seq;
	}

	public void setMv_seq(int mv_seq) {
		this.mv_seq = mv_seq;
	}
	
	
	

}
