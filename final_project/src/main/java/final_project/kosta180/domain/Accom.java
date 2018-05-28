package final_project.kosta180.domain;

public class Accom {
	private int list_code;
	private String accom_type;
	private String accom_name;
	private String accom_check_in;
	private String accom_check_out;
	private String accom_contents;
	
	public Accom(){}


	public int getList_code() {
		return list_code;
	}

	public void setList_code(int list_code) {
		this.list_code = list_code;
	}

	public String getAccom_type() {
		return accom_type;
	}

	public void setAccom_type(String accom_type) {
		this.accom_type = accom_type;
	}

	public String getAccom_name() {
		return accom_name;
	}

	public void setAccom_name(String accom_name) {
		this.accom_name = accom_name;
	}

	public String getAccom_check_in() {
		return accom_check_in;
	}

	public void setAccom_check_in(String accom_check_in) {
		this.accom_check_in = accom_check_in;
	}

	public String getAccom_check_out() {
		return accom_check_out;
	}

	public void setAccom_check_out(String accom_check_out) {
		this.accom_check_out = accom_check_out;
	}

	public String getAccom_contents() {
		return accom_contents;
	}

	public void setAccom_contents(String accom_contents) {
		this.accom_contents = accom_contents;
	}

	public Accom(int list_code, String accom_type, String accom_name, String accom_check_in,
			String accom_check_out, String accom_contents) {
		super();
		this.list_code = list_code;
		this.accom_type = accom_type;
		this.accom_name = accom_name;
		this.accom_check_in = accom_check_in;
		this.accom_check_out = accom_check_out;
		this.accom_contents = accom_contents;
	}

	
	
}
