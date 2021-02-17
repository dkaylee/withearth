package com.withearth.tumbler.controller;



import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.withearth.tumbler.domain.CafeRequest;
 
@Controller
public class MakeQRController {
   

	@Autowired
	private SqlSessionTemplate template;

	int result = 0;
	 @RequestMapping("/qr/{cafe_idx}") 
	public String makeqr(HttpServletRequest request, 
			HttpSession session,
			Model model,
			  @PathVariable("cafe_idx") int cafeIdx,
			CafeRequest cafeRequest)throws IOException, WriterException {
		
      String root = request.getSession().getServletContext().getRealPath("resources"); //현재 서비스가 돌아가고 있는 서블릿 경로의 resources 폴더 찾기
      String savePath = root + "\\qrCodes\\"; // 파일 경로
      
      
      //포인트 
//      int point = 100;
      int cafe_idx = 54;
      
      //파일 경로가 없으면 생성하기
      File file = new File(savePath); 
      if(!file.exists()) { 
             file.mkdirs(); 
      }  
       
      
      
       // 링크로 할 URL주소 
       //String url = "http://localhost:8080/tumbler/qr/tumLogin"+storeName; 
      
     String url = "http://192.168.219.106:8080/qr/"+cafe_idx;

    System.out.println(url);
      
      System.out.println("카페"+url);
      
        // 링크 생성값
       String codeurl = new String(url.getBytes("UTF-8"), "ISO-8859-1"); 

       // QRCode 색상값
       int qrcodeColor =   0xFF2e4e96; 
       // QRCode 배경색상값  
       int backgroundColor = 0xFFFFFFFF; 
            
       //QRCode 생성
       QRCodeWriter qrCodeWriter = new QRCodeWriter();  
       BitMatrix bitMatrix = qrCodeWriter.encode(codeurl, BarcodeFormat.QR_CODE,200, 200);    // 200,200은 width, height
     
       MatrixToImageConfig matrixToImageConfig = new MatrixToImageConfig(qrcodeColor,backgroundColor); 
       BufferedImage bufferedImage = MatrixToImageWriter.toBufferedImage(bitMatrix,matrixToImageConfig); 
       
       //파일 이름에 저장한 날짜를 포함해주기 위해 date생성
       SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss"); 
       String qrcode =cafe_idx+"스타벅스점";  
       
       //파일 경로, 파일 이름 , 파일 확장자에 맡는 파일 생성
       File temp =  new File(savePath +sdf+".png");  
       
       System.out.println("파일경로>>>>>>>>"+temp);
      System.out.println(qrcode);
      // result = dao.insertQRcode(qrcode);
       
    
       // ImageIO를 사용하여 파일쓰기 
       ImageIO.write(bufferedImage, "png",temp); 
      
       //리턴은 사용자가 원하는 값을 리턴한다. 
 
      return "tumbler/tumlist"; 
	 }
 }
