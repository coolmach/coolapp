
 
import java.io.File;
import java.io.IOException;
 

import org.apache.commons.io.FileUtils;

import com.opensymphony.xwork2.ActionSupport;
 
public class MultipleFilesUploadAction extends ActionSupport{
    private File[] fileUpload;
    private String[] fileUploadFileName;
    private String[] fileUploadContentType;
     
    /**
     * This is the path to save uploaded file, which is configured in struts.xml
     */
    private String saveDirectory;
 
    public String doUpload() {
 
        // copy the uploaded files into pre-configured location
        for (int i = 0; i < fileUpload.length; i++) {
            File uploadedFile = fileUpload[i];
            String fileName = fileUploadFileName[i];
            File destFile = new File(saveDirectory + File.separator + fileName);
            try {
                FileUtils.copyFile(uploadedFile, destFile);
            } catch (IOException ex) {
                System.out.println("Could not copy file " + fileName);
                ex.printStackTrace();
            }
        }
         
        return "success";
    }
     
    public File[] getFileUpload() {
        return fileUpload;
    }
 
    public void setFileUpload(File[] fileUploads) {
        this.fileUpload = fileUploads;
    }
 
    public String[] getFileUploadFileName() {
        return fileUploadFileName;
    }
 
    public void setFileUploadFileName(String[] fileUploadFileNames) {
        this.fileUploadFileName = fileUploadFileNames;
    }
 
    public String[] getFileUploadContentType() {
        return fileUploadContentType;
    }
 
    public void setFileUploadContentType(String[] fileUploadContentTypes) {
        this.fileUploadContentType = fileUploadContentTypes;
    }
 
    public String getSaveDirectory() {
        return saveDirectory;
    }
 
    public void setSaveDirectory(String saveDir) {
        this.saveDirectory = saveDir;
    }
}