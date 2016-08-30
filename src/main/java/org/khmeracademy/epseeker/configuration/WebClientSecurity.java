package org.khmeracademy.epseeker.configuration;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;

@Configuration
@EnableWebSecurity
public class WebClientSecurity extends WebSecurityConfigurerAdapter{
	/*
	@Autowired	
	@Qualifier("ajaxAuthenticationSuccessHandler")
	private CustomSuccessHandler successHandler;*/
	
	@Autowired
	@Qualifier("myUserDetailImpl")
	private UserDetailsService userDetailsService;

		@Override
		protected void configure(AuthenticationManagerBuilder auth) throws Exception {
			auth.userDetailsService(userDetailsService);
		}
		
		@Override
		protected void configure(HttpSecurity http) throws Exception {
			http.csrf().disable();
			
			http.formLogin()
				.loginPage("/login")
				.usernameParameter("email")
				.passwordParameter("password")
				.defaultSuccessUrl("/")
			/*	.successHandler(successHandler)
*/				.permitAll();
			
			http.authorizeRequests()
				.antMatchers("/rest/admin/**").hasRole("ADMIN")
				.antMatchers("/rest/expert/**").hasAnyRole("ADMIN","USER")
				.antMatchers("/rest/user/**").hasAnyRole("ADMIN","USER");
			http.exceptionHandling().accessDeniedPage("/error/access-denied");
		}
}
