package odi_project.board.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import odi_project.board.model.vo.Board;
import odi_project.board.model.vo.Category;
import odi_project.board.model.vo.DinnerCafe;
import odi_project.board.model.vo.FriendReply;
import odi_project.board.model.vo.FriendWith;
import odi_project.board.model.vo.Reply;
import odi_project.board.model.vo.TravelFestival;
import odi_project.board.model.vo.TravelFriendBoard;
import odi_project.board.model.vo.TravelFriendCategory;
import odi_project.common.model.vo.PageInfo;
import odi_project.common.model.vo.TFPageInfo;

public interface BoardService {

	
	//여행-축제 게시판  ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	// 여행-축제 선택 시 게시글 세기
	int selectTravelListCount();
	
	// 여행-축제 게시판 선택(리스트출력)
	ArrayList<TravelFestival> selectTravelList(TFPageInfo pi);
	
	
	// 여행-축제 검색 시 게시글 세기
	int searchTravelListCount(HashMap<String, String> map);
	
	// 여행-축제 게시판 검색(리스트 출력) 
	ArrayList<TravelFestival> searchTraveList(HashMap<String, String> map, TFPageInfo pi);
	
	
	// 여행-축제 카테고리 선택 시 게시글 세기
	int travelCategoryClickListCount(List<String> selectedCategoryIds);
	
	// 여행-축제 게시판 카테고리 선택(리스트 출력)
	ArrayList<TravelFestival> travelCategoryClick(List<String> selectedCategoryIds, TFPageInfo pi);

	
	// 여행-축제 게시판 상세보기
	TravelFestival travelFestivalDetailView(int travelNo);
	
	//여행-축제 조회수 증가
	int tfincreaseCount(int travelNo);
	
	//여행-축제 이미지 가져오기
	//ArrayList selectTravelImg(int travelNo);
	
	
	//맛집카페 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	// 맛집-카페 게시판 게시글 세기
	int selectDinnerListCount();
	
	// 맛집-카페 게시판 선택 (리스트 출력)
	ArrayList<DinnerCafe> selectDinnerList(TFPageInfo pi);

	
	//맛집-카페 검색 게시글 세기
	int searchDinnerListCount(HashMap<String, String> map);
	
	// 맛집-카페 검색 게시판 리스트 출력
	ArrayList<DinnerCafe> searchDinnerList(HashMap<String, String> map, TFPageInfo pi);

	
	// 맛집-카페 카테고리 선택 시 게시글 세기
	int DinnerCategoryClickListCount(List<String> selectedCategoryIds);
	
	// 맛집-카페 게시판 카테고리 선택(리스트 출력)
	ArrayList<DinnerCafe> DinnerCategoryClick(List<String> selectedCategoryIds, TFPageInfo pi);

	// 맛집-카페 조회수 증가
	int dcIncreaseCount(int dinnerNo);

	// 맛집-카페 상세보기 페이지
	DinnerCafe dinnerCafeDetailView(int dinnerNo);
	
	

	
	
	

	// 일반 게시판 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	
	int selectListCount();

	ArrayList<Board> selectList(PageInfo pi);

	ArrayList<Board> searchBoardList(HashMap<String, String> map, PageInfo pi);
	
	int commonsearchlist(HashMap<String, String> map);
	
	int increaseCount(int bno);

	Board selectBoard(int bno);

	int insertBoard(Board newBoard);

	int updateBoard(Board board);
	
	int deleteBoard(Board board);
	
	int insertReply(Reply reply);
	
	int updateReply(Reply reply);
	
	int deleteReply(Reply reply);
	
	// 공지사항
	
	ArrayList<Board> noticeSelectList(PageInfo pi);
	
	Board noticeSelectBoard(int bno);
	
	int noticeInsertBoard(Board board);
	
	int noticeUpdateBoard(Board board);
	
	int noticeDeleteBoard(Board board);
	
	int noticeInsertReply(Reply reply);
	
	int noticeDeleteReply(Reply reply);
	
	int noticeUpdateReply(Reply reply);
	
	
	// 동행게시판 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
//	동행게시판 게시글 작성 카테고리 불러오기
	ArrayList<Category> selectFriendCategoryList();
	
//	동행게시판 게시글 작성 추가
	int InsertFriendBoard(TravelFriendBoard tfb);


//	동행게시판 검색 결과 게시글 리스트
	ArrayList<TravelFriendBoard> selectSearchFriendList(HashMap<String, String> map);


//	동행게시판 모달 검색 리스트
	ArrayList<TravelFriendBoard> selectSearchModalList(HashMap<String, String> map);

//	동행게시판 상세페이지
	TravelFriendCategory friendDetailView(int fboardNo);
	
//	동행게시판 수정페이지
	int updateFriendBoard(TravelFriendCategory tfc);
	
//	동행게시판 삭제
	int deleteFriendBoard(int fboardNo);
	
//	동행게시판 댓글 추가
	int insertFriendReply(FriendReply fr);
	
//	동행게시판 댓글 목록불러오기
	ArrayList<FriendReply> selectFriendReplyList();
	
//	동행게시판 동행 수락하기
	int insertFriendWith(FriendWith fw);
	
//	동행게시판 동행 취소하기
	int deleteFriendWith(FriendWith fw);
	
//	동행게시판 동행 수락/취소 버튼 세션 유지 
	String checkCompanionStatus(int fboardNo, String memberId);
	
//	마이페이지 동행 수락 대기
	ArrayList<FriendWith> selectMyPageAccept(String memberId);
	
//	동행게시판 댓글 수정
	int updateFriendReply(FriendReply fr);
	
//	동행게시판 댓글 삭제
	int deleteFriendReply(int replyNo);
	
//	마이페이지 동행 수락 
	int updateMyPageAccept(int withNo);
	
//	마이페이지 동행 취소
	int deleteMyPageAccept(int withNo);
	
//	다른 사용자 마이페이지
	ArrayList<FriendWith> selectOtherMembersMyPage(FriendWith fw);
	
//	동행게시판 여행 동행 수락 리스트
	ArrayList<FriendWith> selectAcceptList(int fboardNo);
	
	
	
	// 현영 끝 ---------------------------------

	
	// 찜목록 삭제 (여행축제)
	int wishRemove(int wishKey);
	
	// 찜목록 삭제 (식당카페)
	int dinnerwishRemove(int wishKey);
	

	
	
	
}
