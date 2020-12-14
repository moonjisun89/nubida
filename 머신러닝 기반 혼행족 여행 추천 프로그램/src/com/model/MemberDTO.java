package com.model;

public class MemberDTO {

	private String m_name;		// 이름
	private String m_email;		// 이메일
	private String m_pw;		// 비밀번호
	private String m_tel;		// 핸드폰번호
	private String rank;		// 일반회원, 사업자회원 구분
	private String age;			// 나이
	private String gender;		// 성별
	private String store;		// 사업자회원 - 상호명
	private String type;		// 사업자회원 - 업종
	private String experience;
	// 특성 16개
	private String mountain;
	private String beach;
	private String town;
	private String exotic;
	private String healing;
	private String activity;
	private String hotspot;
	private String beverage;
	private String food;
	private String history;
	private String walkbicycle;
	private String drivebike;
	private String play;
	private String shopping;
	private String pet;
	private String festival;

	
	public MemberDTO() {}

	public MemberDTO(String m_name) {
		super();
		this.m_name = m_name;
	}

	public MemberDTO(String m_email, String m_pw) {
		super();
		this.m_email = m_email;
		this.m_pw = m_pw;
	}

	public MemberDTO(String m_name, String m_email, String m_pw) {
		super();
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_pw = m_pw;
	}
	
	public MemberDTO(String m_name, String m_email, String m_pw, String rank) {
		super();
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_pw = m_pw;
		this.rank = rank;
	}
	
	public MemberDTO(String m_name, String m_email, String m_pw, String rank, String type, String experience) {
		super();
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_pw = m_pw;
		this.rank = rank;
		this.type = type;
		this.experience = experience;
	}
	
	

	public MemberDTO(String m_email, String m_pw, String m_tel, String rank, String age, String gender,
			String store, String type) {
		super();
		this.m_email = m_email;
		this.m_pw = m_pw;
		this.m_tel = m_tel;
		this.rank = rank;
		this.age = age;
		this.gender = gender;
		this.store = store;
		this.type = type;
	}

	public MemberDTO(String m_name, String m_email, String m_pw, String m_tel, String rank, String age, String gender,
			String store, String type) {
		super();
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_pw = m_pw;
		this.m_tel = m_tel;
		this.rank = rank;
		this.age = age;
		this.gender = gender;
		this.store = store;
		this.type = type;
	}

	public MemberDTO(String m_name, String m_email, String m_pw, String m_tel, String rank, String age, String gender,
			String store, String type, String mountain, String beach, String town, String exotic, String healing,
			String activity, String hotspot, String beverage, String food, String history, String walkbicycle,
			String drivebike, String play, String shopping, String pet, String festival) {
		super();
		this.m_name = m_name;
		this.m_email = m_email;
		this.m_pw = m_pw;
		this.m_tel = m_tel;
		this.rank = rank;
		this.age = age;
		this.gender = gender;
		this.store = store;
		this.type = type;
		this.mountain = mountain;
		this.beach = beach;
		this.town = town;
		this.exotic = exotic;
		this.healing = healing;
		this.activity = activity;
		this.hotspot = hotspot;
		this.beverage = beverage;
		this.food = food;
		this.history = history;
		this.walkbicycle = walkbicycle;
		this.drivebike = drivebike;
		this.play = play;
		this.shopping = shopping;
		this.pet = pet;
		this.festival = festival;
	}

	public MemberDTO(String m_email, String mountain, String beach, String town, String exotic, String healing,
			String activity, String hotspot, String beverage, String food, String history, String walkbicycle,
			String drivebike, String play, String shopping, String pet, String festival) {
		super();
		this.m_email = m_email;
		this.mountain = mountain;
		this.beach = beach;
		this.town = town;
		this.exotic = exotic;
		this.healing = healing;
		this.activity = activity;
		this.hotspot = hotspot;
		this.beverage = beverage;
		this.food = food;
		this.history = history;
		this.walkbicycle = walkbicycle;
		this.drivebike = drivebike;
		this.play = play;
		this.shopping = shopping;
		this.pet = pet;
		this.festival = festival;
	}
	
	

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_pw() {
		return m_pw;
	}

	public void setM_pw(String m_pw) {
		this.m_pw = m_pw;
	}

	public String getM_tel() {
		return m_tel;
	}

	public void setM_tel(String m_tel) {
		this.m_tel = m_tel;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getStore() {
		return store;
	}

	public void setStore(String store) {
		this.store = store;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMountain() {
		return mountain;
	}

	public void setMountain(String mountain) {
		this.mountain = mountain;
	}

	public String getBeach() {
		return beach;
	}

	public void setBeach(String beach) {
		this.beach = beach;
	}

	public String getTown() {
		return town;
	}

	public void setTown(String town) {
		this.town = town;
	}

	public String getExotic() {
		return exotic;
	}

	public void setExotic(String exotic) {
		this.exotic = exotic;
	}

	public String getHealing() {
		return healing;
	}

	public void setHealing(String healing) {
		this.healing = healing;
	}

	public String getActivity() {
		return activity;
	}

	public void setActivity(String activity) {
		this.activity = activity;
	}

	public String getHotspot() {
		return hotspot;
	}

	public void setHotspot(String hotspot) {
		this.hotspot = hotspot;
	}

	public String getBeverage() {
		return beverage;
	}

	public void setBererage(String beverage) {
		this.beverage = beverage;
	}

	public String getFood() {
		return food;
	}

	public void setFood(String food) {
		this.food = food;
	}

	public String getHistory() {
		return history;
	}

	public void setHistory(String history) {
		this.history = history;
	}

	public String getWalkbicycle() {
		return walkbicycle;
	}

	public void setWalkbicycle(String walkbicycle) {
		this.walkbicycle = walkbicycle;
	}

	public String getDrivebike() {
		return drivebike;
	}

	public void setDrivebike(String drivebike) {
		this.drivebike = drivebike;
	}

	public String getPlay() {
		return play;
	}

	public void setPlay(String play) {
		this.play = play;
	}

	public String getShopping() {
		return shopping;
	}

	public void setShopping(String shopping) {
		this.shopping = shopping;
	}

	public String getPet() {
		return pet;
	}

	public void setPet(String pet) {
		this.pet = pet;
	}

	public String getFestival() {
		return festival;
	}

	public void setFestival(String festival) {
		this.festival = festival;
	}
	
}
