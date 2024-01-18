package odi_project.board.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

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

public class BoardDao {

	//여행축제게시판 게시글 COUNT 
	public int selectTravelListCount(SqlSession sqlSession) {
		
		return sqlSession.selectOne("boardMapper.selectTravelListCount");
	}
	//여행축제게시판 게시글 화면출력
	public ArrayList<TravelFestival> selectTravelList(SqlSession session, TFPageInfo pi){
		
		int limit = pi.getBoardLimit();
		int offset= (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)session.selectList("boardMapper.selectTravelList", null, rowBounds);
	}

	
	//여행축제게시판 게시글 검색 count
	public int searchTravelListCount(SqlSession session, HashMap<String, String> map) {
		
		return session.selectOne("boardMapper.searchTravelListCount", map);
	}
	//여행축제게시판 게시글 검색 화면
	public ArrayList<TravelFestival> searchTraveList(SqlSession session, HashMap<String, String> map, TFPageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)session.selectList("boardMapper.searchTraveList",map,rowBounds);
	}

	
	
	// 여행축제게시판 게시글 카테고리선택 count
	public int travelCategoryClickListCount(SqlSession session, List<String> selectedCategoryIds) {
	
		return session.selectOne("boardMapper.travelCategoryClickListCount",selectedCategoryIds);
	}

	// 여행축제게시판 게시글 카테고리선택 화면 
	public ArrayList<TravelFestival> travelCategoryClick(SqlSession session, List<String> selectedCategoryIds, TFPageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)session.selectList("boardMapper.travelCategoryClick",selectedCategoryIds,rowBounds);
	}


	
	
	// 장현진 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
		public int selectListCount(SqlSession sqlSession) {
			return sqlSession.selectOne("boardMapper.selectListCount");
		}

		// 일반게시판 리스트
		public ArrayList<Board> selectList(SqlSession session, PageInfo pi) {
			int limit = pi.getBoardLimit();
			int offset = (pi.getCurrentPage() - 1 ) * limit;
			
			RowBounds rowBounds = new RowBounds(offset, limit);
			
			return (ArrayList) session.selectList("boardMapper.selectList", null, rowBounds);
		}

		// 공지사항 리스트
		public ArrayList<Board> noticeSelectList(SqlSession session, PageInfo pi) {
			int limit = pi.getBoardLimit();
			int offset = (pi.getCurrentPage() - 1) * limit;

			RowBounds rowBounds = new RowBounds(offset, limit);

			return (ArrayList) session.selectList("boardMapper.noticeSelectList", null, rowBounds);
		}

		public ArrayList<Board> searchList(SqlSession session, HashMap<String, String> map, PageInfo pi) {
			int limit = pi.getBoardLimit();
			int offset = (pi.getCurrentPage() - 1) * limit;

			RowBounds rowBounds = new RowBounds(offset, limit);

			return (ArrayList) session.selectList("boardMapper.searchList", map, rowBounds);
		}

		public int increaseCount(SqlSession session, int bno) {
			return session.update("boardMapper.increaseCount", bno);
		}

		public Board selectBoard(SqlSession session, int bno) {
			return session.selectOne("boardMapper.selectBoard", bno);
		}

		public Board noticeSelectBoard(SqlSession session, int bno) {
			return session.selectOne("boardMapper.noticeSelectBoard", bno);
		}

		// 일반게시판 검색
		public int commonsearchlist(SqlSession session, HashMap<String, String> map) {
			return session.selectOne("boardMapper.commonsearchlist", map);
		}

		public int insertReply(SqlSession session, Reply reply) {
			return session.insert("boardMapper.insertReply", reply);
		}

		public int noticeInsertReply(SqlSession session, Reply reply) {
			return session.insert("boardMapper.noticeInsertReply", reply);
		}

		public int insertBoard(SqlSession session, Board board) {
			return session.insert("boardMapper.insertBoard", board);
		}

		public int noticeInsertBoard(SqlSession session, Board board) {
			return session.insert("boardMapper.noticeInsert", board);
		}

		public int updateBoard(SqlSession session, Board board) {
			return session.update("boardMapper.updateBoard", board);
		}

		public int noticeUpdateBoard(SqlSession session, Board board) {
			return session.update("boardMapper.noticeUpdateBoard", board);
		}

		public int deleteBoard(SqlSession session, Board board) {
			return session.update("boardMapper.deleteBoard", board);
		}

		public int noticeDeleteBoard(SqlSession session, Board board) {
			return session.update("boardMapper.noticeDeleteBoard", board);
		}

		public int updateReply(SqlSession session, Reply reply) {
			return session.update("boardMapper.updateReply", reply);
		}

		public int noticeUpdateReply(SqlSession session, Reply reply) {
			return session.update("boardMapper.noticeUpdateReply", reply);
		}

		public int deleteReply(SqlSession session, Reply reply) {
			return session.update("boardMapper.deleteReply", reply);
		}

		public int noticeDeleteReply(SqlSession session, Reply reply) {
			return session.update("boardMapper.noticeDeleteReply", reply);
		}

		// 장현진 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	
		
	// 이현영------------------------------------
