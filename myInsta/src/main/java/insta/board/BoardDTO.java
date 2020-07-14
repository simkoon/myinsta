package insta.board;

public class BoardDTO {
	private int mcIdx;
	private String mcUserid;
	private String mcContent;
	private String mcRegdate;
	private String mcTaggedid;
	private String mcFilepath;
	private String mcFileoriginame;
	
	public int getMcIdx() {
		return mcIdx;
	}
	public void setMcIdx(int mcIdx) {
		this.mcIdx = mcIdx;
	}
	public String getMcUserid() {
		return mcUserid;
	}
	public void setMcUserid(String mcUserid) {
		this.mcUserid = mcUserid;
	}
	public String getMcContent() {
		return mcContent;
	}
	public void setMcContent(String mcContent) {
		this.mcContent = mcContent;
	}
	public String getMcRegdate() {
		return mcRegdate;
	}
	public void setMcRegdate(String mcRegdate) {
		this.mcRegdate = mcRegdate;
	}
	public String getMcTaggedid() {
		return mcTaggedid;
	}
	public void setMcTaggedid(String mcTaggedid) {
		this.mcTaggedid = mcTaggedid;
	}
	public String getMcFilepath() {
		return mcFilepath;
	}
	public void setMcFilepath(String mcFilepath) {
		this.mcFilepath = mcFilepath;
	}
	public String getMcFileoriginame() {
		return mcFileoriginame;
	}
	public void setMcFileoriginame(String mcFileoriginame) {
		this.mcFileoriginame = mcFileoriginame;
	}
	@Override
	public String toString() {
		return "BoardDTO [mcIdx=" + mcIdx + ", mcUserid=" + mcUserid + ", mcContent=" + mcContent + ", mcRegdate="
				+ mcRegdate + ", mcTaggedid=" + mcTaggedid + ", mcFilepath=" + mcFilepath + ", mcFileoriginame="
				+ mcFileoriginame + "]";
	}

	
}
