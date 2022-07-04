package nspr.model;

import java.sql.Timestamp;

public class Post {
	private int post_number;
	private String post_title;
	private String post_writer;
	private String post_password;
	private String post_content;
	private int post_hits;
	private Timestamp post_date;

	public Post(String post_title, String post_writer, String post_password, String post_content, Timestamp post_date) {
		this.post_title = post_title;
		this.post_writer = post_writer;
		this.post_password = post_password;
		this.post_content = post_content;
		this.post_date = post_date;
	}

	public Post(int post_number, String post_title, String post_writer, String post_password, String post_content,
			int post_hits, Timestamp post_date) {
		this.post_number = post_number;
		this.post_title = post_title;
		this.post_writer = post_writer;
		this.post_password = post_password;
		this.post_content = post_content;
		this.post_hits = post_hits;
		this.post_date = post_date;
	}

	public Post(int post_number, String post_title, String post_writer, String post_password, String post_content,
			Timestamp post_date) {
		this.post_number = post_number;
		this.post_title = post_title;
		this.post_writer = post_writer;
		this.post_password = post_password;
		this.post_content = post_content;
		this.post_date = post_date;
	}

	public int getPost_number() {
		return post_number;
	}

	public void setPost_number(int post_number) {
		this.post_number = post_number;
	}

	public String getPost_title() {
		return post_title;
	}

	public void setPost_title(String post_title) {
		this.post_title = post_title;
	}

	public String getPost_writer() {
		return post_writer;
	}

	public void setPost_writer(String post_writer) {
		this.post_writer = post_writer;
	}

	public String getPost_content() {
		return post_content;
	}

	public void setPost_content(String post_content) {
		this.post_content = post_content;
	}

	public String getPost_password() {
		return post_password;
	}

	public int getPost_hits() {
		return post_hits;
	}

	public Timestamp getPost_date() {
		return post_date;
	}

	public void hitsIncrease() {
		post_hits++;
	}

}
