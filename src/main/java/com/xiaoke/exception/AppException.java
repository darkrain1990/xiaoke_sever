/************************************************************************************
 * @File name   :      AddApplicationToLayOut.java
 *
 * @Author      :      "LiGang"
 *
 * @Date        :      2014-1-19
 *
 * @Copyright Notice: 
 * Copyright (c) 2011 SGM, Inc. All  Rights Reserved.
 * This software is published under the terms of the SGM Software
 * License version 1.0, a copy of which has been included with this
 * distribution in the LICENSE.txt file.
 * 
 * 
 * ----------------------------------------------------------------------------------
 * Date								Who					Version				Comments
 * 2014-1-19 上午11:21:36			    "LiGang"			1.0				    Initial Version
 ************************************************************************************/
package com.xiaoke.exception;

/**
 * Defines a custom application exception with its error code, description and
 * root cause.
 */
public class AppException extends Exception {

    // serial version id
    private static final long serialVersionUID = 9049160567189835471L;

    /**
     * Code be used to get the error message, which is defined in the related
     * error constants file
     */
    private String errorCode;

    /**
     * Holds the exception message description.
     */
    private String description;

    /**
     * Root cause of this exception
     */
    private Throwable cause;

    /**
     * Constructs the new exception object.
     * 
     * @param errCode
     *            a string containing the exception code.
     * @param description
     *            a string containing the exception description.
     */
    public AppException(String errCode, String description) {
        super(description);
        this.errorCode = errCode;
        this.description = description; 
    }

    /**
     * Constructs the new exception object.
     * 
     * @param errCode
     *            a string containing the exception code.
     * @param description
     *            a string containing the exception description.
     * @param cause
     *            an instance of Throwable to represent the root cause of
     *            exception.
     */
    public AppException(String errCode, String description, Throwable cause) {
        super(description,cause);
        this.errorCode = errCode;
        this.description = description;
        this.cause = cause;
    }

    /**
     * get error code of exception.
     * 
     * @Date : 2011-1-11
     * 
     * @return the errorCode
     */
    public String getErrorCode() {
        return errorCode;
    }

    /**
     * set error code of exception.
     * 
     * @Date : 2011-1-11
     * 
     * @param errorCode
     *            the errorCode to set
     */
    public void setErrorCode(String errorCode) {
        this.errorCode = errorCode;
    }

    /**
     * get description of exception.
     * 
     * @Date : 2011-1-11
     * 
     * @return the error message description.
     */
    public String getDescription() {
        return description;
    }

    /**
     * set description of exception.
     * 
     * @Date : 2011-1-11
     * 
     * @param description
     *            the error message description to set.
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * get root cause of current exception.
     * 
     * @Date : 2011-1-11
     * 
     * @return the root cause of exception.
     */
    public Throwable getCause() {
        return cause;
    }

    /**
     * set root cause of current exception.
     * 
     * @Date : 2011-1-11
     * 
     * @param cause
     *            the root cause of exception to set.
     */
    public void setCause(Throwable cause) {
        this.cause = cause;
    }

    /**
     * 
     * {@inheritDoc} overridden:
     * 
     * @Date : 2011-3-28
     * @see java.lang.Throwable#printStackTrace()
     * 
     */
    public void printStackTrace() {
        super.printStackTrace();
        if (this.cause != null) {
            System.err.println("<---- Caused by:");
            this.cause.printStackTrace();
            System.err.println("---->");
        }
    }

    /**
     * 
     * {@inheritDoc} overridden:
     * 
     * @Date : 2011-3-28
     * @see java.lang.Throwable#printStackTrace(java.io.PrintStream)
     * 
     */
    public void printStackTrace(java.io.PrintStream ps) {
        super.printStackTrace(ps);
        if (this.cause != null) {
            ps.println("<---- Caused by:");
            this.cause.printStackTrace(ps);
            ps.println("---->");
        }
    }

    /**
     * 
     * {@inheritDoc} overridden:
     * 
     * @Date : 2011-3-28
     * @see java.lang.Throwable#printStackTrace(java.io.PrintWriter)
     * 
     */
    public void printStackTrace(java.io.PrintWriter pw) {
        super.printStackTrace(pw);
        if (this.cause != null) {
            pw.println("<---- Caused by:");
            this.cause.printStackTrace(pw);
            pw.println("---->");
        }
    }

    /**
     * 
     * {@inheritDoc} overridden:
     * 
     * @Date : 2011-3-28
     * @see java.lang.Throwable#toString()
     * 
     */
    public String toString() {
        if (this.cause == null) {
            return super.toString();
        } else {
            return super.toString() + "<---- Caused by: " + cause.toString() + " ---->";
        }
    }
}
