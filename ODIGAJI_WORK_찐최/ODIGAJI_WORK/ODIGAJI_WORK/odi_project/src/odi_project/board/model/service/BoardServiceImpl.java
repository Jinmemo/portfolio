package odi_project.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import odi_project.board.model.dao.BoardDao;
import odi_project.board.model.vo.Board;
import odi_project.board.model.vo.Category;
import odi_project.board.model.vo.DinnerCafe;
import odi_project.board.model.vo.FriendReply;
import odi_project.board.model.vo.FriendWith;
import odi_project.board.model.vo.Reply;
import odi_project.board.model.vo.TravelFestival;
import odi_project.board.model.vo.TravelFriendBoard;
import odi_project.board.model.vo.TravelFriendCategory;
import odi_project.board.model.vo.WishListDinner;
import odi_project.board.model.vo.WishListTravel;
import odi_project.common.model.vo.PageInfo;
import odi_project.common.model.vo.TFPageInfo;
import odi_project.common.template.Template;

public class BoardServiceImpl implements BoardService {
	
	private BoardDao boardDao = new BoardDao();
	private TravelFestival tf = new TravelFestival();
	
	
	// 일반-공지게시판 service

	@Override
	public int selectListCount() {
		SqlSession sqlSession = Template.getSqlSession();

		int listCount = boardDao.selectListCount(sqlSession);

		sqlSession.close();

		return listCount;
	}

	// 일반게시판 리스트
	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		SqlSession session = Template.getSqlSession();

		ArrayList<Board> list = boardDao.selectList(session, pi);

		session.close();

		return list;
	}

	// 공지사항 리스트
	@Override
	public ArrayList<Board> noticeSelectList(PageInfo pi) {
		SqlSession session = Template.getSqlSession();

		ArrayList<Board> list = boardDao.noticeSelectList(session, pi);

		session.close();

		return list;
	}

	// 일반게시판 검색
	@Override
	public ArrayList<Board> searchBoardList(HashMap<String, String> map, PageInfo pi) {
		SqlSession session = Template.getSqlSession();

		ArrayList<Board> list = boardDao.searchList(session, map, pi);

		session.close();

		return list;
	}

	@Override
	public int increaseCount(int bno) {
		SqlSession session = Template.getSqlSession();

		int result = boardDao.increaseCount(session, bno);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();

		return result;
	}

	@Override
	public Board selectBoard(int bno) {
		SqlSession session = Template.getSqlSession();

		Board b = boardDao.selectBoard(session, bno);

		session.close();

		return b;
	}

	@Override
	public Board noticeSelectBoard(int bno) {
		SqlSession session = Template.getSqlSession();

		Board b = boardDao.noticeSelectBoard(session, bno);

		session.close();

		return b;
	}

	// 검색 시 페이징처리
	@Override
	public int commonsearchlist(HashMap<String, String> map) {
		SqlSession session = Template.getSqlSession();

		int result = boardDao.commonsearchlist(session, map);

		session.close();

		return result;
	}

	@Override
	public int insertReply(Reply reply) {
		SqlSession session = Template.getSqlSession();

		int result = boardDao.insertReply(session, reply);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}

		session.close();

		return result;
	}
	
	@Override
	public int noticeInsertReply(Reply reply) {
		SqlSession session = Template.getSqlSession();

		int result = boardDao.noticeInsertReply(session, reply);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}

		session.close();

		return result;
	}

	@Override
	public int insertBoard(Board board) {
		SqlSession session = Template.getSqlSession();

		int result = boardDao.insertBoard(session, board);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}

		session.close();

		return result;
	}

	@Override
	public int noticeInsertBoard(Board board) {
		SqlSession session = Template.getSqlSession();

		int result = boardDao.noticeInsertBoard(session, board);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}

		session.close();

		return result;
	}

	@Override
	public int deleteBoard(Board board) {
		SqlSession session = Template.getSqlSession();

		int result = boardDao.deleteBoard(session, board);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}

		session.close();

		return result;
	}
	
	@Override
	public int noticeDeleteBoard(Board board) {
		SqlSession session = Template.getSqlSession();

		int result = boardDao.noticeDeleteBoard(session, board);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}

		session.close();

		return result;
	}


	@Override
	public int updateBoard(Board board) {
		SqlSession session = Template.getSqlSession();

		int result = boardDao.updateBoard(session, board);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}

		session.close();

		return result;
	}
	
	@Override
	public int noticeUpdateBoard(Board board) {
		SqlSession session = Template.getSqlSession();

		int result = boardDao.noticeUpdateBoard(session, board);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}

		session.close();

		return result;
	}

	@Override
	public int updateReply(Reply reply) {
		SqlSession session = Template.getSqlSession();

		int result = boardDao.updateReply(session, reply);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}

		session.close();

		return result;
	}
	
	@Override
	public int noticeUpdateReply(Reply reply) {
		SqlSession session = Template.getSqlSession();

		int result = boardDao.noticeUpdateReply(session, reply);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}

		session.close();

		return result;
	}

	@Override
	public int deleteReply(Reply reply) {
		SqlSession session = Template.getSqlSession();

		int result = boardDao.deleteReply(session, reply);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}

		session.close();

		return result;
	}
	
	@Override
	public int noticeDeleteReply(Reply reply) {
		SqlSession session = Template.getSqlSession();

		int result = boardDao.noticeDeleteReply(session, reply);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}

		session.close();

		return result;
	}
	
	//현진끝
	
	// 현영--------------------
	
