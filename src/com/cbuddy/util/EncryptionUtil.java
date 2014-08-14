package com.cbuddy.util;

import java.security.MessageDigest;

import javax.crypto.Cipher;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class EncryptionUtil {

	public EncryptionUtil() {

	}

	public static String encrypt(String plainText){
		try{
			Cipher cipher = getCipher(Cipher.ENCRYPT_MODE);
			final byte[] plainTextBytes = plainText.getBytes("utf-8");
			final byte[] cipherText = cipher.doFinal(plainTextBytes);
			final String encodedCipherText = new String(Base64.encodeBase64(cipherText), "UTF-8");
			return encodedCipherText;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return plainText;
	}


	public static void main(String[] args){
		String p = "activationCode=1299@kdfkd&personalEmailId=sh@gmail.com";
		String e = EncryptionUtil.encrypt(p);
		System.out.println(e);
		String d = EncryptionUtil.decrypt(e);
		System.out.println(d);
		//new EncryptionUtil().test();
	}

	public static String decrypt(String inData){
		String output = inData;
		try{
			Cipher cipher = getCipher(Cipher.DECRYPT_MODE);
			final byte[] plainTextBytes = Base64.decodeBase64(inData);
			byte[] cipherText = cipher.doFinal(plainTextBytes);
			output = new String(cipherText, "UTF-8");
		}catch(Exception e) {
			e.printStackTrace();
		}
		return output;
	}
	
	private static Cipher getCipher(int mode){
		//final byte[] keyBytes = getMoreSecuredKey();
		final byte[] keyBytes = new byte[24];
		final SecretKey secretKey = new SecretKeySpec(keyBytes, "DESede");
		final IvParameterSpec iv = new IvParameterSpec(new byte[8]);
		try {
			final Cipher cipher = Cipher.getInstance("DESede/CBC/PKCS5Padding");
			cipher.init(mode, secretKey, iv);
			return cipher;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	private static byte[] getMoreSecuredKey(){
		String originalKey = "BIG_CHANGE_IS_COMING"; //Any random key
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("md5");
			final byte[] md5digest = md.digest(originalKey.getBytes("utf-8"));
			final byte[] keyBytes = new byte[24];
			for (int x= 0;  x < 24; x++){
				if (x<16){
					keyBytes[x] = md5digest[x];}
				else{ 
					keyBytes[x] = 0x0;
				}
			}
			for (int j = 0,  k = 16; j < 8;){
				keyBytes[k++] = keyBytes[j++];
			}
			return keyBytes;
		}catch(Exception e) {
			e.printStackTrace();
		}
		return new byte[24];
	}

}
