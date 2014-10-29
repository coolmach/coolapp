package com.cbuddy.posts.util;

import java.io.File;
import java.sql.Timestamp;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.hibernate.Session;

import com.cbuddy.beans.Pact;
import com.cbuddy.beans.Poit;
import com.cbuddy.posts.model.CommonDetailsForPost;
import com.cbuddy.user.model.User;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.LocationUtil;

public class PostsUtil {
	
	public Poit createPOIT(CommonDetailsForPost postDetails, User user, Session dbSession, String uploadContentType[], String category){
		String userId = String.valueOf(user.getUserId());
		Timestamp current = new Timestamp(System.currentTimeMillis());
		String imgFileName = null;
		String imgType = null;
		int noOfImages = 0;
		if(uploadContentType != null && uploadContentType.length>0){
			imgFileName = String.valueOf(System.currentTimeMillis()) + "." + getExtension(uploadContentType[0]) + "";
			imgType = getExtension(uploadContentType[0]);
			noOfImages = uploadContentType.length;
		}

		String contactNumber = postDetails.getContactNo();
		if(contactNumber != null){
			contactNumber = contactNumber.replace("  ", " ");
		}
		
		Poit poit = new Poit();
		poit.setCategory(category);
		poit.setTitle(postDetails.getTitle());
		poit.setCity(postDetails.getCity());
		poit.setContactNo(contactNumber);
		poit.setContactPersonName(postDetails.getContactPersonName());
		poit.setCorpId(user.getCorpId());
		poit.setCreatedBy(userId);
		poit.setCreatedOn(current);
		poit.setDescription(postDetails.getDescription());
		poit.setImageFileName(imgFileName);
		poit.setImageType(imgType);
		poit.setLocation(postDetails.getLocation());
		poit.setModifiedBy(userId);
		poit.setModifiedOn(current);
		poit.setNegotiable(null);
		poit.setPrice(postDetails.getPrice());
		poit.setRating(0);
		poit.setSubCategory(postDetails.getSubCategory());
		poit.setThumbnailName(null);
		poit.setThumbnailType(null);
		poit.setUserFirstName(user.getFirstName());
		poit.setPostStatus(user.getStatus());
		poit.setNegotiable(postDetails.getNegotiable()!=null && postDetails.getNegotiable().equals("true")?"Y":null);

		poit.setNoOfImages(noOfImages);
		
		dbSession.save(poit);

		if(poit.getPostStatus() == CBuddyConstants.USER_STATUS_PENDING_VERIFICATION){
			updatePostsToBeActivated(user, poit.getPostId(), dbSession);
		}

		return poit;
	}

	private String getExtension(String contentType){
		String extension = contentType;
		if(contentType != null){
			int indexSlash = contentType.indexOf("/");
			if(indexSlash>=0){
				extension = contentType.substring(indexSlash + 1);
			}
		}
		return extension;
	}

	private void updatePostsToBeActivated(User user, int postId, Session dbSession){
		//Create a record for activation
		Pact pact = new Pact();
		//Generate Activation Code
		pact.setCreatedOn(new Timestamp(System.currentTimeMillis()));
		pact.setActivationStatus(CBuddyConstants.USER_STATUS_PENDING_VERIFICATION);
		pact.setRecordId(String.valueOf(user.getUserId()));
		pact.setUserId(user.getUserId());
		pact.setPostId(postId);
		pact.setActivationCode(user.getActivationCode());

		dbSession.save(pact);
	}

	public void populateAdditionalDetailsForPoit(Session dbSession, List<Poit> adList){
		if(adList != null){
			for(Poit postDetails:adList){
				String cityName = LocationUtil.getCityName(dbSession, postDetails.getCity());
				String locName = LocationUtil.getLocationName(dbSession, postDetails.getCity(), postDetails.getLocation());
				postDetails.setCity(cityName);
				postDetails.setLocation(locName);
				//.setPriceStr(NumberFormatterUtil.formatAmount(postDetails.getPrice()));
				if(postDetails.getDescription()!=null && postDetails.getDescription().length() > 80){
					postDetails.setDescription(postDetails.getDescription().substring(0,80) + "...");
				}
			}
		}
	}

	public void writeImage(File[] inputFiles, String outputFileName){
		String filePath = "C:\\Shiva\\";
		//String filePath = request.getSession().getServletContext().getRealPath("");
		File outputFile = null;

		try {
			String tempFileName = "";
			for(int index=0; index<inputFiles.length; index++){
				tempFileName = outputFileName;
				File file = inputFiles[index];
				if(index>0){
					tempFileName = tempFileName.replace(".", "_" + index + "."); //Adding _1, _2, etc. to file name - Test_1.jpg, Test_2.jpg. First file will be just Test.jpg
				}
				outputFile = new File(filePath + "/images/posts", tempFileName);
				FileUtils.copyFile(file, outputFile);	
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
