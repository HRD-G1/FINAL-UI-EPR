package org.khmeracademy.epseeker.entities.service;

import javax.websocket.Session;

import org.khmeracademy.epseeker.entities.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
@Qualifier("myUserDetailImpl")
public class UserServiceDetailImpl implements UserDetailsService{

	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired
	private HttpHeaders headers;
	
	String baseUrl = "http://localhost:3333/rest/getuser";
	
	
	@Override
	public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
		HttpEntity<String> requestEntity = new HttpEntity<>(headers) ;
		ResponseEntity<User> response = restTemplate.exchange(baseUrl + "?email=" + email , HttpMethod.GET, requestEntity, User.class);
		System.out.println("=>"+response.getBody());
		User user = response.getBody();
		System.out.println("==>login : " + user);
	
		if(user==null)
			throw new UsernameNotFoundException("==>User not found!!!");
		System.out.println(user);
	

		return user;
	}
	
}
