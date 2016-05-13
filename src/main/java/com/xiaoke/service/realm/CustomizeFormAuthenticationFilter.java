package com.xiaoke.service.realm;

import java.io.IOException;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;
import org.springframework.stereotype.Component;

@Component
public class CustomizeFormAuthenticationFilter extends FormAuthenticationFilter {

    @Override
    protected boolean onLoginSuccess(AuthenticationToken token, Subject subject, ServletRequest request,
            ServletResponse response) throws IOException {
        invalidateOldSession(request);
        WebUtils.issueRedirect(request, response, this.getSuccessUrl());
        return false;
    }

    private void invalidateOldSession(ServletRequest request) {
        HttpServletRequest httpRequest = ((HttpServletRequest) request);
        HttpSession oldSession = httpRequest.getSession();
        Map<String, Object> map = new HashMap<String, Object>();
        for (Enumeration<String> e = oldSession.getAttributeNames(); e.hasMoreElements();) {
            String name = e.nextElement();
            map.put(name, oldSession.getAttribute(name));
        }

        oldSession.invalidate();
        HttpSession newSession = httpRequest.getSession(true);
        for (Entry<String, Object> e : map.entrySet()) {
            newSession.setAttribute(e.getKey(), e.getValue());
        }
    }

    @Override
    protected boolean onLoginFailure(AuthenticationToken token, AuthenticationException e, ServletRequest request,
            ServletResponse response) {
        return super.onLoginFailure(token, e, request, response);
    }

}
