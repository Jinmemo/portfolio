package odi_project.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import odi_project.member.model.service.MemberServiceImpl;
import odi_project.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.me")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("loginUser") == null) { // 로그인 정보가 없다? 로그인전.
			session.setAttribute("alertMsg", "로그인 후 이용해주세요"); // alert 팝업창 추가
			response.sendRedirect(request.getContextPath());
		} else {
			request.setAttribute("loginUser", session.getAttribute("loginUser"));
			//System.out.println(session.getAttribute("loginUser"));
			request.getRequestDispatcher("WEB-INF/views/member/login/memberUpdate.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		  String memberName = request.getParameter("memberName"); 
		  String phone = request.getParameter("phone");
		  
		   String emailPrefix = request.getParameter("emailPrefix"); // 이메일 앞부분
		    String emailSuffix = request.getParameter("emailSuffix"); //이메일 뒷부분
		    String email = null;
		    
		    //이메일이 null이 아닌 경우에만 처리
		    if(emailPrefix != null && emailSuffix != null) {
		    	email = emailPrefix + "@" + emailSuffix;
		    }else {
		    	// 이메일이 null일 경우에 조취
		    	request.setAttribute("error", "이메일을 입력하세요");
		    } 
		    
		 // 주소    
		    String postcode = request.getParameter("postcode");
	        String basicAddress = request.getParameter("address");
	        String detailAddress = request.getParameter("detailAddress");
	        String extraAddress = request.getParameter("extraAddress");
		    	    
		 // StringBuilder를 사용하여 주소를 조합
		    StringBuilder addressBuilder = new StringBuilder();

		    if (postcode != null && !postcode.isEmpty()) {
		        addressBuilder.append(postcode).append(" , ");
		    }

		    if (basicAddress != null && !basicAddress.isEmpty()) {
		        addressBuilder.append(basicAddress).append(" , ");
		    }

		    if (detailAddress != null && !detailAddress.isEmpty()) {
		        addressBuilder.append(detailAddress).append(" , ");
		    }

		    if (extraAddress != null && !extraAddress.isEmpty()) {
		        addressBuilder.append(extraAddress);
		    }
		    // 주소 변수에 저장
		    String address = addressBuilder.toString();
		  
		 // session에서 loginUser내에 있는 id값 가져오기
			HttpSession session = request.getSession();
			
			String memberId = ((Member)session.getAttribute("loginUser")).getMemberId();
		    
		  
		  String aboutMe = request.getParameter("aboutMe");
		  
		  Member m = Member.builder()
		  .memberId(memberId)
		  .memberName(memberName)
		  .phone(phone)
		  .email(email)
		  .address(address)
		  .aboutMe(aboutMe)
		  .build();
		  
		  int myPageMem = new MemberServiceImpl().MemberUpdate(m);
		  
		  if(myPageMem > 0) {
			  Member m1 = Member.builder()
					  .memberId(memberId)
					  .build();
			  Member updatedMember = new MemberServiceImpl().getMemberById(m1);
			  session.setAttribute("loginUser", updatedMember);
			  response.sendRedirect(request.getContextPath() + "/myPage.me");
		  } else {
			  System.out.println("에러");
		  }
		
		
	}

}
