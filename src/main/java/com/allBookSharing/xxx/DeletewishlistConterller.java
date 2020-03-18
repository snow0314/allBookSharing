package com.allBookSharing.xxx;

import java.io.IOException;
import java.security.Principal;
import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.allBookSharing.xxx.dto.LikedList;
import com.allBookSharing.xxx.service.MemberManagement;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class DeletewishlistConterller {

   @Autowired
   MemberManagement mm;
   ModelAndView mav;

   
   @RequestMapping(value = "/deletewishlist", produces = "application/json;charset=UTF-8")
   public String deletelist(@RequestBody String json, Principal p) throws JsonParseException, JsonMappingException, IOException {
      ObjectMapper mapper = new ObjectMapper();
      List<LikedList> likedList = Arrays.asList(mapper.readValue(json, LikedList[].class));
      System.out.println("찜목록:" + likedList.toString());

      return mm.deletelikedList(likedList,p);
   }
}