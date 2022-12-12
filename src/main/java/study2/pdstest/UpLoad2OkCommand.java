package study2.pdstest;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import study2.StudyInterface;

public class UpLoad2OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String realPath=request.getServletContext().getRealPath("/data/pdstest");
		
		int maxSize=1024*1024*10;
		
		String encoding="UTF-8";
		
		MultipartRequest multipartRequest=new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
//		데이터를 열거형 타입으로 받는다.
		
//		Enumeration e=multipartRequest.getParameterNames(); (X)
		
//		Enumeration e=multipartRequest.getFileNames(); (O)
//		
//		while(e.hasMoreElements()) {
//			String name=(String)e.nextElement();
//			System.out.println("name: "+name);
//			
//		}
		
		Enumeration fileNames=multipartRequest.getFileNames();
		
//		객체에 들어있는 파일들을 가져오기 위한 과정
		
		String file="";
		String originalFileName="";
		String fileSystemName="";
		
		while(fileNames.hasMoreElements()) {
			file=(String)fileNames.nextElement();	// 업로드시의 폼태그 안의 필드 네임(name)
			originalFileName=multipartRequest.getOriginalFileName(file);
			fileSystemName=multipartRequest.getFilesystemName(file);
			System.out.println("업로드 시의 원본 파일명: "+originalFileName);
			System.out.println("서버에 저장된 실제 파일명: "+fileSystemName);
		}
		
		if(fileSystemName.equals("")) {
			request.setAttribute("msg", "upLoad1No");
		}
		else {
			request.setAttribute("msg", "upLoad1Ok");
		}
		
		int upLoadFlag=multipartRequest.getParameter("upLoadFlag")==null?2:Integer.parseInt(multipartRequest.getParameter("upLoadFlag"));
		
		if(upLoadFlag==2) {
			request.setAttribute("url",request.getContextPath()+"/pdstest/upLoad2.st");			
		}
		else if(upLoadFlag==3){
			request.setAttribute("url",request.getContextPath()+"/pdstest/upLoad3.st");			
		}
		else if(upLoadFlag==4){
			request.setAttribute("url",request.getContextPath()+"/pdstest/upLoad4.st");			
		}

	}

}
