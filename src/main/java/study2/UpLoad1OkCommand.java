package study2;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class UpLoad1OkCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String fName=request.getParameter("fName")==null?"":request.getParameter("fName");	// url 방식으로 넘길 시 받을 수 있음
//		2진 방식의 자료를 URL 자료 방식으로 넘겨버리면 넘어가지를 않는다.
//		System.out.println("pdstest에서 넘어온 파일명? "+fName);
		
//		COS 라이브러리에서 제공해주는 객체 MultipartRequest() / DefaultFileRenamePolicy()를 사용하면 알아서 중복 처리해서 저장해준다.
		
//		MultipartRequest(저장소명(request), "서버에 저장될 파일의 경로", "서버에 저장될 파일의 최대 용량","코드 변환 방식(인코딩 방식)", 기타 옵션(중복 방지를 위한 클래스))
		
//		ServletContext application=request.getServletContext();
//		
//		String realPath=application.getRealPath(null);
		
//		getRealPath를 사용하려면 ServletContext에서 가져와야 한다.
		
		String realPath=request.getServletContext().getRealPath("/data/pdstest");
		
//		지정된 경로에서 찾아준다는 의미로 꼭 이렇게 지정해주어야 한다.
		
//		System.out.println("realPath: "+realPath);
		
		int maxSize=1024*1024*10;	// 서버에 저장할 파일의 최대 용량 10MB (1회 저장)
		
		String encoding="UTF-8";
		
		MultipartRequest multipartRequest=new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
//		파일 서버에 업로드 처리 끝
		
//		업로드된 파일의 정보를 추출
		
		String originalFileName=multipartRequest.getOriginalFileName("fName");	// 업로드 시킬때의 업로드 파일명.
		String filesystemName=multipartRequest.getFilesystemName("fName");	// 실제 서버에 저장된 파일명.
		
		System.out.println("원본 파일명: "+originalFileName);
		System.out.println("파일이 저장될 서버의 실제 경로명 "+realPath);
		System.out.println("서버에 저장되는 실제 파일명: "+filesystemName);
		
		if(filesystemName==null) {
			request.setAttribute("msg", "upLoad1No");
		}
		else {
			request.setAttribute("msg", "upLoad1Ok");
		}
		
		request.setAttribute("msg","upLoad1Ok");
		request.setAttribute("url",request.getContextPath()+"/pdstest/upLoad1.st");
	}

}
