package final_project.kosta180.domain;

public class Trans {
	private int trans_code;
	private int plan_code;
	private int list_code;
	private String trans_type;
	private String trans_start_time;
	private String trans_start_location;
	private String trans_end_time;
	private String trans_end_location;
	private String trans_contents;
	
	public Trans(){}

	public int getTrans_code() {
		return trans_code;
	}

	public void setTrans_code(int trans_code) {
		this.trans_code = trans_code;
	}

	public int getPlan_code() {
		return plan_code;
	}

	public void setPlan_code(int plan_code) {
		this.plan_code = plan_code;
	}

	public int getList_code() {
		return list_code;
	}

	public void setList_code(int list_code) {
		this.list_code = list_code;
	}

	public String getTrans_type() {
		return trans_type;
	}

	public void setTrans_type(String trans_type) {
		this.trans_type = trans_type;
	}

	public String getTrans_start_time() {
		return trans_start_time;
	}

	public void setTrans_start_time(String trans_start_time) {
		this.trans_start_time = trans_start_time;
	}

	public String getTrans_start_location() {
		return trans_start_location;
	}

	public void setTrans_start_location(String trans_start_location) {
		this.trans_start_location = trans_start_location;
	}

	public String getTrans_end_time() {
		return trans_end_time;
	}

	public void setTrans_end_time(String trans_end_time) {
		this.trans_end_time = trans_end_time;
	}

	public String getTrans_end_location() {
		return trans_end_location;
	}

	public void setTrans_end_location(String trans_end_location) {
		this.trans_end_location = trans_end_location;
	}

	public String getTrans_contents() {
		return trans_contents;
	}

	public void setTrans_contents(String trans_contents) {
		this.trans_contents = trans_contents;
	}

	public Trans(int trans_code, int plan_code, int list_code, String trans_type, String trans_start_time,
			String trans_start_location, String trans_end_time, String trans_end_location, String trans_contents) {
		super();
		this.trans_code = trans_code;
		this.plan_code = plan_code;
		this.list_code = list_code;
		this.trans_type = trans_type;
		this.trans_start_time = trans_start_time;
		this.trans_start_location = trans_start_location;
		this.trans_end_time = trans_end_time;
		this.trans_end_location = trans_end_location;
		this.trans_contents = trans_contents;
	}

	
	
	
}
