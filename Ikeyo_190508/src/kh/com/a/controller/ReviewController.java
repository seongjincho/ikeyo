package kh.com.a.controller;

import java.io.File;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kh.com.a.model.ReviewDto;
import kh.com.a.service.ProductService;
import kh.com.a.service.ReviewService;
import kh.com.a.util.FUpUtil;

@Controller
public class ReviewController {
	private static final Logger logger = LoggerFactory.getLogger(ReviewController.class);

	@Autowired
	ReviewService reviewService;

	@Autowired
	ProductService productService;

	// 상품평 등록
	@RequestMapping(value="reviewWriteAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String reviewWrite(ReviewDto rdto,
			@RequestParam(value="fileload", required = false)MultipartFile fileload, Model model ) {
		System.out.println(rdto.toString());

		// 파일이름 취득
		String filename = fileload.getOriginalFilename();

		rdto.setPhoto_bf(filename);
		// file
		String fupload = "c:\\final_file";

		try {
			if(filename != null && filename != "") {
				// 파일명.xxx -> 12221321.xxx
				String f = rdto.getPhoto_bf();
				String newfilename = FUpUtil.getNewFile(f);	
				rdto.setPhoto_af(newfilename);

				File file = new File(fupload + "/" + newfilename);	// 파일을 생성	
				// 실제 파일 업로드 부분 
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());

				System.out.println("upload 파일경로 : " + fupload + "/" + newfilename);
			}
			// DB에 저장
			reviewService.reviewWrite(rdto);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return "redirect:/productDetail.do?model_id=" + rdto.getModel_id()+"";
	}

	// 상품수정 폼에 넣어줄것
	@ResponseBody
	@RequestMapping(value="getreview.do", method= {RequestMethod.GET, RequestMethod.POST})
	public Map<String, Object> productinput(int rev_seq) {
		//System.out.println("inven_seq : " + inven_seq);
		Map<String, Object> revmap = new HashMap<String, Object>();

		ReviewDto dto = reviewService.getreview(rev_seq);
		//System.out.println("inven.model_id : " + inven.getModel_id());
		revmap.put("title", dto.getTitle());
		revmap.put("content", dto.getContent());
		revmap.put("starpoint", dto.getStarpoint());

		return revmap;
	}

	// 상품평 수정 
	@RequestMapping(value="reviewUpdate.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String reviewUpdate(ReviewDto rdto,
			@RequestParam(value="fileload", required = false)MultipartFile fileload, Model model ) {
		System.out.println(rdto.toString());

		// 파일이름 취득
		String filename = fileload.getOriginalFilename();

		rdto.setPhoto_bf(filename);
		// file
		String fupload = "c:\\final_file";

		try {
			if(filename != null && filename != "") {
				// 파일명.xxx -> 12221321.xxx
				String f = rdto.getPhoto_bf();
				String newfilename = FUpUtil.getNewFile(f);	
				rdto.setPhoto_af(newfilename);

				File file = new File(fupload + "/" + newfilename);	// 파일을 생성	
				// 실제 파일 업로드 부분 
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());

				System.out.println("upload 파일경로 : " + fupload + "/" + newfilename);
			}
			// DB에 저장
			reviewService.reviewUpdate(rdto);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return "redirect:/productDetail.do?model_id=" + rdto.getModel_id()+"";
	}

	/*마이페이지 상품평업데이트*/
	@RequestMapping(value="reviewUpdateMy.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String reviewUpdateMy(ReviewDto rdto,
			@RequestParam(value="fileload", required = false)MultipartFile fileload, Model model ) {
		System.out.println(rdto.toString());

		// 파일이름 취득
		String filename = fileload.getOriginalFilename();

		rdto.setPhoto_bf(filename);
		// file
		String fupload = "c:\\final_file";

		try {
			if(filename != null && filename != "") {
				// 파일명.xxx -> 12221321.xxx
				String f = rdto.getPhoto_bf();
				String newfilename = FUpUtil.getNewFile(f);	
				rdto.setPhoto_af(newfilename);

				File file = new File(fupload + "/" + newfilename);	// 파일을 생성	
				// 실제 파일 업로드 부분 
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());

				System.out.println("upload 파일경로 : " + fupload + "/" + newfilename);
			}
			// DB에 저장
			reviewService.reviewUpdate(rdto);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}

		return "redirect:/myReview.do";
	}
	
	/*마이페이지 상품평 삭제*/
	@RequestMapping(value="reviewDeleteMy.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String reviewDeleteMy(ReviewDto dto, Model model) {
		logger.info("reviewDeleteMy() RUN! / Run Time: " + new Date());
		
		System.out.println("리뷰삭제 seq확인=" + dto.getRev_seq());
		
		reviewService.reviewDeleteMy(dto);
		
		return "redirect:/myReview.do";
	}
}
