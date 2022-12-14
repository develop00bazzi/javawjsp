package board;

public class BoardVO {
	private int idx;
	private String nickName;
	private String title;
	private String email;
	private String homePage;
	private String content;
	private String wDate;
	private String hostIp;
	private int readNum;
	private int good;
	private String mid;
	
//	DB 테이블에 작성한 필드
	
	private int day_diff;	// 날짜 차이 계산 필드
	private int hour_diff;	// 시간 차이 계산 필드
	
//	이전 글 / 다음 글을 위한 변수 설정
	
	private int prevIdx;
	private int nextIdx;
	private String prevTitle;
	private String nextTitle;
	
//	댓글수 카운트를 위한 변수 설정
	
	private int replyCnt;

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getHomePage() {
		return homePage;
	}

	public void setHomePage(String homePage) {
		this.homePage = homePage;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public String getHostIp() {
		return hostIp;
	}

	public void setHostIp(String hostIp) {
		this.hostIp = hostIp;
	}

	public int getReadNum() {
		return readNum;
	}

	public void setReadNum(int readNum) {
		this.readNum = readNum;
	}

	public int getGood() {
		return good;
	}

	public void setGood(int good) {
		this.good = good;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public int getDay_diff() {
		return day_diff;
	}

	public void setDay_diff(int day_diff) {
		this.day_diff = day_diff;
	}

	public int getHour_diff() {
		return hour_diff;
	}

	public void setHour_diff(int hour_diff) {
		this.hour_diff = hour_diff;
	}

	public int getPrevIdx() {
		return prevIdx;
	}

	public void setPrevIdx(int prevIdx) {
		this.prevIdx = prevIdx;
	}

	public int getNextIdx() {
		return nextIdx;
	}

	public void setNextIdx(int nextIdx) {
		this.nextIdx = nextIdx;
	}

	public String getPrevTitle() {
		return prevTitle;
	}

	public void setPrevTitle(String prevTitle) {
		this.prevTitle = prevTitle;
	}

	public String getNextTitle() {
		return nextTitle;
	}

	public void setNextTitle(String nextTitle) {
		this.nextTitle = nextTitle;
	}

	public int getReplyCnt() {
		return replyCnt;
	}

	public void setReplyCnt(int replyCnt) {
		this.replyCnt = replyCnt;
	}

	@Override
	public String toString() {
		return "BoardVO [idx=" + idx + ", nickName=" + nickName + ", title=" + title + ", email=" + email
				+ ", homePage=" + homePage + ", content=" + content + ", wDate=" + wDate + ", hostIp=" + hostIp
				+ ", readNum=" + readNum + ", good=" + good + ", mid=" + mid + ", day_diff=" + day_diff + ", hour_diff="
				+ hour_diff + ", prevIdx=" + prevIdx + ", nextIdx=" + nextIdx + ", prevTitle=" + prevTitle
				+ ", nextTitle=" + nextTitle + ", replyCnt=" + replyCnt + "]";
	}
	
	
	
}
