package com.kh.tido.project.model.vo;

import java.sql.Date;

public class Project {
	
	private int pNo;
	private String songTitle;
	private String songWriter;
	private String pianoSoundInfo;
	private String bassSoundInfo;
	private String guitarSoundInfo;
	private String drumSoundInfo;
	private int bpm;
	private int beat;
	private Date pCreateDate;
	private Date pModifyDate;
	private char pStatus;
	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Project(int pNo, String songWriter, String pianoSoundInfo, String bassSoundInfo, String guitarSoundInfo,
			String drumSoundInfo, int bpm, int beat, Date pCreateDate, Date pModifyDate, char pStatus) {
		super();
		this.pNo = pNo;
		this.songWriter = songWriter;
		this.pianoSoundInfo = pianoSoundInfo;
		this.bassSoundInfo = bassSoundInfo;
		this.guitarSoundInfo = guitarSoundInfo;
		this.drumSoundInfo = drumSoundInfo;
		this.bpm = bpm;
		this.beat = beat;
		this.pCreateDate = pCreateDate;
		this.pModifyDate = pModifyDate;
		this.pStatus = pStatus;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getSongWriter() {
		return songWriter;
	}
	public void setSongWriter(String songWriter) {
		this.songWriter = songWriter;
	}
	public String getPianoSoundInfo() {
		return pianoSoundInfo;
	}
	public void setPianoSoundInfo(String pianoSoundInfo) {
		this.pianoSoundInfo = pianoSoundInfo;
	}
	public String getBassSoundInfo() {
		return bassSoundInfo;
	}
	public void setBassSoundInfo(String bassSoundInfo) {
		this.bassSoundInfo = bassSoundInfo;
	}
	public String getGuitarSoundInfo() {
		return guitarSoundInfo;
	}
	public void setGuitarSoundInfo(String guitarSoundInfo) {
		this.guitarSoundInfo = guitarSoundInfo;
	}
	public String getDrumSoundInfo() {
		return drumSoundInfo;
	}
	public void setDrumSoundInfo(String drumSoundInfo) {
		this.drumSoundInfo = drumSoundInfo;
	}
	public int getBpm() {
		return bpm;
	}
	public void setBpm(int bpm) {
		this.bpm = bpm;
	}
	public int getBeat() {
		return beat;
	}
	public void setBeat(int beat) {
		this.beat = beat;
	}
	public Date getpCreateDate() {
		return pCreateDate;
	}
	public void setpCreateDate(Date pCreateDate) {
		this.pCreateDate = pCreateDate;
	}
	public Date getpModifyDate() {
		return pModifyDate;
	}
	public void setpModifyDate(Date pModifyDate) {
		this.pModifyDate = pModifyDate;
	}
	public char getpStatus() {
		return pStatus;
	}
	public void setpStatus(char pStatus) {
		this.pStatus = pStatus;
	}
	@Override
	public String toString() {
		return "Project [pNo=" + pNo + ", songWriter=" + songWriter + ", pianoSoundInfo=" + pianoSoundInfo
				+ ", bassSoundInfo=" + bassSoundInfo + ", guitarSoundInfo=" + guitarSoundInfo + ", drumSoundInfo="
				+ drumSoundInfo + ", bpm=" + bpm + ", beat=" + beat + ", pCreateDate=" + pCreateDate + ", pModifyDate="
				+ pModifyDate + ", pStatus=" + pStatus + "]";
	}
	
	
}