//		동행게시글 카테고리 불러옴
		public ArrayList<Category> selectFriendCategoryList(SqlSession session) {
			
			return (ArrayList) session.selectList("boardMapper.selectFriendCategoryList");
		}

//		동행게시글 게시글 추가
		public int InsertFriendBoard(SqlSession session, TravelFriendBoard tfb) {
			
			return session.insert("boardMapper.insertFriendList",tfb);
		}



	//  동행게시글 검색 결과 목록을 가져오는 클래스
		public ArrayList<TravelFriendBoard> selectSearchFriendList(SqlSession session, HashMap<String, String> map) {

			return  (ArrayList) session.selectList("boardMapper.selectSearchFriendList", map );
		}


//		동행게시글 모달 검색 리스트
		public ArrayList<TravelFriendBoard> selectSearchModalList(SqlSession session, HashMap<String, String> map) {

			return  (ArrayList) session.selectList("boardMapper.selectSearchModalList", map );
		}

//		동행게시글 상세페이지
		public TravelFriendCategory friendDetailView(SqlSession session, int fboardNo) {
			
			return session.selectOne("boardMapper.friendDetailView", fboardNo);
		}
		
//		동행게시글 수정페이지
		public int updateFriendBoard(SqlSession session, TravelFriendCategory tfc) {
			return session.update("boardMapper.updateFriendBoard", tfc);
		}
		
//		동행게시글 삭제페이지
		public int deleteFriendBoard(SqlSession session, int fboardNo) {
			
			return session.update("boardMapper.deleteFriendBoard", fboardNo);
		}
		
//		동행게시글 댓글 추가
		public int insertFriendReply(SqlSession session, FriendReply fr) {
			return session.insert("boardMapper.friendInsertReply", fr);
		}

		
//		동행게시글 댓글 불러오기
		public ArrayList<FriendReply> selectFriendReplyList(SqlSession session) {
			return (ArrayList) session.selectList("boardMapper.selectFriendResultList");
		}
		
//		동행게시글 동행 수락 
		public int insertFriendWith(SqlSession session, FriendWith fw) {
			return session.insert("boardMapper.insertFriendWith", fw);
		}
		
//		동행게시글 동행 취소
		public int deleteFriendWith(SqlSession session, FriendWith fw) {
			return session.delete("boardMapper.deleteFriendWith", fw);
		}
		
//		동행게시판 동행 수락/취소 버튼 세션 유지 
		public String checkCompanionStatus(SqlSession session, Map<String, Object> parameters) {
			return session.selectOne("boardMapper.checkCompanionStatus", parameters);
		}
		
	//  마이페이지 동행 수락 대기
		public ArrayList<FriendWith> selectMyPageAccept(SqlSession session, String memberId) {
			return (ArrayList)session.selectList("boardMapper.selectMyPageAccept", memberId);
		}
		
//		동행게시판 댓글 수정
		public int updateFriendReply(SqlSession session, FriendReply fr) {
			return session.update("boardMapper.updateFriendReply", fr);
		}
		
//		동행게시판 댓글 삭제
		public int deleteFriendReply(SqlSession session, int replyNo) {
			return session.update("boardMapper.deleteFriendReply", replyNo);
		}
		
//		마이페이지 동행 수락
		public int updateMyPageAccept(SqlSession session, int withNo) {
			return session.update("boardMapper.updateMyPageAccept", withNo);
		}
		
//		마이페이지 동행 취소
		public int deleteMyPageAccept(SqlSession session, int withNo) {
			return session.delete("boardMapper.deleteMyPageAccept", withNo);
		}
		
