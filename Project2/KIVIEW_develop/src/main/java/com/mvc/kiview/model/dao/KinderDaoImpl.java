package com.mvc.kiview.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.kiview.model.vo.Criteria;
import com.mvc.kiview.model.vo.KinderVo;
import com.mvc.kiview.model.vo.ProvinceVo;
import com.mvc.kiview.model.vo.ReviewVo;

@Repository
public class KinderDaoImpl implements KinderDao{
   
   @Autowired
   private SqlSessionTemplate sqlSession;
   
   @Override
   public List<KinderVo> LocalSearch(ProvinceVo vo,Criteria cri) {
      List<KinderVo> list = new ArrayList<KinderVo>();
      Map<String,Object> map = new HashMap<String,Object>();
      map.put("province", vo.getProvince());
      map.put("city", vo.getCity());
      map.put("town", vo.getTown());
      map.put("rowStart",cri.getRowStart());
      map.put("rowEnd", cri.getRowEnd());
      
      try {
         list = sqlSession.selectList(namespace+"kinderList",map);
      }catch(Exception e) {
         System.out.println("error:kinder list");
         e.printStackTrace();
      }
      return list;
   }

   @Override
   public List<KinderVo> TypeSearch(HashMap<String, String> map) {
      List<KinderVo> list = new ArrayList<KinderVo>();
      try {
         list = sqlSession.selectList(namespace+"kinderListType",map);
      }catch(Exception e) {
         System.out.println("error:kinder list type");
         e.printStackTrace();
      }
      return list;
   }

   @Override
   public List<KinderVo> NameSearch(String name,Criteria cri) {
      List<KinderVo> list = new ArrayList<KinderVo>();
      Map<String,Object> map = new HashMap<String,Object>();
      map.put("name", name);
      map.put("rowStart",cri.getRowStart());
      map.put("rowEnd", cri.getRowEnd());
      try {
         list = sqlSession.selectList(namespace+"kinderListName",map);
      }catch(Exception e) {
         System.out.println("error:kinder list name");
         e.printStackTrace();
      }
      return list;
   }

   @Override
   public KinderVo Kinderdetail(int kinder_no) {
      KinderVo vo = null;
      try {
         vo = sqlSession.selectOne(namespace+"kinderDetail", kinder_no);
      }catch(Exception e){
         System.out.println("error:kinder detail");
         e.printStackTrace();
      }
      return vo;
   }

   @Override
   public List<ProvinceVo> ProvinceList() {
      List<ProvinceVo> list = new ArrayList<ProvinceVo>();
      try {
         list = sqlSession.selectList(namespace+"provinceList");
      }catch(Exception e) {
         System.out.println("error:province list");
         e.printStackTrace();
      }
      return list;
   }

   @Override
   public List<ProvinceVo> CityList(String province) {
      List<ProvinceVo> list = new ArrayList<ProvinceVo>();
      try {
         list = sqlSession.selectList(namespace+"cityList", province);
      }catch(Exception e) {
         System.out.println("error:city list");
         e.printStackTrace();
      }
      return list;
   }

   @Override
   public List<ProvinceVo> TownList(String city) {
      List<ProvinceVo> list = new ArrayList<ProvinceVo>();
      try {
         list = sqlSession.selectList(namespace+"townList",city);
      }catch(Exception e) {
         System.out.println("error:town list");
         e.printStackTrace();
      }
      return list;
   }

   @Override
   public List<KinderVo> KinderList(String keyword) {
      List<KinderVo> list = new ArrayList<KinderVo>();
      try {
         list = sqlSession.selectList(namespace+"kinderListKeyword",keyword);
      }catch(Exception e) {
         System.out.println("error:kinder list keyword");
         e.printStackTrace();
      }
      
      return list;
   }

   @Override
   public List<KinderVo> KinderListAll() {
      List<KinderVo> list = new ArrayList<KinderVo>();
      try {
         list = sqlSession.selectList(namespace+"kinderListAll");
      }catch(Exception e) {
         System.out.println("error:kinder list all");
         e.printStackTrace();
      }
      return list;
   }

   @Override
   public KinderVo Kinderdetail(String keyword) {
      KinderVo vo = null;
      try {
         vo = sqlSession.selectOne(namespace+"kinderDetail2", keyword);
      }catch(Exception e){
         System.out.println("error:kinder detail2");
         e.printStackTrace();
      }
      return vo;
   }

   @Override
   public List<KinderVo> mapSearch(HashMap<String, String> map) {
      List<KinderVo> list = new ArrayList<KinderVo>();
      try {
         list = sqlSession.selectList(namespace+"kinderListMap",map);
      }catch(Exception e) {
         System.out.println("error:kinder list map");
         e.printStackTrace();
      }
      return list;
   }
   
   @Override
   public List<ReviewVo> ReviewList(int kinder_no, Criteria cri) {
      List<ReviewVo> list = new ArrayList<ReviewVo>();
      Map<String,Object> map = new HashMap<String,Object>();
      map.put("kinder_no", kinder_no);
      map.put("rowStart",cri.getRowStart());
      map.put("rowEnd", cri.getRowEnd());
      try {
         list = sqlSession.selectList(namespace+"reviewList",map);
      }catch(Exception e) {
         System.out.println("error:Review list");
         e.printStackTrace();
      }
      return list;
   }

   @Override
   public int ReviewCnt(int kinder_no) {
      int count = 0;

      try {
         count = sqlSession.selectOne(namespace + "rlistCount", kinder_no);
      } catch (Exception e) {
         System.out.println("error:Review list count");
         e.printStackTrace();
      }

      return count;
   }

   @Override
   public int LocalSearchCnt(ProvinceVo vo) {
      int count = 0;
      try {
         count = sqlSession.selectOne(namespace+"llistCount",vo);
      }catch (Exception e) {
         System.out.println("error:Local kinder list count");
      }
      return count;
   }

   @Override
   public int NameSearchCnt(String name) {
      int count = 0;
      try {
         count = sqlSession.selectOne(namespace+"nlistCount",name);
      }catch (Exception e) {
         System.out.println("error:name kinder list count");
      }
      return count;
   }

   @Override
   public List<KinderVo> bestKinderList() {
      List<KinderVo> list = new ArrayList<KinderVo>();
      try {
         list = sqlSession.selectList(namespace+"bestKinderList");
      }catch(Exception e) {
         System.out.println("error: bestKinderList");
         e.printStackTrace();
      }
      return list;
   }
   
   
}
