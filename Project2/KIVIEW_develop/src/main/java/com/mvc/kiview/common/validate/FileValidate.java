package com.mvc.kiview.common.validate;

import org.springframework.stereotype.Service;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;




@Service
public class FileValidate implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
		
		return false;
	}

	@Override
	public void validate(Object uploadFile, Errors errors) {
		uploadFile file = (uploadFile)uploadFile;
		
		if(file.getFile1().getSize()==0) {
			errors.rejectValue("file1", "errorCode", "파일을 선택해주세요.");
		}
		
		if(file.getFile2().getSize()==0) {
			errors.rejectValue("file2", "errorCode", "파일을 선택해주세요.");
		}
		
		
		
	}
	
	

}
