package dto;

import java.sql.Timestamp;

public class NoticeFileDTO {
	
	private int nf_seq;
	private String nf_oriName;
	private String nf_sysName;
	private Timestamp nf_upload_date;
	private int n_seq;
	
	
	public NoticeFileDTO() {
		super();
	}
	public NoticeFileDTO(int nf_seq, String nf_oriName, String nf_sysName, Timestamp nf_upload_date, int n_seq) {
		this.nf_seq = nf_seq;
		this.nf_oriName = nf_oriName;
		this.nf_sysName = nf_sysName;
		this.nf_upload_date = nf_upload_date;
		this.n_seq = n_seq;
	}
	
	
	public int getNf_seq() {
		return nf_seq;
	}
	public void setNf_seq(int nf_seq) {
		this.nf_seq = nf_seq;
	}
	public String getNf_oriName() {
		return nf_oriName;
	}
	public void setNf_oriName(String nf_oriName) {
		this.nf_oriName = nf_oriName;
	}
	public String getNf_sysName() {
		return nf_sysName;
	}
	public void setNf_sysName(String nf_sysName) {
		this.nf_sysName = nf_sysName;
	}
	public Timestamp getNf_upload_date() {
		return nf_upload_date;
	}
	public void setNf_upload_date(Timestamp nf_upload_date) {
		this.nf_upload_date = nf_upload_date;
	}
	public int getN_seq() {
		return n_seq;
	}
	public void setN_seq(int n_seq) {
		this.n_seq = n_seq;
	}

}
