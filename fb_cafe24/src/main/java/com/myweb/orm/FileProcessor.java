package com.myweb.orm;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.tika.Tika;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.myweb.domain.FilesVO;
import com.myweb.persistence.files.FilesDAORule;

import net.coobird.thumbnailator.Thumbnails;

@Component
public class FileProcessor {
	private static Logger logger = LoggerFactory.getLogger(FileProcessor.class);
	
	@Inject
	private FilesDAORule fdao;

	public int upload_file(MultipartFile[] files, int pno) {
		final String UP_DIR = "C:\\javaworkspace\\_spring\\workspace\\upload";
		
		// upload/2021/06/28/uuid_fname.jpg => if 이미지 : uuid_th_fname.jpg
		
		LocalDate date = LocalDate.now(); //w3school > java
		String today = date.toString(); // 2021-09-20
		today = today.replace("-", File.separator); // 2021\\09\\20
		
		File folder = new File(UP_DIR, today);
		
		if(!folder.exists()) folder.mkdirs();
		
		int isUp = 1;
		
		for (MultipartFile f : files) {
			FilesVO fvo = new FilesVO();
//			today = today.replace("\\","/");
			fvo.setSavedir(today);
			
			String originalFileName = f.getOriginalFilename();
			logger.info(">>> originalFileName ? : " +originalFileName);
						
			fvo.setFname(originalFileName);
			
			UUID uuid = UUID.randomUUID();
			fvo.setUuid(uuid.toString());
			
			String fullFileName = uuid.toString() + "_" + originalFileName;
			File storeFile = new File(folder, fullFileName);
						
			try {
				f.transferTo(storeFile);
				
				if(isImageFile(storeFile)) {
					fvo.setFtype(1);
					File thumbnail = new File(folder, uuid.toString()+"_th_"+ originalFileName);
					Thumbnails.of(storeFile).size(300,300).toFile(thumbnail);
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			fvo.setPno(pno);
			isUp *= fdao.insert(fvo);
		}
		return isUp;
	}

	private boolean isImageFile(File storeFile) {
		try {
			String mimeType = new Tika().detect(storeFile);
			return mimeType.startsWith("image") ? true : false; 
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}
	
	public List<FilesVO> list_file() {
		return fdao.selectList();
	}
	
	public List<FilesVO> list_file(int pno) {
		return fdao.selectList(pno);
	}
	
	public int deleteFile(int pno) {
		return fdao.delete(pno); 
	}

}
