package dto;

import java.sql.Timestamp;

public class BoardComplainDTO {

	private int bcp_seq;
	private String bcp_complainer;
	private Timestamp bcp_date;
	private int b_seq;
	private String b_writer;
	private String b_title;


	public BoardComplainDTO() {
		super();
	}
	public BoardComplainDTO(int bcp_seq, String bcp_complainer, Timestamp bcp_date, int b_seq, String b_writer,
			String b_title) {
		this.bcp_seq = bcp_seq;
		this.bcp_complainer = bcp_complainer;
		this.bcp_date = bcp_date;
		this.b_seq = b_seq;
		this.b_writer = b_writer;
		this.b_title = b_title;
	}


	public int getBcp_seq() {
		return bcp_seq;
	}
	public void setBcp_seq(int bcp_seq) {
		this.bcp_seq = bcp_seq;
	}
	public String getBcp_complainer() {
		return bcp_complainer;
	}
	public void setBcp_complainer(String bcp_complainer) {
		this.bcp_complainer = bcp_complainer;
	}
	public Timestamp getBcp_date() {
		return bcp_date;
	}
	public void setBcp_date(Timestamp bcp_date) {
		this.bcp_date = bcp_date;
	}
	public int getB_seq() {
		return b_seq;
	}
	public void setB_seq(int b_seq) {
		this.b_seq = b_seq;
	}
	public String getB_writer() {
		return b_writer;
	}
	public void setB_writer(String b_writer) {
		this.b_writer = b_writer;
	}
	public String getB_title() {
		return b_title;
	}
	public void setB_title(String b_title) {
		this.b_title = b_title;
	}

}
