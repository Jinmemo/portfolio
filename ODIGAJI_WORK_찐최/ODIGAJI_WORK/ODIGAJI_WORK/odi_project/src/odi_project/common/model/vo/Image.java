package odi_project.common.model.vo;
public class Image {
	
	/* 여행
	 * TRAVEL_NO
	 * TRAVEL_NAME
	 * TRAVEL_SDATE
	 * TRAVEL_EDATE
	 * TRAVEL_CONTENT
	 * TRAVEL_ADDRESS
	 * TYPE_TF
	 * RE_COUNT
	 * STATUS
	 * SEASON
	 * THEME
	 * REGION
	 * TRAVEL_IMG
	 * EDIT_DATE
	*/
    private int TravelNo;
	private int ReCount;
	private String TravelName;
	private String TravelAddress;
	private String Season;
	private String Image;
//	private String travelImg;
	
    public Image() {
        super();
    }
	public String getImage() {
		return Image;
	}
	public void setImage(String image) {
		Image = image;
	}
	public int getTravelNo() {
		return TravelNo;
	}
	public void setTravelNo(int travelNo) {
		this.TravelNo = travelNo;
	}
	public int getReCount() {
		return ReCount;
	}
	public void setReCount(int reCount) {
		ReCount = reCount;
	}
	public String getTravelName() {
		return TravelName;
	}
	public void setTravelName(String travelName) {
		TravelName = travelName;
	}
	public String getTravelAddress() {
		return TravelAddress;
	}
	public void setTravelAddress(String traveAddress) {
		TravelAddress = traveAddress;
	}
	public String getSeason() {
		return Season;
	}
	public void setSeason(String season) {
		Season = season;
	}
	
	
	
	
}
