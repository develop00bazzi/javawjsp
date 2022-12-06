package pds;

import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import conn.SecurityUtil;

public class PdsInputOkCommand implements PdsInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String realPath=request.getServletContext().getRealPath("/data/pds");
		
		int maxSize=1024*1024*10;
		
		String encoding="UTF-8";
		
		MultipartRequest multipartRequest=new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
//		객체의 개수만큼 있으면 while문을 돌려서 업로드 시킨 멀티파일에 대해서 올린 파일명과 서버에 저장되는 이름을 따로 DB에 저장하기 위한 준비
		
		Enumeration fileNames=multipartRequest.getFileNames();
		
		String originalFileName="";	// 업로드되는 파일명
		String filesystemName="";	// 서버에 저장되는 파일명
		
		
		while(fileNames.hasMoreElements()) {
			
			String file=(String)fileNames.nextElement();
			
			if(multipartRequest.getFilesystemName(file)!=null) {
				originalFileName+=multipartRequest.getOriginalFileName(file)+"/";
				filesystemName+=multipartRequest.getFilesystemName(file)+"/";				
			}
		}
		
		originalFileName=originalFileName.substring(0,originalFileName.length()-1);
		filesystemName=filesystemName.substring(0,filesystemName.length()-1);
		
//		세션에서 닉네임 / 아이디 가져오기
		
		HttpSession session=request.getSession();
		
		String mid=(String)session.getAttribute("sMid");
		String nickName=(String)session.getAttribute("sNickName");
		
//		전송 폼에서 전송된 값들을 모두 받아오기
		
		String listPart=multipartRequest.getParameter("listPart")==null?"전체":multipartRequest.getParameter("listPart");
		String title=multipartRequest.getParameter("title")==null?"":multipartRequest.getParameter("title");
		String content=multipartRequest.getParameter("content")==null?"":multipartRequest.getParameter("content");
		String part=multipartRequest.getParameter("part")==null?"":multipartRequest.getParameter("part");
		String openSw=multipartRequest.getParameter("openSw")==null?"":multipartRequest.getParameter("openSw");
		String pwd=multipartRequest.getParameter("pwd")==null?"":multipartRequest.getParameter("pwd");
		String hostIp=multipartRequest.getParameter("hostIp")==null?"":multipartRequest.getParameter("hostIp");
		int fileSize=multipartRequest.getParameter("fileSize")==null?0:Integer.parseInt(multipartRequest.getParameter("fileSize"));
		
//		입력된 비밀번호를 SHA-256 암호화
		
		SecurityUtil securuty=new SecurityUtil();
		
		pwd=securuty.encryptSHA256(pwd);
		
//		앞에서 전송된 자료와 가공된 자료들을 모두 VO에 담아서 DB에 저장할 수 있도록 한다.
		
		PdsVO vo=new PdsVO();
		
		vo.setMid(mid);
		vo.setNickName(nickName);
		vo.setfName(originalFileName);
		vo.setfSName(filesystemName);
		vo.setfSize(fileSize);
		vo.setTitle(title);
		vo.setPart(part);
		vo.setPwd(pwd);
		vo.setOpenSw(openSw);
		vo.setContent(content);
		vo.setHostIp(hostIp);
		
		PdsDAO dao=new PdsDAO();
		
		int res=dao.setPdsInputOk(vo);
		
		if(res==1) {
			request.setAttribute("msg","pdsInputOk");
			request.setAttribute("url", request.getContextPath()+"/pdsList.pds?part"+listPart);
		}
		else {
			request.setAttribute("msg","pdsInputNo");
			request.setAttribute("url", request.getContextPath()+"/pdsInput.pds?part"+listPart);
		}
	}

}
