package com.cbuddy.services;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.struts2.ServletActionContext;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.beans.Pdre;
import com.cbuddy.util.CBuddyConstants;
import com.cbuddy.util.NumberFormatterUtil;
import com.model.user.RealEstatePostDetails;

public class AdDetailsService {

	public Criteria getCriteriaForLocation(Criteria criteria, RealEstatePostDetails postDetails){

		List loc = new ArrayList();
		String obj[] = postDetails.getLocation().split(",");
		for(String str :obj){
			loc.add(str.trim());
		}
		criteria.add(Restrictions.in("location", loc));

		return criteria;
	}

	public Criteria getCriteriaForAmt(Criteria criteria, Pdre pdre){

		String obj[] = pdre.getAmt().split(",");
		Criterion  c1 = null;
		Criterion  c2 = null;
		Criterion  c3 = null;

		for(String str :obj){
			if(str.contains("<") ){
				str = NumberFormatterUtil.getNumericValue(str);				
				c1 =  Restrictions.le("priceValue", Double.parseDouble(str));
			}
			if(str.contains(">")){
				str = NumberFormatterUtil.getNumericValue(str);				
				c2 =  Restrictions.ge("priceValue", Double.parseDouble(str));
			}
			if(str.contains("-")){
				String res[] = str.split("-");
				String newRes[] = new String[2];
				for(int i=0;i<res.length;i++){
					newRes[i] = NumberFormatterUtil.getNumericValue(res[i]);
				}	
				c3 =  Restrictions.between("priceValue", Double.parseDouble(newRes[0]),Double.parseDouble(newRes[1]));
			}
		}

		if(c1!=null && c2!=null && c3!=null){
			LogicalExpression orExp = Restrictions.or(c1,c2);
			criteria.add(Restrictions.or(orExp, c3));
		}
		else if(c1!=null && c2!=null){
			LogicalExpression orExp = Restrictions.or(c1,c2);
			criteria.add(orExp);
		}
		else if(c2!=null && c3!=null){
			LogicalExpression orExp = Restrictions.or(c2,c3);
			criteria.add(orExp);
		}else if(c3!=null && c1!=null){
			LogicalExpression orExp = Restrictions.or(c1,c3);
			criteria.add(orExp);
		}
		else if(c1!=null ){
			criteria.add(c1);
		}
		else if(c2!=null){
			criteria.add(c2);
		}
		else if(c3!=null){
			criteria.add(c3);
		}

		return criteria;
	}

}
