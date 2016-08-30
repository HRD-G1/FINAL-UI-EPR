package org.khmeracademy.epseeker.entities;


import org.springframework.security.core.GrantedAuthority;


public class Role implements GrantedAuthority{

	private static final long serialVersionUID = 1L;
	private int id;
	private String roleName;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	@Override
	public String getAuthority() {
		return roleName;
	}

	@Override
	public String toString() {
		return "Role [id=" + id + ", roleName=" + roleName + "]";
	}
	
}
