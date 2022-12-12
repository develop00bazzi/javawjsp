package study2.pdstest;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class DownloadCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String realPath=request.getServletContext().getRealPath("/data/pdstest");
		
//		File file=new File("atom.txt"); 한개 파일의 껍데기를 만들때 하는 과정
		
		String[] files=new File(realPath).list();
		
		for(String fileList:files) {
			System.out.println("file: "+fileList);
		}
		
		request.setAttribute("files", files);
	}

}
