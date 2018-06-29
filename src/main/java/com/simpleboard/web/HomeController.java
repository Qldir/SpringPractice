package com.simpleboard.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import dao.BoardMapper;
import dao.MemberMapper;
import dto.Board;
import dto.Member;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	SqlSession session;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "home";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member member, HttpSession hsession) {
		
		System.out.println(member);
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		Member user = mapper.login(member);
		
		hsession.setAttribute("userid", user.getUserid());
		hsession.setAttribute("username", user.getUsername());
		
		return "redirect:/board";
	}
	
	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(Model model) {
		
		List<Board> boardList = new ArrayList<Board>();
		
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		boardList = mapper.boardList();
		
		System.out.println(boardList);
		model.addAttribute("boardList", boardList);
		
		return "board";
	}

	
	
	@RequestMapping(value = "/contact", method = RequestMethod.POST)
	public String contact() {
		
		return "contact";
	}
	
	@RequestMapping(value = "/registration", method = RequestMethod.POST)
	public String registration(Member member) {
		
		System.out.println(member);
		
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		mapper.insertMember(member);
		
		return "redirect:/";
	}
	
	@RequestMapping(value = "/writeForm", method = RequestMethod.POST)
	public String writeForm() {
		
		return "boardWriteForm";
	}
	
	
}
