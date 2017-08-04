package com.java.projectCheck;

import javax.annotation.Resource;

import org.junit.Test;

import com.java1234.entity.ProjectCheck;
import com.java1234.service.ProjectCheckService;

public class projectCheck {
   @Resource
   private ProjectCheckService pcs;
   @Test
   public void testAdd() {
	   ProjectCheck pc=new ProjectCheck();
		pc.setProId(3);
		pc.setProName("3");
		pcs.add(pc);
   }
}
