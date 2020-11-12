package com.jiesz.mybatis.plus.generator.common.exception;

/**
 * <p>Title: MethodArgumentNotValidException</p>
 * <p>Company: 福建升腾资讯有限公司</p>
 *
 * @author
 * @version 1.0
 * @date 2020-03-06 13:48
 */
public class AuthenticationException extends RuntimeException {

	private static final long serialVersionUID = 1L;


	public AuthenticationException() {
	}

	public AuthenticationException(String message) {
		super(message);
	}

	public AuthenticationException(String message, Throwable cause) {
		super(message, cause);
	}

	public AuthenticationException(Throwable cause) {
		super(cause);
	}

	public AuthenticationException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}
}
