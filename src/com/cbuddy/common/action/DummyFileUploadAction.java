package com.cbuddy.common.action;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;

public class DummyFileUploadAction extends ActionSupport{
	
	private File[] fileUpload;
    private String[] fileUploadFileName;
    private String[] fileUploadContentType;
 
   
	public File[] getFileUpload() {
		return fileUpload;
	}

	public void setFileUpload(File[] fileUpload) {
		this.fileUpload = fileUpload;
	}

	public String[] getFileUploadFileName() {
		return fileUploadFileName;
	}

	public void setFileUploadFileName(String[] fileUploadFileName) {
		this.fileUploadFileName = fileUploadFileName;
	}

	public String[] getFileUploadContentType() {
		return fileUploadContentType;
	}

	public void setFileUploadContentType(String[] fileUploadContentType) {
		this.fileUploadContentType = fileUploadContentType;
	}

	@Override
    public void validate() {
		System.out.println("n "+fileUpload);
        if (null == fileUpload) {
        	System.out.println("DummyFileUploadAction.validate()");
            //addActionMessage("You must select at least one file!");
        }
    }
	
	public String uplaod(){
		return "success";
	}
	public String execute() throws Exception{
	 System.out.println("cndjcj");
	for (File file: fileUpload) {
	System.out.println("File :" + file);
	}
	 
	for (String fileContentType: fileUploadContentType) {
	System.out.println("File type : " + fileContentType);
	}
	 
	return SUCCESS;
	 
	} 
}
