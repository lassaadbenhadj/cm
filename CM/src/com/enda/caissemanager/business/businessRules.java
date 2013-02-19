package com.enda.caissemanager.business;

public class businessRules {

	public boolean roles_allowed_to_enter_backdated_trxn (Integer cmrole){
		boolean myReturnVar=false;
		if (cmrole.equals(1) || cmrole.equals(4)) {
			myReturnVar=true;
		}
		return myReturnVar;
	}
}
