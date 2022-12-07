package pds;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PdsTotalDownCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int idx=request.getParameter("idx")==null?0:Integer.parseInt(request.getParameter("idx"));
		
		PdsDAO dao=new PdsDAO();
		PdsVO vo=dao.getIdxSearch(idx);
		
		String[] fSNames=vo.getfSName().split("/");
		String[] fNames=vo.getfName().split("/");
		
//		파일 압축에 필요한 객체 선언
		
		FileInputStream fis=null;
		FileOutputStream fos=null;
		ZipOutputStream zos=null;
		ServletOutputStream sos=null;	// 클라이언트에 전송하기 위해 선언
		
		String realPath=request.getServletContext().getRealPath("/data/pds/");

//		실제 파일의 경로를 읽어들이는 위치
		
		String zipPath=request.getServletContext().getRealPath("/data/pds/temp/");
		
//		파일을 압축시켜서 저장시키는 위치
		
		String zipName=vo.getTitle()+".zip";
		
		fos=new FileOutputStream(zipPath+zipName);
		
		zos=new ZipOutputStream(fos);
		
//		파일의 제목은 글의 제목 + 확장자 (.zip)
		
		byte[] b=new byte[2048];
		
		int data=0;
		
//		준비 작업 끝 ===============================
		
		for(int i=0; i<fNames.length; i++) {
			
			File file=new File(realPath+fSNames[i]);	// 실제 파일 가져오기
			
//			File copyAndRename=new File(realPath+fSNames[i]);	// ZIP에 들어갈 업로드할때의 진짜 이름 가져오기
//			
//			file.renameTo(copyAndRename);	// copyAndRename을 file로 재정의
//			
//			fis=new FileInputStream(copyAndRename);
			
			fis=new FileInputStream(file);
			
			zos.putNextEntry(new ZipEntry(fNames[i]));
			
			while((data=fis.read(b,0,b.length))!=-1) {
				zos.write(b,0,data);
			}
			zos.flush();	// 찌꺼기 제거
			zos.closeEntry();	// ZIP 껍데기 안에 파일 껍데기만 닫기
			fis.close();	// FIS 객체 반납
		}
		
		zos.close();	// ZIP 껍데기 닫기
		
//		서버에서 압축작업이 완료되면, 압축파일을 클라이언트로 전송하고, 서버에 압축되어 있는 파일을 삭제한다.
		
//		전송 프로토콜인 http 헤더에 필요한 정보를 알려준다.
		
		String mimeType=request.getServletContext().getMimeType(zipName.toString());
		
		if(mimeType==null) {
			response.setContentType("application/octet-stream");	// 2진 바이너리 형식
		}
		
		String downloadName="";
		
		if(request.getHeader("user-agent").indexOf("MSIE")==-1) {
			downloadName=new String(zipName.getBytes("UTF-8"), "8859_1");		// 윈도우의 한글 변환 방식
		}
		else {
			downloadName=new String(zipName.getBytes("EUC-KR"), "8859_1");		// 윈도우의 한글 변환 방식			
		}
		
//		헤더 정보를 가지고 서버의 ZIP 파일을 클라이언트에 전송 처리한다.
		
		response.setHeader("Content-Disposition", "attachment;filename="+downloadName);
		
//		JAVA로 실제 파일을 클라이언트로 다운로드 처리 한다.
		
		fis=new FileInputStream(zipPath+zipName);
		sos=response.getOutputStream();
		
		while((data=fis.read(b,0,b.length))!=-1) {
			sos.write(b,0,data);
		}
		
		sos.flush();
		sos.close();
		fis.close();
		
//		이곳까지가 클라이언트로 전송완료 처리
		
//		서버에 존재하는 temp/ZIP 파일을 삭제 처리한다.
		
		new File(zipPath+zipName).delete();
		
//		다운로드 횟수를 증가처리한다.
		
		dao.setPdsDownNum(idx);
		
		
	}

}
