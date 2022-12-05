package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import conn.SecurityUtil;

public class MemJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String realPath=request.getServletContext().getRealPath("/data/member");
		int maxSize=1024*1024*20;
		String encoding="UTF-8";
		
		MultipartRequest multipartRequest=new MultipartRequest(request, realPath, maxSize, encoding, new DefaultFileRenamePolicy());
		
		
		String originalFileName=multipartRequest.getOriginalFileName("fName");	// 업로드 시킬때의 업로드 파일명.
		String filesystemName=multipartRequest.getFilesystemName("fName");	// 실제 서버에 저장된 파일명.

		String mid=multipartRequest.getParameter("mid")==null?"":multipartRequest.getParameter("mid");
		String pwd=multipartRequest.getParameter("pwd")==null?"":multipartRequest.getParameter("pwd");
		String nickName=multipartRequest.getParameter("nickName")==null?"":multipartRequest.getParameter("nickName");
		String name=multipartRequest.getParameter("name")==null?"":multipartRequest.getParameter("name");
		String gender=multipartRequest.getParameter("gender")==null?"":multipartRequest.getParameter("gender");
		String birthday=multipartRequest.getParameter("birthday")==null?"":multipartRequest.getParameter("birthday");
		String tel=multipartRequest.getParameter("tel")==null?"":multipartRequest.getParameter("tel");
		String address=multipartRequest.getParameter("address")==null?"":multipartRequest.getParameter("address");
		String email=multipartRequest.getParameter("email")==null?"":multipartRequest.getParameter("email");
		String homePage=multipartRequest.getParameter("homePage")==null?"":multipartRequest.getParameter("homePage");
		String job=multipartRequest.getParameter("job")==null?"":multipartRequest.getParameter("job");
		String content=multipartRequest.getParameter("content")==null?"":multipartRequest.getParameter("content");
		String userInfor=multipartRequest.getParameter("userInfor")==null?"":multipartRequest.getParameter("userInfor");
		
		
//		취미 전송에 대한 배열 처리
		
		String[] hobbys=multipartRequest.getParameterValues("hobby");
		
		String hobby="";
		
		if(hobbys.length!=0) {
			for(String strHobby:hobbys) {
				hobby+=strHobby+"/";
			}
		}
		hobby=hobby.substring(0,hobby.lastIndexOf("/"));
		
		
//		회원 사진이 업로드 되었는지의 여부 처리
		
//		서버에 보통 저장되는 공간을 서버 파일 시스템이라고 칭함.
		
//		String fileSystemName="";
//		
//		String photo=request.getParameter("photo");
		
		if(originalFileName.equals("noimage.jpg")) {
			filesystemName="noimage.jpg";
		}
		else {
			filesystemName=originalFileName;
		}
		
//		DB에 저장시, 테이블 설계에서 지정한 각 필드의 길이 체크 처리
		
//		아이디와 닉네임을 다시 한번 중복 체크 처리해준다.
		
		MemberDAO dao=new MemberDAO();
		
		MemberVO vo=dao.getLoginCheck(mid);
		
		if(vo!=null) {
			request.setAttribute("msg", "idCheckNo");
			request.setAttribute("url", request.getContextPath()+"/memJoin.mem");
			return;
		}
		
		int resNick=dao.getNickNameCheck(nickName);
		
		if(resNick==1) {
			request.setAttribute("msg", "nickCheckNo");
			request.setAttribute("url", request.getContextPath()+"/memJoin.mem");
			return;
		}
		
//		비밀번호 암호화 처리 (SHA256 방식)
		
		SecurityUtil security=new SecurityUtil();
		
		pwd=security.encryptSHA256(pwd);
		
//		모든 체크가 완료되었다면 회원 정보를 VO에 담아서 DB로 넘겨준다.
		
		vo=new MemberVO();
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setNickName(nickName);
		vo.setName(name);
		vo.setGender(gender);
		vo.setBirthday(birthday);
		vo.setTel(tel);
		vo.setAddress(address);
		vo.setEmail(email);
		vo.setHomePage(homePage);
		vo.setJob(job);
		vo.setHobby(hobby);
		vo.setPhoto(filesystemName);
		vo.setContent(content);
		vo.setUserInfor(userInfor);
		
		int resMem=dao.setMemberJoinOk(vo);
		
		if(resMem==1) {
			request.setAttribute("msg", "memJoinOk");
			request.setAttribute("url", request.getContextPath()+"/memLogin.mem");
		}
		else {
			request.setAttribute("msg", "memJoinNo");
			request.setAttribute("url", request.getContextPath()+"/memJoin.mem");
		}
		
		
	}

}
