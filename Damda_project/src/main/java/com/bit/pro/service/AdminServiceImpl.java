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
import com.bit.pro.dao.ItemDao;
import com.bit.pro.dao.PhotoDao;
import com.bit.pro.util.UploadFileUtil;
import com.bit.pro.vo.AllItemVo;
import com.bit.pro.vo.PhotoVo;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
   
   private static final Logger logger = LoggerFactory.getLogger(AdminServiceImpl.class);

   @Resource(name="photoDao")
   private PhotoDao photoDao;
   
   @Resource(name="itemDao")
   private ItemDao itemDao;
   
   @Resource(name="uploadPath")
   private String uploadPath;
   
   @Transactional
   @Override
   public int insertAllitem(AllItemVo allitemVo, PhotoVo photoVo, MultipartHttpServletRequest multi) throws Exception {
      //���� �޼ҵ�� �Ű����� ����
      //���߾��ε�
      //uploadPath-> C:\java\project\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\Damda_project\resources
      
      //�̹���ī�װ�(photoCtg)������ ������ ���� ������ �ٸ����ϱ�
      String whichFolder   = null;
      int photoCtg = photoVo.getPhotoCtg();
      System.out.println("//��쳪���� salad,dessert,beverage,ingredient"+photoCtg);
      //ī�װ����� ������ ����Ǵ� ���� ������ salad,dessert,beverage,ingredient
      if(photoCtg==1) {
         whichFolder = "salad";
      }else if(photoCtg==2) {
         whichFolder = "dessert";
      }else if(photoCtg==3) {
         whichFolder = "beverage"; 
      }
      String imgUploadPath = uploadPath + File.separator + whichFolder + File.separator;
   
      //���߾��ε��� ���� ������� �ϳ��� �̾Ƴ��� ������ ����
      int count = 0;
      int sqlResult = 0;
      
      Iterator<String> files = multi.getFileNames();
      while(files.hasNext()) {
         String uploadFile = files.next();

         MultipartFile mFile = multi.getFile(uploadFile);
         String originalName  = mFile.getOriginalFilename();
         
         if(originalName!="") {
            //UploadFileUtilŬ������ fileUpload�޼ҵ带 ���� ������ ������ ������ �����ϰ� ������ ����
            //������� �̹��� �̸��տ� 's_'�� �ٰ� �������� 'd_'�� �ٴ´�
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
               photoPath = imgUploadPath + fileName;
               allitemVo.setCategory(photoCtg);
               sqlResult = itemDao.insertItem(allitemVo);
               
            }else {
               photoCtg2 = "detail";
               photoPath = imgUploadPath + fileName;   
            }
               
            //photoVo�� �Ķ���� set
            photoVo.setPhotoCtg2(photoCtg2);
            photoVo.setPhotoCtg(photoCtg);
            photoVo.setPhotoPath(photoPath);
            photoVo.setPhotoName(fileName);
            photoVo.setOriginalName(originalName);
            
            //DB�� ������ �ֱ�(������ max������ �ֱ�)            
            sqlResult= photoDao.insertPhoto(photoVo); 
             

         }else if (originalName==""&& count==0) {
            allitemVo.setCategory(photoCtg);
            sqlResult = itemDao.insertItem(allitemVo);
         }
         count++;
      }
      return sqlResult;
   }   
}