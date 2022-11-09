package dto;

public class MovieDTO {
	
	private int mv_seq;
	private String mv_title;
	private String mv_genre;
	private String mv_summary;
	private String mv_img;
	private int mv_like;
	private char mv_ottNF;
	private char mv_ottWV;
	private char mv_ottTV;
	private char mv_ottCP;
	private char mv_ottDZ;
	private char mv_ottWC;
	
	public MovieDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public MovieDTO(int mv_seq, String mv_title, String mv_genre, String mv_summary, String mv_img, int mv_like,
			char mv_ottNF, char mv_ottWV, char mv_ottTV, char mv_ottCP, char mv_ottDZ, char mv_ottWC) {
		this.mv_seq = mv_seq;
		this.mv_title = mv_title;
		this.mv_genre = mv_genre;
		this.mv_summary = mv_summary;
		this.mv_img = mv_img;
		this.mv_like = mv_like;
		this.mv_ottNF = mv_ottNF;
		this.mv_ottWV = mv_ottWV;
		this.mv_ottTV = mv_ottTV;
		this.mv_ottCP = mv_ottCP;
		this.mv_ottDZ = mv_ottDZ;
		this.mv_ottWC = mv_ottWC;
	}
	
	public MovieDTO(int mv_seq, String mv_title,String mv_img) {
		
		this.mv_seq = mv_seq;
		this.mv_title = mv_title;
		this.mv_img = mv_img;
		
	}
	
	public int getMv_seq() {
		return mv_seq;
	}
	public void setMv_seq(int mv_seq) {
		this.mv_seq = mv_seq;
	}
	public String getMv_title() {
		return mv_title;
	}
	public void setMv_title(String mv_title) {
		this.mv_title = mv_title;
	}
	public String getMv_genre() {
		return mv_genre;
	}
	public void setMv_genre(String mv_genre) {
		this.mv_genre = mv_genre;
	}
	public String getMv_summary() {
		return mv_summary;
	}
	public void setMv_summary(String mv_summary) {
		this.mv_summary = mv_summary;
	}
	public String getMv_img() {
		return mv_img;
	}
	public void setMv_img(String mv_img) {
		this.mv_img = mv_img;
	}
	public int getMv_like() {
		return mv_like;
	}
	public void setMv_like(int mv_like) {
		this.mv_like = mv_like;
	}
	public char getMv_ottNF() {
		return mv_ottNF;
	}
	public void setMv_ottNF(char mv_ottNF) {
		this.mv_ottNF = mv_ottNF;
	}
	public char getMv_ottWV() {
		return mv_ottWV;
	}
	public void setMv_ottWV(char mv_ottWV) {
		this.mv_ottWV = mv_ottWV;
	}
	public char getMv_ottTV() {
		return mv_ottTV;
	}
	public void setMv_ottTV(char mv_ottTV) {
		this.mv_ottTV = mv_ottTV;
	}
	public char getMv_ottCP() {
		return mv_ottCP;
	}
	public void setMv_ottCP(char mv_ottCP) {
		this.mv_ottCP = mv_ottCP;
	}
	public char getMv_ottDZ() {
		return mv_ottDZ;
	}
	public void setMv_ottDZ(char mv_ottDZ) {
		this.mv_ottDZ = mv_ottDZ;
	}
	public char getMv_ottWC() {
		return mv_ottWC;
	}
	public void setMv_ottWC(char mv_ottWC) {
		this.mv_ottWC = mv_ottWC;
	}

	
}
