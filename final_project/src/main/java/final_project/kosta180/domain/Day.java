package final_project.kosta180.domain;
public class Day {
	private int day_code;
	private int list_code;
	private String day_title;
	private String day_time;
	private String day_contents;
	
	public Day(){}

	public int getDay_code() {
		return day_code;
	}

	public void setDay_code(int day_code) {
		this.day_code = day_code;
	}

	public int getList_code() {
		return list_code;
	}

	public void setList_code(int list_code) {
		this.list_code = list_code;
	}


	public String getDay_title() {
		return day_title;
	}

	public void setDay_title(String day_title) {
		this.day_title = day_title;
	}

	public String getDay_time() {
		return day_time;
	}

	public void setDay_time(String day_time) {
		this.day_time = day_time;
	}

	public String getDay_contents() {
		return day_contents;
	}

	public void setDay_contents(String day_contents) {
		this.day_contents = day_contents;
	}

	public Day(int day_code, int list_code, String day_title, String day_time, String day_contents) {
		super();
		this.day_code = day_code;
		this.list_code = list_code;
		this.day_title = day_title;
		this.day_time = day_time;
		this.day_contents = day_contents;
	}
	
	
	

}
