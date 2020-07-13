package com.koreait;

public class SearchDTO {
	private int mc_idx;
	private String mc_imageurl;
	public int getMc_idx() {
		return mc_idx;
	}
	public void setMc_idx(int mc_idx) {
		this.mc_idx = mc_idx;
	}
	public String getMc_imageurl() {
		return mc_imageurl;
	}
	public void setMc_imageurl(String mc_imageurl) {
		this.mc_imageurl = mc_imageurl;
	}
	@Override
	public String toString() {
		return "SearchDTO [mc_idx=" + mc_idx + ", mc_imageurl=" + mc_imageurl + "]";
	}
}
