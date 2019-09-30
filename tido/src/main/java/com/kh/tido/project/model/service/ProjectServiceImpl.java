package com.kh.tido.project.model.service;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.tido.project.model.dao.ProjectDao;
import com.kh.tido.project.model.vo.Project;
import com.kh.tido.project.model.vo.ProjectFile;

@Service("pService")
public class ProjectServiceImpl implements ProjectService {
	@Autowired
	private ProjectDao pDao;
	@Autowired
	private Project project;
	@Autowired
	ProjectFile projectFile;

	@Override
	public int saveProject(ProjectFile projectFile, HttpServletRequest request, String nickname) {

		String projectPath = createFile(projectFile, request, nickname);

		if (projectPath != null) {
			project.setprojectTitle("착신아리");
			project.setProjectWriter("신현");
			project.setProjectPath(projectPath + ".properties");
			int result = pDao.saveProject(project);
			return result;
		}
		return 0;
	}

	@Override
	public ProjectFile openProject(int pNo, HttpServletRequest request, String nickname) {
		String filePath = request.getSession().getServletContext().getRealPath("resources") + "/project/" + nickname
				+ "/" + pDao.openProject(pNo).getProjectPath();

		try {
			Properties prop = new Properties();
			prop.load(new FileReader(filePath));

			projectFile.setBpm(Integer.parseInt(prop.getProperty("bpm")));
			projectFile.setBeat(Integer.parseInt(prop.getProperty("beat")));
			projectFile.setPianoSoundInfo(prop.getProperty("pianoSoundInfo"));
			projectFile.setGuitarSoundInfo(prop.getProperty("guitarSoundInfo"));
			projectFile.setBassSoundInfo(prop.getProperty("bassSoundInfo"));
			projectFile.setDrumSoundInfo(prop.getProperty("drumSoundInfo"));

		} catch (Exception e) {
			e.printStackTrace();
		}

		return projectFile;
	}

	public String createFile(ProjectFile project, HttpServletRequest request, String nickname) {
		// 파일 객체 생성
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\project\\" + nickname;

		// 저장 폴더 선택
		File folder = new File(savePath);

		// 만약 해당 폴더가 없는 경우
		if (!folder.exists()) {
			folder.mkdir(); // 폴더 생성
		}

		String fileName = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");

		fileName = sdf.format(new Date()) + (int) (Math.random() * 100);

		String filePath = folder + "\\" + fileName + ".properties";

		File file = new File(filePath);

		try {
			if (file.createNewFile()) {
				System.out.println("File is created!");

				FileWriter writer = new FileWriter(file);
				writer.write("" + "bpm = " + project.getBpm() + "\n" + "beat = " + project.getBeat() + "\n"
						+ "pianoSoundInfo = " + project.getPianoSoundInfo() + "\n" + "bassSoundInfo = "
						+ project.getBassSoundInfo() + "\n" + "guitarSoundInfo = " + project.getGuitarSoundInfo() + "\n"
						+ "drumSoundInfo = " + project.getDrumSoundInfo());
				writer.close();
				return fileName;
			} else {
				System.out.println("File already exists.");
				return null;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public ArrayList<String> getDirectory(HttpServletRequest request, String nickname) {
		ArrayList<String> pathList = new ArrayList<String>(); 
		String root = request.getSession().getServletContext().getRealPath("resources\\project\\"+nickname);
		pathList =getPathList(root,pathList);
		for(String p :pathList) {
			System.out.println(p);
		}		
		return pathList;
	}

	public ArrayList<String> getPathList(String path,ArrayList<String>pathList) {
		File dir = new File(path);
		File[] fileList = dir.listFiles();
		for (int i = 0; i < fileList.length; i++) {
			
			if (fileList[i].isFile() || fileList[i].isDirectory()) {
				pathList.add(path+"\\"+fileList[i].getName());
			}
		}
	
		return pathList;
	}

}
