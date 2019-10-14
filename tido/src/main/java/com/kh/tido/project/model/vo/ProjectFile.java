package com.kh.tido.project.model.vo;

import org.springframework.stereotype.Component;

@Component("projectFile")
public class ProjectFile {
	private int bpm;
	private int beat;
	private String pianoSoundInfo;
	private String bassSoundInfo;
	private String guitarSoundInfo;
	private String drumSoundInfo;
	private String projectTitle;
	public ProjectFile() {
		// TODO Auto-generated constructor stub
	}
	public ProjectFile(int bpm, int beat, String pianoSoundInfo, String bassSoundInfo, String guitarSoundInfo,
			String drumSoundInfo, String projectTitle) {
		super();
		this.bpm = bpm;
		this.beat = beat;
		this.pianoSoundInfo = pianoSoundInfo;
		this.bassSoundInfo = bassSoundInfo;
		this.guitarSoundInfo = guitarSoundInfo;
		this.drumSoundInfo = drumSoundInfo;
		this.projectTitle = projectTitle;
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
	public String getProjectTitle() {
		return projectTitle;
	}
	public void setProjectTitle(String projectTitle) {
		this.projectTitle = projectTitle;
	}
	@Override
	public String toString() {
		return "ProjectFile [bpm=" + bpm + ", beat=" + beat + ", pianoSoundInfo=" + pianoSoundInfo + ", bassSoundInfo="
				+ bassSoundInfo + ", guitarSoundInfo=" + guitarSoundInfo + ", drumSoundInfo=" + drumSoundInfo
				+ ", projectTitle=" + projectTitle + "]";
	}

	
	
	
}
