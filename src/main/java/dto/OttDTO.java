package dto;

public class OttDTO {
	
	private int dr_id;
	private String dr_title;
	private String dr_genre;
	private String dr_first_air_date ;
	private String dr_vote_average ;
	private char dr_ottNF;
	private char dr_ottWV;
	private char dr_ottDZ;
	private char dr_ottWC;
	private int dr_like;
	private String dr_poster_path;
	private String dr_overview;
	
	private int mv_id;
	private String mv_title;
	private String mv_genre;
	private String mv_release_date;
	private String mv_vote_average;
	private String mv_runtime;
	private char mv_ottNF;
	private char mv_ottWV;
	private char mv_ottDZ;
	private char mv_ottWC;	
	private int mv_like;
	private String mv_poster_path;
	private String mv_overview;
	
	public OttDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public OttDTO(int dr_id, String dr_title, String dr_genre, String dr_first_air_date, String dr_vote_average,
			char dr_ottNF, char dr_ottWV, char dr_ottDZ, char dr_ottWC, int dr_like, String dr_poster_path,
			String dr_overview, int mv_id, String mv_title, String mv_genre, String mv_release_date,
			String mv_vote_average, String mv_runtime, char mv_ottNF, char mv_ottWV, char mv_ottDZ, char mv_ottWC,
			int mv_like, String mv_poster_path, String mv_overview) {
		super();
		this.dr_id = dr_id;
		this.dr_title = dr_title;
		this.dr_genre = dr_genre;
		this.dr_first_air_date = dr_first_air_date;
		this.dr_vote_average = dr_vote_average;
		this.dr_ottNF = dr_ottNF;
		this.dr_ottWV = dr_ottWV;
		this.dr_ottDZ = dr_ottDZ;
		this.dr_ottWC = dr_ottWC;
		this.dr_like = dr_like;
		this.dr_poster_path = dr_poster_path;
		this.dr_overview = dr_overview;
		
		this.mv_id = mv_id;
		this.mv_title = mv_title;
		this.mv_genre = mv_genre;
		this.mv_release_date = mv_release_date;
		this.mv_vote_average = mv_vote_average;
		this.mv_runtime = mv_runtime;
		this.mv_ottNF = mv_ottNF;
		this.mv_ottWV = mv_ottWV;
		this.mv_ottDZ = mv_ottDZ;
		this.mv_ottWC = mv_ottWC;
		this.mv_like = mv_like;
		this.mv_poster_path = mv_poster_path;
		this.mv_overview = mv_overview;
	}
	
	public OttDTO(int dr_id, int mv_id, String dr_title, String mv_title, String mv_poster_path, String dr_poster_path) {
		this.dr_id = dr_id;
		this.dr_title = dr_title;
		this.mv_id = mv_id;
		this.mv_title = mv_title;
		this.dr_poster_path = dr_poster_path;
		this.mv_poster_path = mv_poster_path;
	}
	

	public int getDr_id() {
		return dr_id;
	}

	public void setDr_id(int dr_id) {
		this.dr_id = dr_id;
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

	public String getDr_first_air_date() {
		return dr_first_air_date;
	}

	public void setDr_first_air_date(String dr_first_air_date) {
		this.dr_first_air_date = dr_first_air_date;
	}

	public String getDr_vote_average() {
		return dr_vote_average;
	}

	public void setDr_vote_average(String dr_vote_average) {
		this.dr_vote_average = dr_vote_average;
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

	public int getDr_like() {
		return dr_like;
	}

	public void setDr_like(int dr_like) {
		this.dr_like = dr_like;
	}

	public String getDr_poster_path() {
		return dr_poster_path;
	}

	public void setDr_poster_path(String dr_poster_path) {
		this.dr_poster_path = dr_poster_path;
	}

	public String getDr_overview() {
		return dr_overview;
	}

	public void setDr_overview(String dr_overview) {
		this.dr_overview = dr_overview;
	}

	public int getMv_id() {
		return mv_id;
	}

	public void setMv_id(int mv_id) {
		this.mv_id = mv_id;
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

	public String getMv_release_date() {
		return mv_release_date;
	}

	public void setMv_release_date(String mv_release_date) {
		this.mv_release_date = mv_release_date;
	}

	public String getMv_vote_average() {
		return mv_vote_average;
	}

	public void setMv_vote_average(String mv_vote_average) {
		this.mv_vote_average = mv_vote_average;
	}

	public String getMv_runtime() {
		return mv_runtime;
	}

	public void setMv_runtime(String mv_runtime) {
		this.mv_runtime = mv_runtime;
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

	public int getMv_like() {
		return mv_like;
	}

	public void setMv_like(int mv_like) {
		this.mv_like = mv_like;
	}

	public String getMv_poster_path() {
		return mv_poster_path;
	}

	public void setMv_poster_path(String mv_poster_path) {
		this.mv_poster_path = mv_poster_path;
	}

	public String getMv_overview() {
		return mv_overview;
	}

	public void setMv_overview(String mv_overview) {
		this.mv_overview = mv_overview;
	}
	

}
