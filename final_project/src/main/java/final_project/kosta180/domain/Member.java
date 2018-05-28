package final_project.kosta180.domain;

import java.io.Serializable;

public class Member implements Serializable {
	
	private String member_name;
	private String member_id;
	private String member_pass;
	private String member_email;
	private String member_kakao;
	
	public Member(){}

	public Member(String member_name, String member_id, String member_pass, String member_email,
			String member_kakao) {
		super();
		this.member_name = member_name;
		this.member_id = member_id;
		this.member_pass = member_pass;
		this.member_email = member_email;
		this.member_kakao = member_kakao;
	}


	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pass() {
		return member_pass;
	}

	public void setMember_pass(String member_pass) {
		this.member_pass = member_pass;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_kakao() {
		return member_kakao;
	}

	public void setMember_kakao(String member_kakao) {
		this.member_kakao = member_kakao;
	}

	

}
