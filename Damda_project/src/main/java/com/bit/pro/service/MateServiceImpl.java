package com.bit.pro.service;

import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.bit.pro.dao.MateDao;
import com.bit.pro.dao.PhotoDao;
import com.bit.pro.util.UploadFileUtil;
import com.bit.pro.util.pagination;
import com.bit.pro.vo.MateVo;
import com.bit.pro.vo.PhotoVo;

@Service("MateService")
public class MateServiceImpl implements MateService{
	private static final Logger logger= LoggerFactory.getLogger(MateServiceImpl.class);
	
	@Inject
	private MateDao mateDao;
	
	//�߰�
	@Resource(name="photoDao")
	private PhotoDao photoDao;
	
	@Override
	public List<MateVo> selectMateAll(pagination pagination) {
		return mateDao.selectMateAll(pagination);
	}

	@Autowired
	ServletContext servletContext;
		
	@Override
	public int insertMate(MateVo mateVo, PhotoVo photoVo, MultipartHttpServletRequest multi) throws IOException, Exception {
		String upload = servletContext.getRealPath("/resources/imgs/ingredient");
		String imgUploadPath = upload; //��������
		String imgUploadPath2 = "/resources/imgs/ingredient/"; //DB����
		int sqlResult=0;
		int count=0;
		sqlResult = mateDao.insertMate(mateVo);	//�ڷ�ְ�
		//���ϵ��� ���� ������[] []
		Iterator<String> files = multi.getFileNames();
		for(count = 0; count<2;count++) {//�ΰ��� ������ �ݺ����� ���� �� Ǯ��
			String uploadFile = files.next();
			MultipartFile mfile = multi.getFile(uploadFile);
			String fileName = null;
			if(mfile != null) {//÷�ο���
				fileName = UploadFileUtil.fileUpload(imgUploadPath, mfile.getOriginalFilename(), mfile.getBytes(),count);
			}else {
				fileName = upload+"/resources/imgs/fail/";
			}
			//���� ������ �̸� ����
			String photoCtg2 = "";
			String photoPath2 = null;//db�ֱ��
			if(count==0) {
				System.out.println("����� �̸�"+fileName);
				photoCtg2 = "thumbnail";
				photoPath2 = imgUploadPath2 +fileName;
				photoVo.setPhotoCtg2(photoCtg2);//thumnail
				photoVo.setPhotoPath(photoPath2);//db����¥�ֱ�
				photoVo.setPhotoName(fileName);
				photoVo.setOriginalName(mfile.getOriginalFilename());
				sqlResult=photoDao.insertMatePhoto(photoVo);//db�� ������	
			}else if(count==1) {
				System.out.println("������ �̸�"+fileName);
				photoCtg2 = "detail";
				photoPath2 = imgUploadPath2 +fileName;
				photoVo.setPhotoCtg2(photoCtg2);
				photoVo.setPhotoPath(photoPath2);//db����¥�ֱ�
				photoVo.setPhotoName(fileName);
				photoVo.setOriginalName(mfile.getOriginalFilename());
				sqlResult=photoDao.insertMatePhoto(photoVo);//db�� ������
			}
			if (mfile.getOriginalFilename()=="") {
				sqlResult=mateDao.insertMate(mateVo);//�ߺ��̸��̸� �ڷḸ �ֱ�
				logger.info("�ߺ�mate>>>>>>>>>>:"+mateDao.insertMate(mateVo));
			}
		}		
		return sqlResult;
	}

	@Override
	public List<MateVo> selectMateOne(int matenum, PhotoVo photoVo, Model model){
//		model.addAttribute("mateone",mateDao.selectMateOne(matenum));
//		for(int i=0;i<2;i++) {
//			model.addAttribute("mateone["+i+"]",mateDao.selectMateOne(matenum));
//		}
		return mateDao.selectMateOne(matenum);
	}

	@Override
	public void updateMate(MateVo mateVo) {
		mateDao.updateMate(mateVo);
	}

	@Override
	public void deleteMate(int matenum) {
		mateDao.deleteMate(matenum);
	}

	@Override
	public int selectMateAllCnt() {
		return mateDao.selectMateAllCnt();
	}

	
	
}
