package com.itbank.model;

public class DrinkDTO {
	private int drinkSeq;
	private String drinkDescription;
	private String drinkName;
	private	String drinkPrice; // 1800 // 2100 // 2600 구분으로 되있는 항목이있어서 String으로 처리
	private String drinkImage;
	private String weightG; // //로 구분되있는 칼럼이있음
	private String weightMl;   //로 구분되있는 칼럼이있음
	private String kcal;
	private String sugar;
	private String protein;
	private String fat;
	private String natrium;
	private String caffeine;
	private String nutrientStandSugar;
	private String nutrientStandProtein;
	private String nutrientStandFat;
	private String nutrientStandNatrium;
	private String allergyInfo;
	public int getDrinkSeq() {
		return drinkSeq;
	}
	public void setDrinkSeq(int drinkSeq) {
		this.drinkSeq = drinkSeq;
	}
	public String getDrinkDescription() {
		return drinkDescription;
	}
	public void setDrinkDescription(String drinkDescription) {
		this.drinkDescription = drinkDescription;
	}
	public String getDrinkName() {
		return drinkName;
	}
	public void setDrinkName(String drinkName) {
		this.drinkName = drinkName;
	}
	public String getDrinkPrice() {
		return drinkPrice;
	}
	public void setDrinkPrice(String drinkPrice) {
		this.drinkPrice = drinkPrice;
	}
	public String getDrinkImage() {
		return drinkImage;
	}
	public void setDrinkImage(String drinkImage) {
		this.drinkImage = drinkImage;
	}
	public String getWeightG() {
		return weightG;
	}
	public void setWeightG(String weightG) {
		this.weightG = weightG;
	}
	public String getWeightMl() {
		return weightMl;
	}
	public void setWeightMl(String weightMl) {
		this.weightMl = weightMl;
	}
	public String getKcal() {
		return kcal;
	}
	public void setKcal(String kcal) {
		this.kcal = kcal;
	}
	public String getSugar() {
		return sugar;
	}
	public void setSugar(String sugar) {
		this.sugar = sugar;
	}
	public String getProtein() {
		return protein;
	}
	public void setProtein(String protein) {
		this.protein = protein;
	}
	public String getFat() {
		return fat;
	}
	public void setFat(String fat) {
		this.fat = fat;
	}
	public String getNatrium() {
		return natrium;
	}
	public void setNatrium(String natrium) {
		this.natrium = natrium;
	}
	public String getCaffeine() {
		return caffeine;
	}
	public void setCaffeine(String caffeine) {
		this.caffeine = caffeine;
	}
	public String getNutrientStandSugar() {
		return nutrientStandSugar;
	}
	public void setNutrientStandSugar(String nutrientStandSugar) {
		this.nutrientStandSugar = nutrientStandSugar;
	}
	public String getNutrientStandProtein() {
		return nutrientStandProtein;
	}
	public void setNutrientStandProtein(String nutrientStandProtein) {
		this.nutrientStandProtein = nutrientStandProtein;
	}
	public String getNutrientStandFat() {
		return nutrientStandFat;
	}
	public void setNutrientStandFat(String nutrientStandFat) {
		this.nutrientStandFat = nutrientStandFat;
	}
	public String getNutrientStandNatrium() {
		return nutrientStandNatrium;
	}
	public void setNutrientStandNatrium(String nutrientStandNatrium) {
		this.nutrientStandNatrium = nutrientStandNatrium;
	}
	public String getAllergyInfo() {
		return allergyInfo;
	}
	public void setAllergyInfo(String allergyInfo) {
		this.allergyInfo = allergyInfo;
	}
	
	
	
}
