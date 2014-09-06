package com.cbuddy.common.action;

import java.io.File;

import com.opensymphony.xwork2.ActionSupport;

public class DummyFileUploadAction extends ActionSupport{
	
	private File[] upload;
    private String[] uploadFileName;
    private String[] uploadContentType;
 
   
	public File[] getUpload() {
		return upload;
	}

	public void setUpload(File[] fileUpload) {
		this.upload = fileUpload;
	}

	public String[] getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String[] fileUploadFileName) {
		this.uploadFileName = fileUploadFileName;
	}

	public String[] getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String[] fileUploadContentType) {
		this.uploadContentType = fileUploadContentType;
	}

	@Override
    public void validate() {
		System.out.println("n "+upload);
        if (null == upload) {
        	System.out.println("DummyFileUploadAction.validate()");
            //addActionMessage("You must select at least one file!");
        }
    }
	
	public String uplaod(){
		return "success";
	}
	public String execute() throws Exception{
	 System.out.println("cndjcj");
	for (File file: upload) {
	System.out.println("File :" + file);
	}
	 
	for (String fileContentType: uploadContentType) {
	System.out.println("File type : " + fileContentType);
	}
	 
	return SUCCESS;
	 
	} 
}
