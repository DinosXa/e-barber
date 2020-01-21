
//t8170101,t8170192 (για όλα)

package login_classes;

public class Report {
	private int rpid;
	private String subject;
	private String report;
	private BarbershopUser bid;

	//1st CONSTRUCTOR
	public Report(int rpid, String subject, String report, BarbershopUser bid) {
		this.rpid = rpid;
		this.subject = subject;
		this.report = report;
		this.bid = bid;
	}

	public int getrpid() {
		return rpid;
	}
	public void setrpid(int rpid) {
		this.rpid = rpid;
	}

	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getReport() {
		return report;
	}
	public void setReport(String report) {
		this.report= report;
	}

	public BarbershopUser getBarbershop() {
		return bid;
	}
	public void setBarbershop(BarbershopUser bid) {
		this.bid = bid;
	}
	@Override
	public String toString() {

		return "<ul>"
				+ "<li>report id = " + rpid + "</li>"
				+ "<li>subject = " + subject + "</li>"
				+ "<li>report = " + report + "</li>"
				+ "<li>barbershop id = " + bid + "</li>"
				+ "</ul>";
	}

}
