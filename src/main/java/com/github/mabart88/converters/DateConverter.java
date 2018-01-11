package com.github.mabart88.converters;

import java.time.LocalDate;

import org.springframework.core.convert.converter.Converter;

public class DateConverter implements Converter<String, LocalDate> {

	@Override
	public LocalDate convert(String source) {
		
		if (source.matches("^((19[0-9][0-9])|(20[0-9][0-9]))-((0[0-9])|(1[0-2]))-(([0-2][0-9])|(3[0-1]))$")) {
			return LocalDate.parse(source);
		} else {
			return null;
		}
	}

}
