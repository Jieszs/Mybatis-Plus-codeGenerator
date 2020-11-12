package com.jiesz.mybatis.plus.generator.common.bean;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.io.Serializable;

/**
 * <p>Title: BaseBean</p>
 * <p>Description: 基础bean类</p>
 *
 *
 *
 * @version 1.0
 * @date 2020-03-01 13:01
 */
public class BaseBean implements Serializable {

	private static final long serialVersionUID = -5651501467149731391L;

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this,
				ToStringStyle.MULTI_LINE_STYLE);
	}

}