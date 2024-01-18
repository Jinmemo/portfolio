	package odi_project.common.controller;
	
	import javax.servlet.RequestDispatcher;
	import javax.servlet.ServletException;
	import javax.servlet.annotation.WebServlet;
	import javax.servlet.http.HttpServlet;
	import javax.servlet.http.HttpServletRequest;
	import javax.servlet.http.HttpServletResponse;
	
	
	
	import odi_project.common.model.service.ImageRandomService;
	import odi_project.common.model.service.ImageRandomServiceImpl;
	import odi_project.common.model.service.ImageService;
	import odi_project.common.model.service.ImageServiceImpl;
	import odi_project.common.model.service.RandomByMemberAddressService;
	import odi_project.common.model.service.RandomByMemberAddressServiceImpl;
	import odi_project.common.model.vo.Image;
	import odi_project.member.model.vo.Member;
	
	import java.io.IOException;
	
	import java.util.List;
	
	@WebServlet("/mainPage.bo") // 
	public class mainPageController extends HttpServlet {
	    private static final long serialVersionUID = 1L;
	
	    public mainPageController() {
	        super();
	    }
	
	    protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        RandomByMemberAddressService randomByMemberAddressService = new RandomByMemberAddressServiceImpl();
	        ImageRandomService imageRandomService = new ImageRandomServiceImpl();
	        ImageService imageService = new ImageServiceImpl();
	        
	
	        try {
	            // 세션 등을 이용하여 로그인 여부 확인
	        	
	
	
	            Image randomByMemberAddress;
	
	            	 // 로그인이 되어 있다면 회원의 주소에 맞는 이미지 주소를 가져옴
	                String memberAddress = getMemberAddressFromSession(request); // 세션에서 회원 주소 가져오기
	                randomByMemberAddress = randomByMemberAddressService.RandomByMemberAddress(memberAddress);
	
	
	
	            // 이미지 정보를 request에 저장
	            request.setAttribute("randomByMemberAddress", randomByMemberAddress);
	
	            // 로그인 여부와 관계없이 화면에 띄울 이미지 주소들
	            List<Image> imageRandomAddress = imageRandomService.ImageRandomAddress();
	            List<Image> imageAddress = imageService.ImageAddress();
	            System.out.println(imageRandomAddress);
	            System.out.println(imageAddress);
	            
	            if (imageRandomAddress.isEmpty() || imageAddress.isEmpty()) {
	//                Image defaultImage = getDefaultImage();
	                Image defaultImage = new Image();
	                defaultImage.setImage("/source/image/img5.png");
	                request.setAttribute("imageRandomAddress", List.of(defaultImage));
	                request.setAttribute("imageAddress", List.of(defaultImage));
	            } else {
	                request.setAttribute("imageRandomAddress", imageRandomAddress);
	                request.setAttribute("imageAddress", imageAddress);
	            }
	
	
	          
	        } catch (Exception e) {
	            // 예외 발생 시 기본 이미지를 사용  defaultImage = "/source/image/img4.png"
	            Image defaultImage = getDefaultImage();  
	            request.setAttribute("randomByMemberAddress", defaultImage);
	            request.setAttribute("imageRandomAddress", List.of(defaultImage));
	            request.setAttribute("imageAddress", List.of(defaultImage));
	            // 표준 에러 출력
	            System.err.println("SQL Exception: " + e.getMessage());
	            e.printStackTrace();
	
	
	        }
	
	        // JSP로 포워딩
	        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/common/mainPage.jsp");
	        dispatcher.forward(request, response);
	    }
	    
	    
	 // 세션에서 회원 로그인 여부
	    private boolean checkLoggedIn(HttpServletRequest request) {
	        // 세션 등을 이용하여 로그인 여부 확인
	        // 실제 프로젝트에서는 세션에서 로그인 정보를 가져와서 확인하는 로직이 들어갈 것
	    	return request.getSession().getAttribute("loginUser") != null;
	    }
	    
	    // 세션에서 회원 주소 가져오기
	    private String getMemberAddressFromSession(HttpServletRequest request) {
	        // 세션에서 회원 주소를 가져오는 로직을 작성
	        // 실제로는 세션에서 값을 가져오거나, 로그인 정보 등을 기반으로 회원의 주소를 결정하는 로직이 들어갈 것
	        // 여기서는 가상의 값을 리턴하도록 작성
	    	String memberAddress = null;
	        Member loggedInUser = (Member) request.getSession().getAttribute("loginUser");
	        if (loggedInUser != null) {
	            // 세션에서 로그인된 사용자 정보를 가져와서 주소를 얻어올 수 있도록 작성
	            memberAddress = loggedInUser.getAddress();
	        } else {
	            // 로그인이 되어 있지 않은 경우 가상의 주소를 리턴
	            memberAddress = "서울특별시";
	        }
	        return memberAddress;
	    }
	
	    private Image getDefaultImage() {
	        Image defaultImage = new Image();
	        defaultImage.setImage("/source/image/img4.png");
	        return defaultImage;
	    }
	
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        // doPost 내용 추가
	    }
	    
	    
	}