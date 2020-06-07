package com.mvc.kiview.model.vo;

import java.util.Date;

public class KinderVo {

   private int kinder_no;
   private String name;
   private String type;
   private String addr1;
   private String addr2;
   private double latitude;
   private double longitude;
   private String phone;
   private String director;
   private Date opendate;
   private String homepage;
   private int class_num;
   private int children_num;
   private int staff_num;
   private String drive_yn;
   private String meal_yn;
   private String cctv_yn;
   private int bestcnt;
   
   public KinderVo() {
      super();
      // TODO Auto-generated constructor stub
   }

   public KinderVo(int kinder_no, String name, String type, String addr1, String addr2, double latitude, double longitude,
         String phone, String director, Date opendate, String homepage, int class_num, int children_num,
         int staff_num, String drive_yn, String meal_yn, String cctv_yn, int bestcnt) {
      super();
      this.kinder_no = kinder_no;
      this.name = name;
      this.type = type;
      this.addr1 = addr1;
      this.addr2 = addr2;
      this.latitude = latitude;
      this.longitude = longitude;
      this.phone = phone;
      this.director = director;
      this.opendate = opendate;
      this.homepage = homepage;
      this.class_num = class_num;
      this.children_num = children_num;
      this.staff_num = staff_num;
      this.drive_yn = drive_yn;
      this.meal_yn = meal_yn;
      this.cctv_yn = cctv_yn;
      this.setBestcnt(bestcnt);
   }

   public int getKinder_no() {
      return kinder_no;
   }

   public void setKinder_no(int kinder_no) {
      this.kinder_no = kinder_no;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getType() {
      return type;
   }

   public void setType(String type) {
      this.type = type;
   }

   public String getAddr1() {
      return addr1;
   }

   public void setAddr1(String addr1) {
      this.addr1 = addr1;
   }

   public String getAddr2() {
      return addr2;
   }

   public void setAddr2(String addr2) {
      this.addr2 = addr2;
   }

   public double getLatitude() {
      return latitude;
   }

   public void setLatitude(double latitude) {
      this.latitude = latitude;
   }

   public double getLongitude() {
      return longitude;
   }

   public void setLongitude(double longitude) {
      this.longitude = longitude;
   }

   public String getPhone() {
      return phone;
   }

   public void setPhone(String phone) {
      this.phone = phone;
   }

   public String getDirector() {
      return director;
   }

   public void setDirector(String director) {
      this.director = director;
   }

   public Date getOpendate() {
      return opendate;
   }

   public void setOpendate(Date opendate) {
      this.opendate = opendate;
   }

   public String getHomepage() {
      return homepage;
   }

   public void setHomepage(String homepage) {
      this.homepage = homepage;
   }

   public int getClass_num() {
      return class_num;
   }

   public void setClass_num(int class_num) {
      this.class_num = class_num;
   }

   public int getChildren_num() {
      return children_num;
   }

   public void setChildren_num(int children_num) {
      this.children_num = children_num;
   }

   public int getStaff_num() {
      return staff_num;
   }

   public void setStaff_num(int staff_num) {
      this.staff_num = staff_num;
   }

   public String getDrive_yn() {
      return drive_yn;
   }

   public void setDrive_yn(String drive_yn) {
      this.drive_yn = drive_yn;
   }

   public String getMeal_yn() {
      return meal_yn;
   }

   public void setMeal_yn(String meal_yn) {
      this.meal_yn = meal_yn;
   }

   public String getCctv_yn() {
      return cctv_yn;
   }

   public void setCctv_yn(String cctv_yn) {
      this.cctv_yn = cctv_yn;
   }

   public int getBestcnt() {
      return bestcnt;
   }
   
   public void setBestcnt(int bestcnt) {
      this.bestcnt = bestcnt;
   }
   
   @Override
   public String toString() {
      return "KinderVo [kinder_no=" + kinder_no + ", name=" + name + ", type=" + type + ", addr1=" + addr1
            + ", addr2=" + addr2 + ", latitude=" + latitude + ", longitude=" + longitude + ", phone=" + phone
            + ", director=" + director + ", opendate=" + opendate + ", homepage=" + homepage + ", class_num="
            + class_num + ", children_num=" + children_num + ", staff_num=" + staff_num + ", drive_yn=" + drive_yn
            + ", meal_yn=" + meal_yn + ", cctv_yn=" + cctv_yn + "]";
   }

   
   
   
   
}

