package com.cbuddy.posts.util;

import java.sql.Timestamp;

import org.hibernate.Session;

import com.cbuddy.beans.Pact;
import com.cbuddy.beans.Poit;
import com.cbuddy.posts.model.CommonDetailsForPost;
import com.cbuddy.user.model.User;
import com.cbuddy.util.CBuddyConstants;

public class PostsUtil {
	public Poit createPOIT(CommonDetailsForPost postDetails, User user, Session dbSession, String uploadContentType, String category){
		String userId = String.valueOf(user.getUserId());
		Timestamp current = new Timestamp(System.currentTimeMillis());
		String imgFileName = String.valueOf(System.currentTimeMillis()) + "." + getExtension(uploadContentType) + "";

		Poit poit = new Poit();
		poit.setCategory(category);
		poit.setTitle(postDetails.getTitle());
		poit.setCity(postDetails.getCity());
		poit.setContactNo(postDetails.getContactNo());
		poit.setContactPersonName(postDetails.getContactPersonName());
		poit.setCorpId(user.getCorpId());
		poit.setCreatedBy(userId);
		poit.setCreatedOn(current);
		poit.setDescription(postDetails.getDescription());
		poit.setImageFileName(imgFileName);
		poit.setImageType(getExtension(uploadContentType));
		poit.setLocation(postDetails.getSelectedLocationCode());
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
}
