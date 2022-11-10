package dto;

public class DramaDTO {
	
	private int dr_seq;
	private String dr_title;
	private String dr_genre;
	private String dr_summary;
	private String dr_img;
	private int dr_like;
	private char dr_ottNF;
	private char dr_ottWV;
	private char dr_ottTV;
	private char dr_ottCP;
	private char dr_ottDZ;
	private char dr_ottWC;
	
	
	public DramaDTO() {
		super();
	}

	public DramaDTO(int dr_seq, String dr_title, String dr_genre, String dr_summary, String dr_img, int dr_like,
			char dr_ottNF, char dr_ottWV, char dr_ottTV, char dr_ottCP, char dr_ottDZ, char dr_ottWC) {
		this.dr_seq = dr_seq;
		this.dr_title = dr_title;
		this.dr_genre = dr_genre;
		this.dr_summary = dr_summary;
		this.dr_img = dr_img;
		this.dr_like = dr_like;
		this.dr_ottNF = dr_ottNF;
		this.dr_ottWV = dr_ottWV;
		this.dr_ottTV = dr_ottTV;
		this.dr_ottCP = dr_ottCP;
		this.dr_ottDZ = dr_ottDZ;
		this.dr_ottWC = dr_ottWC;
	}
	
	public DramaDTO(int dr_seq, String dr_title,String dr_img) {
		
		this.dr_seq = dr_seq;
		this.dr_title = dr_title;
		this.dr_img = dr_img;
		
	}
	

	
	public int getDr_seq() {
		return dr_seq;
	}

	public void setDr_seq(int dr_seq) {
		this.dr_seq = dr_seq;
	}

	public String getDr_title() {
		return dr_title;
	}

	public void setDr_title(String dr_title) {
		this.dr_title = dr_title;
	}

	public String getDr_genre() {
		return dr_genre;
	}

	public void setDr_genre(String dr_genre) {
		this.dr_genre = dr_genre;
	}

	public String getDr_summary() {
		return dr_summary;
	}

	public void setDr_summary(String dr_summary) {
		this.dr_summary = dr_summary;
	}

	public String getDr_img() {
		return dr_img;
	}

	public void setDr_img(String dr_img) {
		this.dr_img = dr_img;
	}

	public int getDr_like() {
		return dr_like;
	}

	public void setDr_like(int dr_like) {
		this.dr_like = dr_like;
	}

	public char getDr_ottNF() {
		return dr_ottNF;
	}

	public void setDr_ottNF(char dr_ottNF) {
		this.dr_ottNF = dr_ottNF;
	}

	public char getDr_ottWV() {
		return dr_ottWV;
	}

	public void setDr_ottWV(char dr_ottWV) {
		this.dr_ottWV = dr_ottWV;
	}

	public char getDr_ottTV() {
		return dr_ottTV;
	}

	public void setDr_ottTV(char dr_ottTV) {
		this.dr_ottTV = dr_ottTV;
	}

	public char getDr_ottCP() {
		return dr_ottCP;
	}

	public void setDr_ottCP(char dr_ottCP) {
		this.dr_ottCP = dr_ottCP;
	}

	public char getDr_ottDZ() {
		return dr_ottDZ;
	}

	public void setDr_ottDZ(char dr_ottDZ) {
		this.dr_ottDZ = dr_ottDZ;
	}

	public char getDr_ottWC() {
		return dr_ottWC;
	}

	public void setDr_ottWC(char dr_ottWC) {
		this.dr_ottWC = dr_ottWC;
	}
	
	
	
	
}
