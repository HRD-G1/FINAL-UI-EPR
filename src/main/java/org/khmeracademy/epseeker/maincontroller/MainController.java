package org.khmeracademy.epseeker.maincontroller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping(value = { "/", "/index" })
	public String index() {
		return "index";
	}

	@RequestMapping(value = "/about")
	public String about() {
		return "about";
	}

	@RequestMapping(value = "/contact")
	public String contact() {
		return "contact";
	}

	@RequestMapping(value = "/login")
	public String lgoin() {
		return "login";
	}

	@RequestMapping(value = "/signup")
	public String register() {
		return "signup";
	}

	@RequestMapping(value = "/search")
	public String search() {
		return "search";
	}

	@RequestMapping(value = "rest/expert/content")
	public String expertContent() {
		return "expert/detail";
	}
	
	//login
	@RequestMapping(value="/error/access-denied")
	public String accessDeniedPage(){
		return "error/access-denied";
	}
	//login

	// Admin

	@RequestMapping(value = "/rest/admin/dashboard")
	public String admin() {
		return "admin/index";
	}

	@RequestMapping(value = "/rest/admin/expert/add")
	public String addExpert() {
		return "admin/expert/add/add-expert";
	}

	@RequestMapping(value = "/rest/admin/expert/view")
	public String viewExpert() {
		return "admin/expert/view/view-expert";
	}

	@RequestMapping(value = "/rest/admin/university/view")
	public String viewUniversity() {
		return "admin/university/view/view-university";
	}

	@RequestMapping(value = "/rest/admin/major/view")
	public String viewMajor() {
		return "admin/major/view/view-major";
	}

	@RequestMapping(value = "/rest/admin/mainskill/view")
	public String viewMainSkill() {
		return "admin/mainSkill/view/view-main-skill";
	}

	@RequestMapping(value = "/rest/admin/skill/view")
	public String viewSkill() {
		return "admin/skill/view/view-skill";
	}

	@RequestMapping(value = "/rest/admin/language/view")
	public String viewLanguage() {
		return "admin/language/view/view-language";
	}

	@RequestMapping(value = "rest/admin/institution/view")
	public String viewInstitution() {
		return "admin/institution/view/view-institution";
	}
	
	@RequestMapping(value = "rest/admin/position/view")
	public String viewPosition() {
		return "admin/position/view/view-position";
	}
	
	@RequestMapping(value = "rest/admin/filetype/view")
	public String viewFileType() {
		return "admin/file/view/view-file";
	}

	@RequestMapping(value = "rest/admin/country/view")
	public String viewCountry() {
		return "admin/country/view/view-country";
	}

	@RequestMapping(value = "rest/admin/province/view")
	public String viewProvince() {
		return "admin/province/view/view-province";
	}

	@RequestMapping(value = "rest/admin/district/view")
	public String viewDitrict() {
		return "admin/district/view/view-district";
	}

	@RequestMapping(value = "rest/admin/commune/view")
	public String viewCommune() {
		return "admin/commune/view/view-commune";
	}
	
	@RequestMapping(value = "rest/user/setting")
	public String userSetting() {
		return "users/setting";
	}
	
	@RequestMapping(value = "rest/user/promote")
	public String userPromote() {
		return "users/promote";
	}

}
