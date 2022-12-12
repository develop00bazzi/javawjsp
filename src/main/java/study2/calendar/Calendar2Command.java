package study2.calendar;

import java.io.IOException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import study2.StudyInterface;

public class Calendar2Command implements StudyInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
//		오늘 날짜 처리 (저장)
		
		Calendar calToday=Calendar.getInstance();	// 메모리에 로딩 시켜놓은걸 불러 쓰기
		
		int toYear=calToday.get(Calendar.YEAR);
		int toMonth=calToday.get(Calendar.MONTH);
		int toDay=calToday.get(Calendar.DATE);
		
//		화면에 보여줄 해당 '년/월'을 설정해준다.
		
		Calendar calView=Calendar.getInstance();
		
		int yy=	request.getParameter("yy")==null?calView.get(Calendar.YEAR):Integer.parseInt(request.getParameter("yy"));
		int mm=	request.getParameter("mm")==null?calView.get(Calendar.MONTH):Integer.parseInt(request.getParameter("mm"));
		
//		앞에서 넘어온 변수(yy,mm) 값이 '1월'이거나, '12월'이라면 아래와 같이 편집한다. 1월은 '0', 12월은 '11'로 넘어옴 주의
		
		if(mm<0) {
			yy--;
			mm=11;
		}
		if(mm>11) {
			yy++;
			mm=0;
		}
		
//		해당 '년 / 월' 의 1일을 기준으로 달력의 시작 날짜를 세팅시켜준다.
		
		calView.set(yy,mm,1);
		
//		앞에서 세팅한 해당 '년/월'의 1일에 해당하는 요일 값을 숫자로 가져온다. (일:1, 월:2, 화:3, ---)
		
		int startWeek=calView.get(Calendar.DAY_OF_WEEK);	// 해당 월의 시작일을 요일로 출력해준다.
		
//		System.out.println("해당 월의 첫번째 1의 요일을 숫자로 반환한 결과는? "+startWeek);
		
		int lastDay=calView.getActualMaximum(Calendar.DAY_OF_MONTH);	// 해당 월의 마지막 날짜를 계산해주는 함수
		
//		System.out.println("해당 월의 마지막 날은? "+lastDay);
		
//		출력된 달력의 '앞/뒤' 공백 칸에 '이전/다음'의 날짜를 채우기 위한 작업
		
		int prevYear=yy;
		int prevMonth=(mm)-1;
		int nextYear=yy;
		int nextMonth=(mm)+1;
		
		if(prevMonth==-1) {
			prevYear--;
			prevMonth=11;
		}
		if(nextMonth==12) {
			nextYear++;
			nextMonth=0;
		}
		
//		현재 월의 이전 월의 마지막 날짜를 가져온다.
		
		Calendar calPrev=Calendar.getInstance();
		
		calPrev.set(prevYear, prevMonth, 1);
		int prevMonthLastDay=calPrev.getActualMaximum(Calendar.DAY_OF_MONTH);
		
//		다음 월의 1일에 해당하는 요일의 숫자값을 가져온다.
		
		Calendar calNext=Calendar.getInstance();
		
		calNext.set(nextYear, nextMonth,1);
		
		int nextMonthStartWeek=calNext.get(Calendar.DAY_OF_WEEK);
		
//		화면에 보여줄 달력의 해당 내역을 저장소에 저장한다.
		
		request.setAttribute("yy", yy);
		request.setAttribute("mm", mm);
		
		request.setAttribute("startWeek", startWeek);
		request.setAttribute("lastDay", lastDay);
		
//		오늘 날짜를 저장소에 담아서 넘겨준다.
		
		request.setAttribute("toYear", toYear);
		request.setAttribute("toMonth", toMonth);
		request.setAttribute("toDay", toDay);
		
//		이전 월의 마지막 날짜와 다음 월의 시작하는 요일을 저장소에 담아서 넘겨준다.
		
		request.setAttribute("prevYear", prevYear);
		request.setAttribute("prevMonth", prevMonth);
		request.setAttribute("nextYear", nextYear);
		request.setAttribute("nextMonth", nextMonth);
		
		request.setAttribute("prevMonthLastDay", prevMonthLastDay);
		request.setAttribute("nextMonthStartWeek", nextMonthStartWeek);

	}

}
