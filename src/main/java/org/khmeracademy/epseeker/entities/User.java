package org.khmeracademy.epseeker.entities;

import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class User implements UserDetails{


private static final long serialVersionUID = 1L;
private int id;
private String email;
private String password;
private String username;
private boolean status;
private List<Role> roles;
private boolean accountNonExpired=true;
private boolean accountNonLocked=true;
private boolean credentialsNonExpired=true;
private boolean enabled =true;

public List<Role> getRoles() {
	return roles;
}
public void setRoles(List<Role> roles) {
	this.roles = roles;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public void setPassword(String password) {
	this.password = password;
}
public void setUsername(String username) {
	this.username = username;
}
@Override
public Collection<? extends GrantedAuthority> getAuthorities() {
	return roles;
}
@Override
public String getPassword() {
	return password;
}
@Override
public String getUsername() {
	return email;
}
@Override
public boolean isAccountNonExpired() {
	return accountNonExpired;
}
@Override
public boolean isAccountNonLocked() {
	return accountNonLocked;
}
@Override
public boolean isCredentialsNonExpired() {
	return credentialsNonExpired;
}
@Override
public boolean isEnabled() {
	return enabled;		
}
public boolean getStatus() {
	return status;
}
public void setStatus(boolean status) {
	this.status = status;
}
@Override
public String toString() {
	return "User [id=" + id + ", email=" + email + ", password=" + password + ", username=" + username + ", status="
			+ status + ", roles=" + roles + ", accountNonExpired=" + accountNonExpired + ", accountNonLocked="
			+ accountNonLocked + ", credentialsNonExpired=" + credentialsNonExpired + ", enabled=" + enabled + "]";
}

}
