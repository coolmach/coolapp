package com.cbuddy.util;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.LogicalExpression;
import org.hibernate.criterion.Restrictions;

import com.cbuddy.util.NumberFormatterUtil;
import com.model.user.RealEstatePostDetails;

public class CriteriaUtil {

	public static Criteria getCriteriaForLocation(Criteria criteria, String location){

		List loc = new ArrayList();
		String obj[] = location.split(",");
		for(String str :obj){
			loc.add(str.trim());
		}
		criteria.add(Restrictions.in("location", loc));

		return criteria;
	}

	public static Criteria getCriteriaForAmt(Criteria criteria, String amount, String dbFieldName){

		String obj[] = amount.split(",");
		Criterion  c1 = null;
		Criterion  c2 = null;
		Criterion  c3 = null;

		for(String str :obj){
			if(str.contains("<") ){
				str = NumberFormatterUtil.getNumericValue(str);				
				c1 =  Restrictions.le(dbFieldName, Double.parseDouble(str));
			}
			if(str.contains(">")){
				str = NumberFormatterUtil.getNumericValue(str);				
				c2 =  Restrictions.ge(dbFieldName, Double.parseDouble(str));
			}
			if(str.contains("-")){
				String res[] = str.split("-");
				String newRes[] = new String[2];
				for(int i=0;i<res.length;i++){
					newRes[i] = NumberFormatterUtil.getNumericValue(res[i]);
				}	
				c3 =  Restrictions.between(dbFieldName, Double.parseDouble(newRes[0]),Double.parseDouble(newRes[1]));
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

	public static Criteria getCriteriaForArea(Criteria criteria, String areaStr){
		String obj[] = areaStr.split(",");
		Criterion  c1 = null;
		Criterion  c2 = null;
		Criterion  c3 = null;

		for(String str :obj){
			if(str.contains("<") ){
				str = NumberFormatterUtil.getNumericValue(str);
				//Pattern pattern = Pattern.compile("\\w+([0-9]+)\\w+([0-9]+)");				
				c1 =  Restrictions.le("area", Integer.parseInt(str));
			}
			if(str.contains(">")){
				str = NumberFormatterUtil.getNumericValue(str);				
				c2 =  Restrictions.gt("area", Integer.parseInt(str));
			}
			if(str.contains("-")){
				String res[] = str.split("-");
				String newRes[] = new String[2];
				for(int i=0;i<res.length;i++){
					newRes[i] = NumberFormatterUtil.getNumericValue(res[i]);
				}	
				c3 =  Restrictions.between("area", Integer.parseInt(newRes[0]),Integer.parseInt(newRes[1]));
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
	

	public static Criteria createCriteriaForIn(Criteria criteria, String inputStr, String fieldName){
		List list = new ArrayList();
		String tokens[] = inputStr.split(",");
		for(String token:tokens){
			list.add(token);
		}
		criteria.add(Restrictions.in(fieldName, list));
		return criteria;
	}
}