//		다른 사용자 마이페이지
		public ArrayList<FriendWith> selectOtherMembersMyPage(SqlSession session, FriendWith fw) {
			return (ArrayList) session.selectList("boardMapper.selectOtherMembersMyPage", fw);
		}
		
//		동행게시판 여행 동행 수락 리스트
		public ArrayList<FriendWith> selectAcceptList(SqlSession session, int fboardNo) {
			return (ArrayList) session.selectList("boardMapper.selectAcceptList", fboardNo);
		}
	
	
	// 이현영------------------------------------
	
	
	
	// 여행-축제 상세보기 페이지
	public TravelFestival travelFestivalDetailView(SqlSession session, int travelNo) {
		
		return session.selectOne("boardMapper.travelFestivalDetailView",travelNo);
	}
	
	// 여행-축제 조회수 증가 
	public int tfincreaseCount(SqlSession session, int travelNo) {
		
		return session.update("boardMapper.tfincreaseCount", travelNo);
	}
	
	// 맛집-카페 페이지 카운트
	public int selectDinnerListCount(SqlSession session) {
		return session.selectOne("boardMapper.selectDinnerListCount");
	}
	
	//맛집-카페 게시글 리스트 출력
	public ArrayList<DinnerCafe> selectDinnerList(SqlSession session, TFPageInfo pi) {

		int limit = pi.getBoardLimit();
		int offset= (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)session.selectList("boardMapper.selectDinnerList", null, rowBounds);
	}
	
	
	// 맛집-카페 검색 게시글 count
	public int searchDinnerListCount(SqlSession session, HashMap<String, String> map) {
		return session.selectOne("boardMapper.searchDinnerListCount", map);
	}
	
	// 맛집-카페 검색 게시판 리스트 출력
	public ArrayList<DinnerCafe> searchDinnerList(SqlSession session, HashMap<String, String> map, TFPageInfo pi) {

		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)session.selectList("boardMapper.searchDinnerList",map,rowBounds);
	}
	
	// 맛집-카페 카테고리 선택 count
	public int DinnerCategoryClickListCount(SqlSession session, List<String> selectedCategoryIds) {
		
		return session.selectOne("boardMapper.dinnerCategoryClickListCount",selectedCategoryIds);
	}
	
	// 맛집-카페 카테고리 선택 리스트 출력
	public ArrayList<DinnerCafe> DinnerCategoryClick(SqlSession session, List<String> selectedCategoryIds, TFPageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage()-1)*limit;
		
		RowBounds rowBounds = new RowBounds(offset,limit);
		
		return (ArrayList)session.selectList("boardMapper.dinnerCategoryClick",selectedCategoryIds,rowBounds);
	}
	
	
	// 맛집-카페 상세보기 페이지
	public DinnerCafe dinnerCafeDetailView(SqlSession session, int dinnerNo) {
		return session.selectOne("boardMapper.dinnerCafeDetailView", dinnerNo);
	}

	// 맛집-카페 게시글 조회수 증가
	public int dcIncreaseCount(SqlSession session, int dinnerNo) {
		return session.update("boardMapper.dcIncreaseCount", dinnerNo);
	}
	
	
	// 박건욱---------------------------------------------
	
	public static Map<String, Object> SelectTravelF(SqlSession session, TravelFestival t) {
		return session.selectOne("boardMapper.SelectTravelF", t);
	}

	public static int insertTravelF(SqlSession session, WishListTravel w) {
		// TODO Auto-generated method stub
		return session.insert("boardMapper.insertTravelF", w);
	}

	public static List<WishListTravel> selectWishListe(SqlSession session, WishListTravel w) {

		return session.selectList("boardMapper.selectWishListe", w);
	}
	
	// 찜 삭제 (여행지-축제)
	public int wishRemove(SqlSession session, int wishKey) {
		
		return session.update("boardMapper.wishRemove", wishKey);
	}
	
	// 찜 삽입
	public static int insertDinnerlF(SqlSession session, WishListDinner wt1) {
		
		return session.insert("boardMapper.insertDinnerlF", wt1);
	}
	// 찜 삭제
	public static List<WishListDinner> selectwishdinner(SqlSession session, WishListDinner w1) {
		return session.selectList("boardMapper.selectwishdinner", w1);
	}
	public int dinnerwishRemove(SqlSession session, int wishKey) {
		return session.update("boardMapper.dinnerwishRemove", wishKey);
	}
	
	
	
}
	
