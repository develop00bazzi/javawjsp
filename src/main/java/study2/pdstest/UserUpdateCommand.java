package study2.pdstest;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;
import study2.ajax.UserDAO;
import study2.ajax.UserVO;

public class UserUpdateCommand implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String mid=request.getParameter("mid")==null?"":request.getParameter("mid");
		String name=request.getParameter("name")==null?"":request.getParameter("name");
		int age=request.getParameter("age")==null?0:Integer.parseInt(request.getParameter("age"));
		String address=request.getParameter("address")==null?"":request.getParameter("address");
		
		UserVO vo=new UserVO();
		
		vo.setMid(mid);
		vo.setName(name);
		vo.setAge(age);
		vo.setAddress(address);
		
		UserDAO dao=new UserDAO();
		
		String res=dao.setUserUpdate(vo);
		
		response.getWriter().write(res);

	}

}
