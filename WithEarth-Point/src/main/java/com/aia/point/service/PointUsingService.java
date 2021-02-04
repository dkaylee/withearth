package com.aia.point.service;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.aia.point.dao.CouponDao;
import com.aia.point.dao.PointDao;
import com.aia.point.domain.Coupon;
import com.aia.point.domain.Point;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

@Service
public class PointUsingService {
	
	private PointDao dao;
	
	private CouponDao cdao;
	
	@Autowired
	private SqlSessionTemplate template;
	
	public int usePoint(int idx, int usepoint, HttpServletRequest request, HttpSession session, Model model) throws UnsupportedEncodingException {
		
		dao = template.getMapper(PointDao.class);
		
		int sum = dao.selectPointSum(idx);
		
		Point point = new Point();
		point.setIdx(idx);
		point.setSaving_point(-usepoint);
		point.setSaving_system("포인트 사용");
		point.setPointsum(sum-usepoint);
	
		
		String root = request.getSession().getServletContext().getRealPath("resources");

		String saveDirPath = root + "/coupon";

		// 파일 경로가 없으면 생성하기
		File file = new File(saveDirPath);
		if (!file.exists()) {
			file.mkdirs();
		}

		// 링크로 할 url
		String url = "http://localhost:8080/point/rest/user/coupon/qr";
		// 링크 생성값
		String codeUrl = new String(url.getBytes("utf-8"), "ISO-8859-1");

		String fileName = null;

		// QRcode 색상값
		int qrcodeColor = 0xFF2e4e96;
		// Qrcode 배경색상값
		int qrBackgroundColor = 0xFFFFFFFF;

		// QRCode 생성
		QRCodeWriter codeWriter = new QRCodeWriter();
		BitMatrix matrix;

	
		try {
			
			matrix = codeWriter.encode(codeUrl, BarcodeFormat.QR_CODE, 200, 200);

			MatrixToImageConfig matConfig = new MatrixToImageConfig(qrcodeColor, qrBackgroundColor);
			BufferedImage image = MatrixToImageWriter.toBufferedImage(matrix, matConfig);

			// 파일 이름에 저장한 날짜포함
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			fileName = sdf.format(new Date()) + "_" + idx;

			// 파일 경로, 파일 이름, 파일 확장자에 맞는 파일 생성
			File newFile = new File(saveDirPath, fileName + "png");

			// imageIO를 사용하여 파일쓰기
			ImageIO.write(image, "png", newFile);

		} catch (IOException e) {
			e.printStackTrace();
		} catch (WriterException e) {
			e.printStackTrace();
		}

		Coupon coupon = new Coupon();
		coupon.setCouponHistory("교환권 생성");
		coupon.setCouponQr(fileName);
		coupon.setIdx(idx);
		coupon.setMinusPoint(usepoint);
		
		model.addAttribute("coupon", coupon);
		
		cdao = template.getMapper(CouponDao.class);
		
		dao.insertUsingPoint(point);

		return cdao.insertCoupon(coupon) ;	
	}
	
}
