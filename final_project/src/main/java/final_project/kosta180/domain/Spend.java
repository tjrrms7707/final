package final_project.kosta180.domain;

import java.util.Date;

public class Spend {
	private int list_code;
	private String spend_type;
	private String spend_contents;
	private String spend_price;
	private String country_code;
	private Date spend_date;
	private String spend_location;
	private String spend_category;
	
	public Spend(){}

	public int getList_code() {
		return list_code;
	}

	public void setList_code(int list_code) {
		this.list_code = list_code;
	}

	public String getSpend_type() {
		return spend_type;
	}

	public void setSpend_type(String spend_type) {
		this.spend_type = spend_type;
	}

	public String getSpend_contents() {
		return spend_contents;
	}

	public void setSpend_contents(String spend_contents) {
		this.spend_contents = spend_contents;
	}

	public String getSpend_price() {
		return spend_price;
	}

	public void setSpend_price(String spend_price) {
		this.spend_price = spend_price;
	}

	public String getCountry_code() {
		return country_code;
	}

	public void setCountry_code(String country_code) {
		this.country_code = country_code;
	}

	public Date getSpend_date() {
		return spend_date;
	}

	public void setSpend_date(Date spend_date) {
		this.spend_date = spend_date;
	}

	public String getSpend_location() {
		return spend_location;
	}

	public void setSpend_location(String spend_location) {
		this.spend_location = spend_location;
	}

	public String getSpend_category() {
		return spend_category;
	}

	public void setSpend_category(String spend_category) {
		this.spend_category = spend_category;
	}

	public Spend(int list_code, String spend_type, String spend_contents, String spend_price, String country_code,
			Date spend_date, String spend_location, String spend_category) {
		super();
		this.list_code = list_code;
		this.spend_type = spend_type;
		this.spend_contents = spend_contents;
		this.spend_price = spend_price;
		this.country_code = country_code;
		this.spend_date = spend_date;
		this.spend_location = spend_location;
		this.spend_category = spend_category;
	}
	
	
}
