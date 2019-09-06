package com.bit.pro.service;

import java.io.File;
import java.util.Iterator;
import javax.annotation.Resource;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import com.bit.pro.dao.AllitemDao;
import com.bit.pro.dao.PhotoDao;
import com.bit.pro.util.UploadFileUtil;
import com.bit.pro.vo.AllItemVo;
import com.bit.pro.vo.PhotoVo;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);

	@Resource(name="photoDao")
	private PhotoDao photoDao;
	
	@Resource(name="allitemDao")
	private AllitemDao allitemDao;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	@Transactional
	@Override
	public int insertAllitem(AllItemVo allitemVo, PhotoVo photoVo, MultipartHttpServletRequest multi) throws Exception {
		//서비스 메소드로 매개변수 보내
		//다중업로드
		//uploadPath-> C:\java\project\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Damda_project\resources
		
		//이미지카테고리(photoCtg)값따라 사진이 들어가는 폴더가 다르게하기
		String whichFolder	= null;
		int photoCtg = photoVo.getPhotoCtg();
		if(photoCtg==1) {
			whichFolder = "salad"; //경우나누기 salad,dessert,beverage,ingredient
		}else if(photoCtg==2) {
			whichFolder = "dessert";
		}else if(photoCtg==3) {
			whichFolder = "beverage";
		}else if(photoCtg==4) {
			whichFolder = "ingredient";
			System.out.println("44"+photoCtg);
		}
		System.out.println("sss"+photoCtg);
		String imgUploadPath = uploadPath + File.separator + whichFolder;
	
		//다중업로드한 파일 순서대로 하나씩 뽑아내서 폴더에 생성
		int count = 0;
		int sqlResult = 0;
		
		Iterator<String> files = multi.getFileNames();
		while(files.hasNext()) {
			String uploadFile = files.next();

			MultipartFile mFile = multi.getFile(uploadFile);
			String originalName  = mFile.getOriginalFilename();
			
			if(originalName!="") {
				//UploadFileUtil클래스의 fileUpload메소드를 통해 파일을 저장할 폴더를 생성하고 사진을 저장
				//썸네일은 이미지 이름앞에 's_'가 붙고 디테일은 'd_'가 붙는다
				String fileName = null;
				if(mFile != null) {
				 fileName =  UploadFileUtil.fileUpload(imgUploadPath, mFile.getOriginalFilename(), mFile.getBytes(),count); 
				} else {
				 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
				}
				
				String photoCtg2 = null;
				String photoPath = null;
				
				if(count==0){
					photoCtg2 = "thumbnail";
					photoPath = imgUploadPath + "s_" + fileName;
					allitemVo.setCategory(photoCtg);
					sqlResult = allitemDao.insertItem(allitemVo);
					
				}else {
					photoCtg2 = "detail";
					photoPath = imgUploadPath + "d_" + fileName;	
				}
					
				//photoVo에 파라미터 set
				photoVo.setPhotoCtg2(photoCtg2);
				photoVo.setPhotoCtg(photoCtg);
				photoVo.setPhotoPath(photoPath);
				photoVo.setPhotoName(fileName);
				photoVo.setOriginalName(originalName);
				
				//DB에 데이터 넣기(사진만 max개까지 넣기)
				sqlResult= photoDao.insertPhoto(photoVo); 
				 

			}else if (originalName==""&& count==0) {
				allitemVo.setCategory(photoCtg);
				sqlResult = allitemDao.insertItem(allitemVo);
			}
			count++;
		}
		return sqlResult;
	}	
}
