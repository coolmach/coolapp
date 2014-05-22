package com.cbuddy.beans; 


import java.sql.Timestamp;
import javax.persistence.*;

@Entity
@Table(name = "Ppic")

public class Ppic {

	private long PicId;
	private int PostId;
	private String SNo;
	private byte[] MainPic;
	private byte[] ThumbnailPic;
	private String PicType;
	private Timestamp CreatedOn;
	private String CreatedBy;
	private Timestamp ModifiedOn;
	private String ModifiedBy;

	@Id
	@GeneratedValue	
	@Column(name="PIC_ID")
	public long getPicId(){
		return this.PicId;
	}
	public void setPicId(long PicId){
		this.PicId = PicId;
	}

	@Column(name="POST_ID")
	public int getPostId(){
		return this.PostId;
	}
	public void setPostId(int PostId){
		this.PostId = PostId;
	}

	@Column(name="S_NO")
	public String getSNo(){
		return this.SNo;
	}
	public void setSNo(String SNo){
		this.SNo = SNo;
	}

	@Column(name="MAIN_PIC")
	public byte[] getMainPic(){
		return this.MainPic;
	}
	public void setMainPic(byte[] MainPic){
		this.MainPic = MainPic;
	}

	@Column(name="THUMBNAIL_PIC")
	public byte[] getThumbnailPic(){
		return this.ThumbnailPic;
	}
	public void setThumbnailPic(byte[] ThumbnailPic){
		this.ThumbnailPic = ThumbnailPic;
	}

	@Column(name="PIC_TYPE")
	public String getPicType(){
		return this.PicType;
	}
	public void setPicType(String PicType){
		this.PicType = PicType;
	}

	@Column(name="CREATED_ON")
	public Timestamp getCreatedOn(){
		return this.CreatedOn ;
	}
	public void setCreatedOn(Timestamp CreatedOn){
		this.CreatedOn = CreatedOn;
	}

	@Column(name="CREATED_BY")
	public String getCreatedBy(){
		return this.CreatedBy;
	}
	public void setCreatedBy(String CreatedBy){
		this.CreatedBy = CreatedBy;
	}

	@Column(name="MODIFIED_ON")
	public Timestamp getModifiedOn(){
		return this.ModifiedOn ;
	}
	public void setModifiedOn(Timestamp ModifiedOn){
		this.ModifiedOn = ModifiedOn;
	}

	@Column(name="MODIFIED_BY")
	public String getModifiedBy(){
		return this.ModifiedBy;
	}
	public void setModifiedBy(String ModifiedBy){
		this.ModifiedBy = ModifiedBy;
	}
}
