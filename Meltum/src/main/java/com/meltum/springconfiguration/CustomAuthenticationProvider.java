package com.meltum.springconfiguration;

import java.util.ArrayList;
import java.util.List;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationProvider implements AuthenticationProvider {

		 @Override
		public Authentication authenticate(final Authentication authentication) throws AuthenticationException {
			
			
			// On récupère j_username et j_password
			final String name = authentication.getName();
			final String password = authentication.getCredentials().toString();
			
			if (name.equals("t") && password.equals("t")) {
	            final List<GrantedAuthority> grantedAuths = new ArrayList<>();
	            grantedAuths.add(new SimpleGrantedAuthority("ROLE_USER"));
	            return new UsernamePasswordAuthenticationToken(name, password, grantedAuths);
	        } else {
	            return null;
	        }
		}

		@Override
		public boolean supports(Class<?> authentication) {
			return authentication.equals(UsernamePasswordAuthenticationToken.class);
		}
}