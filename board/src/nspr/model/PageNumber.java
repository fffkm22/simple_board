package nspr.model;

public class PageNumber {

	private int postCount;
	private int currentPage;
	private int lastPage;

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getPostCount() {
		return postCount;
	}

	public void setPostCount(int postCount) {
		this.postCount = postCount;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	public int calLastPage() {
		int a = this.postCount / 10;
		int b = this.postCount % 10;
		
		if (b == 0) {
			return a;
		} else {
			return a + 1;
		}
	}
}
