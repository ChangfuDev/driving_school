package service;

import org.springframework.web.multipart.MultipartFile;

public interface IExcelService {

	String readExcelFile(MultipartFile file);

}
