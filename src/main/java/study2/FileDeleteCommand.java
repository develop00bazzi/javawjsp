package study2;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileDeleteCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		String fName=request.getParameter("file")==null?"":request.getParameter("file");
		String fName=request.getParameter("file");
		
		String realPath=request.getServletContext().getRealPath("/data/pdstest/");
		
//		파일을 이동 삭제 뭐시기 저시기 등등 다 할때는 무조건 파일 객체를 생성해야 한다.
		
		File file=new File(realPath+fName);
		
		String res="0";
		
		if(file.exists()) {
			file.delete();
			res="1";
		}
		
		response.getWriter().write(res);
	}

}
