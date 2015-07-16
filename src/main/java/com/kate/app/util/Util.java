package com.kate.app.util;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kate.app.dao.StarInfoDAO;
import com.kate.app.dao.VedioDAO;
import com.kate.app.model.StarInfo;
import com.kate.app.model.StarVedio;


public class Util {
	public String changeHtml(String detail){
		String detailNew = detail;
		detailNew = detailNew.replace("\n", "<br/>");
		detailNew = detailNew.replace(" ", "&nbsp;");
		return detailNew;
	}
}
