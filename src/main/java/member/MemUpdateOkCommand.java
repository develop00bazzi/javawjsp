package member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemUpdateOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session=request.getSession();
		
		String mid=(String)session.getAttribute("sMid");
		String sNickName=(String)session.getAttribute("sNickName");
		String nickName=request.getParameter("nickName")==null?"":request.getParameter("nickName");
		String name=request.getParameter("name")==null?"":request.getParameter("name");
		String gender=request.getParameter("gender")==null?"":request.getParameter("gender");
		String birthday=request.getParameter("birthday")==null?"":request.getParameter("birthday");
		String tel=request.getParameter("tel")==null?"":request.getParameter("tel");
		String address=request.getParameter("address")==null?"":request.getParameter("address");
		String email=request.getParameter("email")==null?"":request.getParameter("email");
		String homePage=request.getParameter("homePage")==null?"":request.getParameter("homePage");
		String job=request.getParameter("job")==null?"":request.getParameter("job");
		String content=request.getParameter("content")==null?"":request.getParameter("content");
		String userInfor=request.getParameter("userInfor")==null?"":request.getParameter("userInfor");
		
//		취미 전송에 대한 배열 처리
		
		String[] hobbys=request.getParameterValues("hobby");
		
		String hobby="";
		
		if(hobbys.length!=0) {
			for(String strHobby:hobbys) {
				hobby+=strHobby+"/";
			}
		}
		hobby=hobby.substring(0,hobby.lastIndexOf("/"));
		
//		회원 사진이 업로드 되었는지의 여부 처리
		
//		서버에 보통 저장되는 공간을 서버 파일 시스템이라고 칭함.
		
		String fileSystemName="";
		
		String photo=request.getParameter("photo");
		
		if(photo.equals("noimage.jpg")) {
			fileSystemName="noimage.jpg";
		}
		else {
			fileSystemName=photo;
		}
		
//		DB에 저장시, 테이블 설계에서 지정한 각 필드의 길이 체크 처리
		
//		아이디와 닉네임을 다시 한번 중복 체크 처리해준다.
		
		MemberDAO dao=new MemberDAO();
		
		if(!nickName.equals(sNickName)) {
			int resNick=dao.getNickNameCheck(nickName);
			if(resNick==1) {
				request.setAttribute("msg", "nickCheckNo");
				request.setAttribute("url", request.getContextPath()+"/memJoin.mem");
				return;
			}
		}
		
		MemberVO vo=new MemberVO();
		
		vo.setMid(mid);
		
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
		vo.setPhoto(fileSystemName);
		vo.setContent(content);
		vo.setUserInfor(userInfor);
		
		int res=dao.setMemberUpdateOk(vo);
		
		
		if(res==1) {
			request.setAttribute("msg", "memUpdateOk");
			request.setAttribute("url", request.getContextPath()+"/memMain.mem");
			
//			회원 정보 수정 후 새로운 닉네임을 세션에 저장 처리한다.
			session.setAttribute("sNickName", nickName);
		}
		else {
			request.setAttribute("msg", "memUpdateNo");
			request.setAttribute("url", request.getContextPath()+"/memUpdate.mem");
		}
		
	}

}
