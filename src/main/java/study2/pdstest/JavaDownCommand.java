package study2.pdstest;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class JavaDownCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String realPath=request.getServletContext().getRealPath("/data/pdstest/");
		
		String fName=request.getParameter("file");
		
		File file=new File(realPath+fName);
		
//		현재 가져오는 곳은 서버이고 다운로드 하는 곳은 클라이언트인 것 중요함.
		
//		프로토콜 형식에 맞도록 헤더에 정보를 제공해준다.
//		mimeType: 윈도우의 파일 형식(예: 텍스트 파일인지.. 바이너리 파일인지 등등 ) ==> 2진 바이너리 형식으로 전송을 해야 한다.
		
		String mimeType=request.getServletContext().getMimeType(file.toString());
		
		if(mimeType==null) {
			response.setContentType("application/octet-stream");	// 2진 바이너리 형식
		}
		
//		사용하는 브라우저에 대한 정보: 만약에 인터넷 익스플로러(IE)인 경우는 'euc-kr', 나머지 'utf-8'로 전송한다.
		
		String downloadName="";
		
		if(request.getHeader("user-agent").indexOf("MSIE")==-1) {
			downloadName=new String(fName.getBytes("UTF-8"), "8859_1");		// 윈도우의 한글 변환 방식
		}
		else {
			downloadName=new String(fName.getBytes("EUC-KR"), "8859_1");		// 윈도우의 한글 변환 방식			
		}
		
//		헤더 정보를 첨부하여 클라이언트에 전송할 준비를 마친다.
		
		response.setHeader("Content-Disposition", "attachment;filename="+downloadName);
		
//		JAVA에 의해서 실제로 파일을 다운(업)로드 처리 시켜준다.
		
		FileInputStream fis=new FileInputStream(file);
		
//		FileOutputStream fos=new FileOutputStream(nFile);	// 서버에서 서버로 저장하겠다는 개념
		
		ServletOutputStream sos=response.getOutputStream();
		
//		넘어온 파일을 서블릿을 통해서 클라이언트로 보내는 과정
		
//		전송할 객체를 생성 후 실제로 파일을 객체에 담아서 처리시켜준다.
		
		byte[] b=new byte[2048];
		
		int data=0;
		
		while((data=fis.read(b, 0, b.length))!=-1) {
			sos.write(b, 0, data);
		}
		
//		파일을 2byte씩 담아서 파일 다운로드 처리
		
		sos.flush();
		
//		남아있는 잔량까지 뿌린다.
		
		sos.close();
		fis.close();
		
//		자바에서 garbage 컬렉터가 정리를 못 해주므로 해줘야 한다.
	}

}
