package com.myshop.product;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ProductController {
	@Autowired
	private ProductService service;

	@GetMapping("/product")
	public ModelAndView allList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/product/productList");
		ArrayList<Product> list = service.getAll();
		String path = request.getServletContext().getRealPath("\\resources\\image") + "\\";
		for (int i = 0; i < list.size(); i++) {
			String path1 = path + list.get(i).getNum() + "\\";
			File imgDir = new File(path1);
			if (imgDir.exists()) {
				String[] files = imgDir.list();
				for (int j = 0; j < files.length; j++) {
					list.get(i).setFiles(files);
				}
			}
		}

		mv.addObject("list", list);
		return mv;
	}

	@GetMapping("/product/add")
	public String addProduct() {
		return "/product/addProduct";
	}

	@GetMapping("/product/edit")
	public String editProduct() {
		return "/product/viewProduct";
	}

	@RequestMapping("/img")
	public ResponseEntity<byte[]> getImg(String fname, int num, HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("\\resources\\image") + "\\" + num + "\\" + fname;
		File f = new File(path);
		HttpHeaders header = new HttpHeaders();
		ResponseEntity<byte[]> result = null;
		try {
			header.add("Content-Type", Files.probeContentType(f.toPath()));
			result = new ResponseEntity<>(FileCopyUtils.copyToByteArray(f), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}

		return result;
	}

	@PostMapping("/product/add")
	public ModelAndView addProduct(Product p, MultipartHttpServletRequest request) {
		ModelAndView mv = new ModelAndView("redirect:/");
		p.setNum(service.getSequence());
		p.setProduct_image("");
		List<MultipartFile> fList = new ArrayList<MultipartFile>();

		if (request.getFiles("file").get(0).getSize() != 0) {
			fList = request.getFiles("file");
		}

		String path = request.getServletContext().getRealPath("\\resources\\image\\" + p.getNum());
		File dir = new File(path);
		if (!dir.exists()) {
			dir.mkdirs();
		}

		fileUpload(path, fList);

		p.setProduct_image("\\resources\\image\\" + p.getNum());
		p.setDiscount(0);
		service.addProduct(p);

		return mv;
	}

	// 파일 업로드
	public void fileUpload(String path, List<MultipartFile> list) {
		for (MultipartFile m : list) {
			String originFileName = m.getOriginalFilename();
			String file1 = path + "\\" + originFileName;
			try {
				m.transferTo(new File(file1));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}