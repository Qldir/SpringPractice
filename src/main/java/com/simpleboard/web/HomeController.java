package com.simpleboard.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import dao.BoardMapper;
import dao.MemberMapper;
import dto.Board;
import dto.Member;
import util.PageNavigator;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	SqlSession session;
	
	final int countPerPage = 10;
	final int pagePerGroup = 5;
	private static final String UPLOADPATH="D:\\\\tempFile";
	
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
	public String board(@RequestParam(value="page", defaultValue="1") int page, Model model) {
		
		List<Board> boardList = new ArrayList<Board>();
		
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		
		
		
		int total = mapper.getTotal();
		
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, total);
		
		RowBounds rb = new RowBounds(navi.getStartRecord(), navi.getCountPerPage());
		
		boardList = mapper.boardList(rb);
		
		
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("navi", navi);
		
		
		
		return "board";
	}
	
	@RequestMapping(value = "/boardInfo", method = RequestMethod.GET)
	public String boardInfo(Board board, Model model) {
		
		Board boardInfo = new Board();
		
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		boardInfo = mapper.infoBoard(board);
		mapper.updateHits(board);

		model.addAttribute("boardInfo", boardInfo);
		
		
		return "boardInfo";
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
	
	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public String writeForm() {
		
		return "boardWriteForm";
	}
	
	@RequestMapping(value = "/writeboard", method = RequestMethod.POST)
	public String writeBoard(Board board, MultipartFile uploadfile, HttpSession hsession) {
		
		String userId = (String)hsession.getAttribute("userid");
		board.setUserId(userId);
		
		if(uploadfile!=null) {
			UUID uuid=UUID.randomUUID();
			String originalFile = uploadfile.getOriginalFilename();
			String saveName = uuid+"_"+uploadfile.getOriginalFilename();
			
			board.setOriginalFile(originalFile);
			board.setSavedFile(saveName);
			
			File file=new File(UPLOADPATH, saveName);
			
			try {
				uploadfile.transferTo(file);
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		mapper.insertBoard(board);
		
		
		
		return "redirect:/board";
	}
	
	
	
	//다운로드
	
	
	@RequestMapping(value = "/download", method = RequestMethod.GET)
	public void download(Board board, Model model, HttpServletResponse reponse) {
		System.out.println(board);
		Board boardInfo = new Board();
		
		BoardMapper mapper = session.getMapper(BoardMapper.class);
		boardInfo = mapper.infoBoard(board);
		
		System.out.println(boardInfo);
		
		
		try {
			reponse.setHeader("Content-Disposition", "attachment;filename="+URLEncoder.encode(boardInfo.getOriginalFile(), "UTF-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String fullPath=UPLOADPATH+"\\\\"+boardInfo.getSavedFile();
		
		FileInputStream fis=null;
		ServletOutputStream sos=null;
		
		System.out.println(fullPath);
		try {
			
			fis=new FileInputStream(fullPath);
			sos=reponse.getOutputStream();
			
			FileCopyUtils.copy(fis, sos);
			
			fis.close();
			sos.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	
	
}
