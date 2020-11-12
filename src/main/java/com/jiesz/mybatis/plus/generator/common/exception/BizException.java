package com.jiesz.mybatis.plus.generator.common.exception;


import com.jiesz.mybatis.plus.generator.common.enums.CodeInterface;

/**
 * <p>Title: BizException</p>
 * <p>Description: 业务异常类</p>
 * <p>Company: 福建升腾资讯有限公司</p>
 *
 * @author XieNengYan
 * @version 1.0
 * @date 2020-03-06 13:48
 */
public class BizException extends RuntimeException {

	private static final long serialVersionUID = 1L;

	/**
	 * 错误码
	 */
	protected String errorCode;
	/**
	 * 错误信息
	 */
	protected String errorMsg;

	public BizException() {
		super();
	}

	public BizException(CodeInterface resultCode) {
		super(String.valueOf(resultCode.getCode()));
		this.errorCode = String.valueOf(resultCode.getCode());
		this.errorMsg = resultCode.getDesc();
	}

	public BizException(CodeInterface resultCode, Throwable cause) {
		super(String.valueOf(resultCode.getCode()), cause);
		this.errorCode = String.valueOf(resultCode.getCode());
		this.errorMsg = resultCode.getDesc();
	}

	public BizException(String errorMsg) {
		super(errorMsg);
		this.errorMsg = errorMsg;
	}

	public BizException(String errorCode, String errorMsg) {
		super(errorCode);
		this.errorCode = errorCode;
		this.errorMsg = errorMsg;
	}

	public BizException(String errorCode, String errorMsg, Throwable cause) {
		super(errorCode, cause);
		this.errorCode = errorCode;
		this.errorMsg = errorMsg;
	}


	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	@Override
	public String getMessage() {
		return errorMsg;
	}

	@Override
	public Throwable fillInStackTrace() {
		return this;
	}

}