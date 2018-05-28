package final_project.kosta180.domain;


public class Plan {
	
	private int plan_code;
	private String member_id;
	private String start_date;
	private String end_date;
	private String plan_city;
	private String plan_name;
	
	
	public Plan(){}


	public int getPlan_code() {
		return plan_code;
	}


	public void setPlan_code(int plan_code) {
		this.plan_code = plan_code;
	}


	public String getMember_id() {
		return member_id;
	}


	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}


	public String getStart_date() {
		return start_date;
	}


	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}


	public String getEnd_date() {
		return end_date;
	}


	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}


	public String getPlan_city() {
		return plan_city;
	}


	public void setPlan_city(String plan_city) {
		this.plan_city = plan_city;
	}


	public String getPlan_name() {
		return plan_name;
	}


	public void setPlan_name(String plan_name) {
		this.plan_name = plan_name;
	}


	public Plan(int plan_code, String member_id, String start_date, String end_date, String plan_city,
			String plan_name) {
		super();
		this.plan_code = plan_code;
		this.member_id = member_id;
		this.start_date = start_date;
		this.end_date = end_date;
		this.plan_city = plan_city;
		this.plan_name = plan_name;
	}


		


	
}
