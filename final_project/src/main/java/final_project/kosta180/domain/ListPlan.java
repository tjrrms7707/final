package final_project.kosta180.domain;

public class ListPlan {

	private int plan_code;
	private int list_code;
	private int list_day;

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

	public int getList_day() {
		return list_day;
	}

	public void setList_day(int list_day) {
		this.list_day = list_day;
	}

	public ListPlan() {
	}

	public ListPlan(int plan_code, int list_code, int list_day) {
		super();
		this.plan_code = plan_code;
		this.list_code = list_code;
		this.list_day = list_day;
	}

	
}