//	동행게시판 작성 카테고리 불러오기
	public ArrayList<Category> selectFriendCategoryList() {
		SqlSession session = Template.getSqlSession();
		
		ArrayList<Category> list = boardDao.selectFriendCategoryList(session);
		
		session.close();
		
		return list;
	}
	
	
// 동행게시판 Friend 테이블 추가(게시판 추가)
	public int InsertFriendBoard(TravelFriendBoard tfb) {
		SqlSession session = Template.getSqlSession();
		
		int result  = boardDao.InsertFriendBoard(session, tfb);
		
		if(result > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}
	


//  동행게시글 검색 결과 목록을 가져오는 클래스
		public ArrayList<TravelFriendBoard> selectSearchFriendList(HashMap<String, String> map){
		SqlSession session = Template.getSqlSession();
		
		ArrayList<TravelFriendBoard> list = boardDao.selectSearchFriendList(session, map);
		
		session.close();
		
		return list;
	}
	

//	동행게시글 모달 검색 리스트
	public ArrayList<TravelFriendBoard> selectSearchModalList(HashMap<String, String> map) {
		SqlSession session = Template.getSqlSession();
		
		ArrayList<TravelFriendBoard> list = boardDao.selectSearchModalList(session, map);

		
		session.close();
		
		return list;
	}
	
//	동행게시글 상세페이지
	public TravelFriendCategory friendDetailView(int fboardNo) {
		SqlSession session = Template.getSqlSession();
		TravelFriendCategory tfc = boardDao.friendDetailView(session, fboardNo);
		session.close();
		
		return tfc;
	}
	
//	동행게시글 수정페이지
	public int updateFriendBoard(TravelFriendCategory tfc) {
		SqlSession session = Template.getSqlSession();
		
		int result = boardDao.updateFriendBoard(session, tfc);
		
		if(result > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}
	
//	동행게시글 삭제페이지
	public int deleteFriendBoard(int fboardNo) {
		SqlSession session = Template.getSqlSession();
		
		int result = boardDao.deleteFriendBoard(session, fboardNo);
		
		if(result > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}
	
//	동행게시글 댓글 추가
	public int insertFriendReply(FriendReply fr) {
		SqlSession session = Template.getSqlSession();
		
		int result = boardDao.insertFriendReply(session, fr);
		
		if(result > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}
	
	// 동행 댓글불러오기
	public ArrayList<FriendReply> selectFriendReplyList() {
		SqlSession session = Template.getSqlSession();
		
		ArrayList<FriendReply> replyList = boardDao.selectFriendReplyList(session);
		
		session.close();
		
		return replyList;
	}
	
	// 동행게시글 동행 수락
	public int insertFriendWith(FriendWith fw) {
		SqlSession session = Template.getSqlSession();
		
		int result = boardDao.insertFriendWith(session, fw);
		
		if(result > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}
	
	// 동행게시글 동행 취소
	public int deleteFriendWith(FriendWith fw) {
		SqlSession session = Template.getSqlSession();
		
		int result = boardDao.deleteFriendWith(session, fw);
		
		if(result > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}

	// 동행게시판 동행 수락/취소 버튼 세션 유지 
	public String checkCompanionStatus(int fboardNo, String memberId) {
		SqlSession session = Template.getSqlSession();
		Map<String, Object> parameters = new HashMap<>();
	    parameters.put("fboardNo", fboardNo);
	    parameters.put("memberId", memberId);
        
	    String status = boardDao.checkCompanionStatus(session, parameters);
        
        
        session.close();
        return status;
	}
	
	// 마이페이지 동행 수락 대기
	@Override
	public ArrayList<FriendWith> selectMyPageAccept(String memberId) {
		SqlSession session = Template.getSqlSession();
		
		ArrayList<FriendWith> fwList  = boardDao.selectMyPageAccept(session, memberId);
		
		session.close();
		
		return fwList;
	}
	

	// 동행게시판 댓글 수정
	public int updateFriendReply(FriendReply fr) {
		SqlSession session = Template.getSqlSession();
		
		int result = boardDao.updateFriendReply(session, fr);
		
		if(result > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}
	
	// 동행게시판 댓글 삭제
	public int deleteFriendReply(int replyNo) {
		SqlSession session = Template.getSqlSession();
		
		int result = boardDao.deleteFriendReply(session, replyNo);
		
		if(result > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}
	
	
	// 마이페이지 동행 수락
	public int updateMyPageAccept(int withNo) {
		SqlSession session = Template.getSqlSession();
		
		int result = boardDao.updateMyPageAccept(session, withNo);
		
		if(result > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}
	
	// 마이페이지 동행 취소
	public int deleteMyPageAccept(int withNo) {
		SqlSession session = Template.getSqlSession();
		
		int result = boardDao.deleteMyPageAccept(session, withNo);
		
		if(result > 0) {
			session.commit();
		}else {
			session.rollback();
		}
		
		session.close();
		
		return result;
	}
	
	// 다른사용자 마이페이지
	public ArrayList<FriendWith> selectOtherMembersMyPage(FriendWith fw){
		SqlSession session = Template.getSqlSession();
		
		ArrayList<FriendWith> fwList = boardDao.selectOtherMembersMyPage(session, fw);
		
		session.close();
		
		return fwList;
	}
	
	// 동행게시판 여행 동행 수락 리스트
	public ArrayList<FriendWith> selectAcceptList(int fboardNo){
		SqlSession session = Template.getSqlSession();
		
		ArrayList<FriendWith> fw = boardDao.selectAcceptList(session, fboardNo);
		
		session.close();
		
		return fw;
	}
	
	// 현영----------------------
	
	
	
	

	//여행-축제 게시판 service	
	
	//여행-축제 선택 시 게시글 세기
	@Override 
	public int selectTravelListCount() {
		
		SqlSession session = Template.getSqlSession();
		int listCount = boardDao.selectTravelListCount(session); // 게시글 개수
		session.close(); //사용한 sqlSession반납
		
		return listCount;
	}
	//여행-축제 게시글 리스트 출력
	@Override
	public ArrayList<TravelFestival> selectTravelList(TFPageInfo pi){
		
		SqlSession session = Template.getSqlSession();
		ArrayList<TravelFestival> list = boardDao.selectTravelList(session,pi); 
		session.close();
		
		return list;
	}

	
	//여행-축제 검색 시 게시글 세기
	@Override
	public int searchTravelListCount(HashMap<String, String> map) {

		SqlSession session = Template.getSqlSession();
		int searchCount = boardDao.searchTravelListCount(session,map);
		session.close();
		
		return searchCount;
	}
	//여행-축제 검색 시 게시글 리스트 출력
	@Override
	public ArrayList<TravelFestival> searchTraveList(HashMap<String, String> map, TFPageInfo pi) {
		
		SqlSession session = Template.getSqlSession();
		ArrayList<TravelFestival> list = boardDao.searchTraveList(session,map,pi);
		session.close();
		
		return list;
	}
	

	//여행-축제 게시글 카테고리 선택 게시글 세기
	@Override
	public int travelCategoryClickListCount(List<String> selectedCategoryIds) {
		
		SqlSession session = Template.getSqlSession();
		int searchCount = boardDao.travelCategoryClickListCount(session,selectedCategoryIds);
		session.close();		
		
		return searchCount;
	}

	//여행-축제 게시글 카테고리 선택 리스트 출력
	@Override
	public ArrayList<TravelFestival> travelCategoryClick(List<String> selectedCategoryIds, TFPageInfo pi) {
		
		SqlSession session = Template.getSqlSession();
		ArrayList<TravelFestival> list = boardDao.travelCategoryClick(session, selectedCategoryIds, pi);
		session.close();

		return list;
	}
	
	
	
	// 여행-축제 상세보기 페이지
	@Override
	public TravelFestival travelFestivalDetailView(int travelNo) {
		
		SqlSession session = Template.getSqlSession();
		tf = boardDao.travelFestivalDetailView(session, travelNo);
		session.close();
		
		return tf;
	}
	
	// 여행-축제 게시글 조회수 증가
	@Override
	public int tfincreaseCount(int travelNo) {
		
		SqlSession session = Template.getSqlSession();
		
		int result = boardDao.tfincreaseCount(session, travelNo);
		
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		
		return result;
		
	}
	
	
	//맛집-카페 게시글 세기
	@Override
	public int selectDinnerListCount() {
		
		SqlSession session = Template.getSqlSession();
		int listCount = boardDao.selectDinnerListCount(session); // 게시글 개수
		session.close(); //사용한 sqlSession반납
		
		return listCount;
		
	}
	
	//맛집-카페 게시글 리스트 출력
	@Override
	public ArrayList<DinnerCafe> selectDinnerList(TFPageInfo pi) {
		
		SqlSession session = Template.getSqlSession();
		ArrayList<DinnerCafe> list = boardDao.selectDinnerList(session,pi); 
		session.close();
		
		return list;
	}
	
	
	// 맛집-카페 검색 게시글 count
	@Override
	public int searchDinnerListCount(HashMap<String, String> map) {
		
		SqlSession session = Template.getSqlSession();
		int searchCount = boardDao.searchDinnerListCount(session,map);
		session.close();
		
		return searchCount;
	}
	
	// 맛집-카페 검색 게시글 출력 
	@Override
	public ArrayList<DinnerCafe> searchDinnerList(HashMap<String, String> map, TFPageInfo pi) {
		
		SqlSession session = Template.getSqlSession();
		ArrayList<DinnerCafe> list = boardDao.searchDinnerList(session,map,pi);
		session.close();
		
		return list;
	}
	
	//맛집-카페 게시글 카테고리 선택 게시글 세기
	@Override
	public int DinnerCategoryClickListCount(List<String> selectedCategoryIds) {
		
		SqlSession session = Template.getSqlSession();
		int searchCount = boardDao.DinnerCategoryClickListCount(session,selectedCategoryIds);
		session.close();		
		
		return searchCount;
	}
	
	//맛집-카페 게시글 카테고리 선택 리스트 출력
	@Override
	public ArrayList<DinnerCafe> DinnerCategoryClick(List<String> selectedCategoryIds, TFPageInfo pi) {
		
		SqlSession session = Template.getSqlSession();
		ArrayList<DinnerCafe> list = boardDao.DinnerCategoryClick(session, selectedCategoryIds, pi);
		session.close();

		return list;
	}

	// 맛집-카페 게시글 조회수 증가
	@Override
	public int dcIncreaseCount(int dinnerNo) {
		
		SqlSession session = Template.getSqlSession();
		
		int result = boardDao.dcIncreaseCount(session, dinnerNo);
		
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		
		return result;
	}

	// 맛집-카페 게시글 상세보기
	@Override
	public DinnerCafe dinnerCafeDetailView(int dinnerNo) {
		
		SqlSession session = Template.getSqlSession();
		DinnerCafe dc = boardDao.dinnerCafeDetailView(session, dinnerNo);
		session.close();
		
		return dc;
		
	}

	
	
	// 건욱
	
	// 찜
	public static int insertTravelF(WishListTravel w) {
		SqlSession session = Template.getSqlSession();

		int result = BoardDao.insertTravelF(session, w);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}

		session.close();

		return result;
	}

	public static List<WishListTravel> selectWishListe(WishListTravel w) {
		SqlSession session = Template.getSqlSession();

		List<WishListTravel> result = BoardDao.selectWishListe(session, w);

		session.close();
		return result;
	}

	// 찜 삭제 (여행지-축제)
	@Override
	public int wishRemove(int wishKey) {

		SqlSession session = Template.getSqlSession();

		int result = boardDao.wishRemove(session, wishKey);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}

		session.close();

		return result;
	}

	public int dinnerwishRemove(int wishKey) {

		SqlSession session = Template.getSqlSession();

		int result = boardDao.dinnerwishRemove(session, wishKey);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}

		session.close();

		return result;
	}

	public static int insertDinnerlF(WishListDinner wt1) {
		SqlSession session = Template.getSqlSession();

		int result = BoardDao.insertDinnerlF(session, wt1);

		if (result > 0) {
			session.commit();
		} else {
			session.rollback();
		}

		session.close();

		return result;
	}

	public static List<WishListDinner> selectwishdinner(WishListDinner w1) {
		SqlSession session = Template.getSqlSession();

		List<WishListDinner> result = BoardDao.selectwishdinner(session, w1);

		session.close();

		return result;
	}

}
	


	

