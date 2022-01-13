package com.itbank.model;

public class DrinkDTO {
	private int drink_seq;
	private String description;
	private String name;
	private	String price; // 1800 // 2100 // 2600 구분으로 되있는 항목이있어서 String으로 처리
	private String img;
	private String weight_g; // //로 구분되있는 칼럼이있음
	private String weight_ml;   //로 구분되있는 칼럼이있음
	private String kcal;
	private String sugar;
	private String protein;
	private String fat;
	private String natrium;
	private String caffeine;
	private String nutrient_standards_sugar;
	private String nutrient_standards_protein;
	private String nutrient_standards_fat;
	private String nutrient_standards_natrium;
	private String allergyInfo;
	public int getDrink_seq() {
		return drink_seq;
	}
	public void setDrink_seq(int drink_seq) {
		this.drink_seq = drink_seq;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getWeight_g() {
		return weight_g;
	}
	public void setWeight_g(String weight_g) {
		this.weight_g = weight_g;
	}
	public String getWeight_ml() {
		return weight_ml;
	}
	public void setWeight_ml(String weight_ml) {
		this.weight_ml = weight_ml;
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
	public String getNutrient_standards_sugar() {
		return nutrient_standards_sugar;
	}
	public void setNutrient_standards_sugar(String nutrient_standards_sugar) {
		this.nutrient_standards_sugar = nutrient_standards_sugar;
	}
	public String getNutrient_standards_protein() {
		return nutrient_standards_protein;
	}
	public void setNutrient_standards_protein(String nutrient_standards_protein) {
		this.nutrient_standards_protein = nutrient_standards_protein;
	}
	public String getNutrient_standards_fat() {
		return nutrient_standards_fat;
	}
	public void setNutrient_standards_fat(String nutrient_standards_fat) {
		this.nutrient_standards_fat = nutrient_standards_fat;
	}
	public String getNutrient_standards_natrium() {
		return nutrient_standards_natrium;
	}
	public void setNutrient_standards_natrium(String nutrient_standards_natrium) {
		this.nutrient_standards_natrium = nutrient_standards_natrium;
	}
	public String getAllergyInfo() {
		return allergyInfo;
	}
	public void setAllergyInfo(String allergyInfo) {
		this.allergyInfo = allergyInfo;
	}
}
