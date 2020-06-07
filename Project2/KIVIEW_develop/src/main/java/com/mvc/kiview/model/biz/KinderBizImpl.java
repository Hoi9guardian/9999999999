package com.mvc.kiview.model.biz;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.kiview.model.dao.KinderDao;
import com.mvc.kiview.model.vo.Criteria;
import com.mvc.kiview.model.vo.KinderVo;
import com.mvc.kiview.model.vo.ProvinceVo;
import com.mvc.kiview.model.vo.ReviewVo;

@Service
public class KinderBizImpl implements KinderBiz {
   
   @Autowired
   private KinderDao dao;

   @Override
   public List<KinderVo> LocalSearch(ProvinceVo vo, Criteria cri) {
      
      return dao.LocalSearch(vo,cri);
   }

   @Override
   public List<KinderVo> TypeSearch(HashMap<String, String> map) {
      
      return dao.TypeSearch(map);
   }

   @Override
   public List<KinderVo> NameSearch(String name, Criteria cri) {
         
      return dao.NameSearch(name,cri);
   }

   @Override
   public KinderVo Kinderdetail(int kinder_no) {
      
      return dao.Kinderdetail(kinder_no);
   }

   @Override
   public List<ProvinceVo> ProvinceList() {

      return dao.ProvinceList();
   }

   @Override
   public List<ProvinceVo> CityList(String province) {

      return dao.CityList(province);
   }

   @Override
   public List<ProvinceVo> TownList(String city) {

      return dao.TownList(city);
   }

   @Override
   public List<KinderVo> KinderList(String keyword) {

      return dao.KinderList(keyword);
   }

   @Override
   public List<KinderVo> KinderListAll() {

      return dao.KinderListAll();
   }

   @Override
   public KinderVo Kinderdetail(String keyword) {

      return dao.Kinderdetail(keyword);
   }

   @Override
   public List<KinderVo> mapSearch(HashMap<String, String> map) {
      return dao.mapSearch(map);
   }

   @Override
   public List<ReviewVo> ReviewList(int kinder_no, Criteria cri) {
      return dao.ReviewList(kinder_no,cri);
   }

   @Override
   public int ReviewCnt(int kinder_no) {
      return dao.ReviewCnt(kinder_no);
   }

   @Override
   public int LocalSearchCnt(ProvinceVo vo) {
      return dao.LocalSearchCnt(vo);
   }

   @Override
   public int NameSearchCnt(String name) {
      return dao.NameSearchCnt(name);
   }


   @Override
   public List<KinderVo> bestKinderList() {
      return dao.bestKinderList();
   }

}
