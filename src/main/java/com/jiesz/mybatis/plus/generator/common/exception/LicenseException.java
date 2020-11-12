package com.jiesz.mybatis.plus.generator.common.exception;

/**
 * <p>Title: MethodArgumentNotValidException</p>
 * <p>Description: 授权证书异常类</p>
 * <p>Company: 福建升腾资讯有限公司</p>
 *
 * @author XieNengYan
 * @version 1.0
 * @date 2020-03-06 13:48
 */
public class LicenseException extends RuntimeException {

	private static final long serialVersionUID = 1L;


	public LicenseException() {
	}

	public LicenseException(String message) {
		super(message);
	}

	public LicenseException(String message, Throwable cause) {
		super(message, cause);
	}

	public LicenseException(Throwable cause) {
		super(cause);
	}

	public LicenseException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}
}
