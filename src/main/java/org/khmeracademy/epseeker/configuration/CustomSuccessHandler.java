//package org.khmeracademy.epseeker.configuration;
//
//import java.io.IOException;
//import java.util.ArrayList;
//import java.util.Collection;
//import java.util.List;
//
//import javax.servlet.ServletException;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;
//
//import org.khmeracademy.epseeker.entities.Role;
//import org.khmeracademy.epseeker.entities.User;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.GrantedAuthority;
//import org.springframework.security.core.context.SecurityContextHolder;
//import org.springframework.security.web.DefaultRedirectStrategy;
//import org.springframework.security.web.RedirectStrategy;
//import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
//import org.springframework.stereotype.Component;
//@Component("ajaxAuthenticationSuccessHandler")
//public class CustomSuccessHandler extends SimpleUrlAuthenticationSuccessHandler{
//	
//	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
//
//	@Override
//	public void onAuthenticationSuccess(HttpServletRequest request,
//			HttpServletResponse response, Authentication auth)
//			throws IOException, ServletException {
//	/*	System.out.println("xxxxx");
//		
//		HttpSession session = request.getSession();
//		User authUser = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();	
//		Role role = (Role) authUser.getRoles();
//		
//		session.setAttribute("username", authUser.getUsername());
//		session.setAttribute("roleID", role.getId());
//		// set our response to OK status
//		response.setStatus(HttpServletResponse.SC_OK);
//		handle(request, response, auth);*/
///*		response.getWriter().print(determineTargetUrl(auth));
//        response.getWriter().flush();
//        System.out.println("YYYYYY");*/
//	}
//
//	@Override
//	protected void handle(HttpServletRequest request,
//			HttpServletResponse response, Authentication auth)
//			throws IOException, ServletException {
//		// TODO Auto-generated method stub
//		String targetUrl = determineTargetUrl(auth);
//
//		if (response.isCommitted()) {
//			logger.debug("Response has already been committed. Unable to redirect to "
//					+ targetUrl);
//			return;
//		}
//
//		redirectStrategy.sendRedirect(request, response, targetUrl);
//	}
//
//	protected String determineTargetUrl(Authentication authentication) {
//		// TODO Auto-generated method stub
//		Collection<? extends GrantedAuthority> authorities = authentication.getAuthorities();
//		List<String> roles = new ArrayList<String>();
//
//		for (GrantedAuthority authority : authorities) {
//			System.out.println(authority.getAuthority());
//			roles.add(authority.getAuthority());
//		}
//		User user = (User) authentication.getPrincipal();
//		System.out.println("My test "+authorities);
//		if (roles.contains("ROLE_ADMIN")) {
//			return "/rest/admin/dashboard";
//		} else if (roles.contains("ROLE_USER")) {
//			return "/" + user.getId();
//		} else {
//			System.out.println("ACCESS DENIEDED PAGE");
//			return "";
//		}
//	}
//
//}
